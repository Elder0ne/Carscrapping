fx_version 'cerulean'
games { 'gta5' }

author 'Bo Ek'
description 'Car Part Delivery Job'
version '1.0.1'

-- What to run
client_scripts {
    '@PolyZone/BoxZone.lua',
    'client/main.lua',
}

server_script { 'server/main.lua',
}

shared_script {
    'Config.lua'
}