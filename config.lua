
-- This will ignore inventories that are empty but used.
Config.IgnoreInventoryNames = {
    ["delivery_weed_stash"] = true,
    ["delivery_weed_owner_stash"] = true,
    ["delivery_coke_stash"] = true,
    ["delivery_coke_owner_stash"] = true,
    ["delivery_meth_stash"] = true,
    ["delivery_meth_owner_stash"] = true,
    -- Add more as needed
}

Config.NonActiveDays = 60
Config.PlayerTables = { 
    { table = 'players' },
    { table = 'apartments' },
    { table = 'bank_accounts' },
    { table = 'crypto_transactions' },
    { table = 'phone_invoices' },
    { table = 'phone_messages' },
    { table = 'playerskins' },
    { table = 'player_contacts' },
    { table = 'player_houses' },
    { table = 'player_mails' },
    { table = 'player_outfits' },
    { table = 'player_vehicles' },
    -- Add tables as needed
}
