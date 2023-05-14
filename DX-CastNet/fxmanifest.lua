fx_version "cerulean"
game "gta5"
version "0.3 Fix System"
description 'Developed by ! D X H I G H#1999'

shared_scripts {
    "config.lua",
    "@ox_lib/init.lua" -- ถ้าไม่ใช้ให้ขีดทิ้ง --"@ox_lib/init.lua"
}

client_scripts {
    "Code/client.lua",
    "locales/th.lua"
}

server_scripts {
    "Code/server.lua",
    "locales/th.lua"
}

dependency 'es_extended'
lua54 'on'
