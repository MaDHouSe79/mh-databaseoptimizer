--[[ ===================================================== ]]--
--[[        MH Database Optimizer Script by MaDHouSe       ]]--
--[[ ===================================================== ]]--
fx_version 'cerulean'
games { 'gta5' }
repository 'https://github.com/MaDHouSe79/mh-databaseoptimizer'
author 'MaDHouSe79'
description 'MH Database Optimize - Optimize Fivem QB Database.'
version '1.0.0'

server_only 'yes'

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    '@qb-vehiclekeys/config.lua',
    'config.lua',
    'server/main.lua',
    'server/update.lua',
}

lua54 'yes'