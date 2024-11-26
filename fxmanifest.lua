fx_version 'cerulean'
game 'gta5'

description 'MH-Repairstations'
repository 'https://github.com/MaDHouSe79/mh-repairstations'
version '1.0.0'

shared_scripts {
    '@ox_lib/init.lua',
    'shared/locale.lua',
    'locales/en.lua', -- change en to your language
    'shared/config.lua',
}

client_scripts {'client/main.lua'}
server_scripts {'server/main.lua', 'server/update.lua'}
dependencies {'mh-core', 'ox_lib'}

lua54 'yes'
