fx_version 'bodacious'
games { 'gta5' }

author 'Erratic'
description 'erratic_coke'
version '1.0.0'

client_scripts {
	"lib/Proxy.lua",
	"lib/Tunnel.lua",
	'serverCallbackLib/client.lua',
	'config.lua',
    'client/erratic_coke_cl.lua'
}

server_scripts {
	"@vrp/lib/utils.lua",
	'serverCallbackLib/server.lua',
	'config.lua',
    'server/erratic_coke_sv.lua'
}

dependency "vrp"
