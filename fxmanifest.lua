fx_version 'cerulean'
games { 'gta5' }

author 'Bo Ek'
description 'Car Part Delivery Job'
version '1.0.0'

client_scripts {
  '@PolyZone/client.lua',
  '@PolyZone/BoxZone.lua',
  '@PolyZone/EntityZone.lua',
  '@PolyZone/CircleZone.lua',
  '@PolyZone/ComboZone.lua',
    'client/main.lua',
}

server_script { 'server/main.lua',
}

shared_script {
    'Config.lua'
}