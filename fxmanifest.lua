fx_version 'cerulean'
game 'gta5'

description 'QB-Repairstations'
version '1.0.0'

shared_scripts {
    '@qb-core/shared/locale.lua',
    'locales/en.lua', -- change en to your language
    'shared/config.lua',
	'shared/variables.lua',
}

client_script {
    'client/functions.lua',
    'client/events.lua',
    'client/main.lua',
}

server_script {
    'server/main.lua',
}

lua54 'yes'