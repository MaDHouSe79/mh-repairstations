Config                   = {}
Config.SocietyAccount    = 'mechanic'  -- Society account job name
Config.UseSocietyAccount = true        -- if you want to use Society Account

Config.EnableSoundEffect = false       -- if you want to use sound effects (you need the interact-sound mod for this: https://github.com/qbcore-framework/interact-sound)
Config.RepairButton      = 38          -- E - To change go to: https://docs.fivem.net/docs/game-references/controls/

Config.Blips             = true        -- to display blibs on ypur map
Config.BlipSprite        = 402         -- To change go to: https://docs.fivem.net/docs/game-references/blips/
Config.BlipDisplay       = 4           
Config.BlipScale         = 0.8
Config.BlipColour        = 47          -- To change go to: https://docs.fivem.net/docs/game-references/blips/ (scroll down)
Config.BlipAsShortRange  = true 

Config.Stations          = {           -- if you want repair for free, set cost to false
    { x = -36.52,   y = -1088.55, z = 26.02, cost = 1500,  repairTime = 5000 },
    { x = -211.15,  y = -1323.98, z = 30.49, cost = 1500,  repairTime = 5000 },
    { x = 1028.67,  y = -2299.63, z = 30.51, cost = 1500,  repairTime = 5000 },
    { x = -1021.36, y = -3485.06, z = 13.44, cost = false, repairTime = 5000 },
    { x = 1234.26,  y = 344.1,    z = 81.29, cost = false, repairTime = 5000 },
    { x = 447.24,   y = -992.39,  z = 25.73, cost = false, repairTime = 5000 },
    { x = -370.26,  y = -107.92,  z = 38.27, cost = 1500,  repairTime = 5000 },
    { x = -83.45,   y = 80.48,    z = 71.12, cost = 1500,  repairTime = 5000 },
}
