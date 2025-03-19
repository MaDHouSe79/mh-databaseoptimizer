--[[ ===================================================== ]]--
--[[        MH Database Optimizer Script by MaDHouSe       ]]--
--[[ ===================================================== ]]--
local QBCore = exports['qb-core']:GetCoreObject()
local colors, messages = { green = "^2", red = "^1" }, {}
local unusedInventories, unusedVehicles, givingKeys, deletingKeys, countPlayers = 0, 0, 0, 0, 0
local persistentKeys, script = Config.PersistentKeys, GetCurrentResourceName()

-- Player Metadata Optimizer
local function OptimizeMetadata()
    local players = MySQL.query.await('SELECT * FROM players')
    local vehicles = MySQL.query.await('SELECT * FROM player_vehicles')
    for _, player in pairs(players) do
        local metadata = json.decode(player.metadata)
        if metadata.vehicleKeys ~= nil then
            for key, value in pairs(metadata.vehicleKeys) do
                if value then deletingKeys += 1 end
            end
            metadata.vehicleKeys = {}
            for _, vehicle in pairs(vehicles) do
                if vehicle.citizenid == player.citizenid and not metadata.vehicleKeys[vehicle.plate] and persistentKeys then
                    metadata.vehicleKeys[vehicle.plate] = true
                    givingKeys += 1
                end
            end
            countPlayers += 1
            MySQL.Async.execute("UPDATE players SET metadata = ? WHERE citizenid = ?", {json.encode(metadata), player.citizenid})
        end
    end
    local color1, color2 = colors.green, colors.green
    if deletingKeys >= 1 then color1 = colors.red else color1 = colors.green end
    if givingKeys >= 1 then color2 = colors.green else color2 = colors.red end
    local playersTxt = "player"
    if countPlayers > 1 or countPlayers <= 0 then playersTxt = "players" end
    messages[#messages + 1] = color1..deletingKeys.."^0 old keys and give "..color2..givingKeys.."^0 new keys to "..color2..countPlayers.."^0 "..playersTxt
end

-- Player Vehicles Optimizer
local function OptimizeVehicles()
    local vehicles = MySQL.query.await('SELECT * FROM player_vehicles')
    for _, v in pairs(vehicles) do
        if not QBCore.Shared.Vehicles[v.vehicle] then
            MySQL.Async.execute('DELETE FROM player_vehicles WHERE vehicle = ?', { v.vehicle })
            unusedVehicles = unusedVehicles + 1
        end
    end
    if unusedVehicles >= 1 then color = colors.red else color = colors.green end
    messages[#messages + 1] = color.. unusedVehicles .. "^0 vehicles that players has and no longer exist on the server."
    OptimizeMetadata()
end

-- Inventory Stashes/Trunks/Dumpsters Optimizer
local function OptimizeInventory()
    local inventories = MySQL.query.await('SELECT * FROM inventories')
    for _, inventory in pairs(inventories) do
        if not Config.IgnoreInventoryNames[inventory.identifier] then
            local items = json.decode(inventory.items)
            if #items <= 0 or items == '[]' then
                MySQL.Async.execute('DELETE FROM inventories WHERE identifier = ?', { inventory.identifier })
                unusedInventories = unusedInventories + 1
            end
        end
    end
    if unusedInventories >= 1 then color = colors.red else color = colors.green end
    messages[#messages + 1] = color..unusedInventories .. "^0 inventories like Stashes/Trunks/Dumpsters that are unused or has no items."
    OptimizeVehicles()
end

local function Optimize()
    if GetResourceState("qb-inventory") ~= 'missing' then
        OptimizeInventory()
    else
        OptimizeVehicles()
    end
end

local function RunOptimizers()
    Optimize()
    Wait(1000)
    for _, message in pairs(messages) do
        print("^0[^2" .. script:upper() .. "^0] - Removed "..message)
    end
end

AddEventHandler('onResourceStart', function(resource)
    if resource == GetCurrentResourceName() then
        Wait(2000)
        RunOptimizers()
    end
end)