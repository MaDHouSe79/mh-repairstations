Config = {}

Config.NotifyScript = "ox_lib" -- default ox_lib or use k5_notify/okokNotify/Roda_Notifications

-- if you want repair for free, set cost to false
Config.Stations = {
    {
        cost = 1500,
        repairTime = 5000,
        coords = vector3(-36.52, -1088.55, 26.02),
        blip = {enable = true, sprite = 402, display = 4, scale = 0.8, colour = 47}
    }, {
        cost = 1500,
        repairTime = 5000,
        coords = vector3(-211.15, -1323.98, 30.49),
        blip = {enable = true, sprite = 402, display = 4, scale = 0.8, colour = 47}
    }, {
        cost = 1500,
        repairTime = 5000,
        coords = vector3(1028.67, -2299.63, 30.51),
        blip = {enable = true, sprite = 402, display = 4, scale = 0.8, colour = 47}
    }, {
        cost = false,
        repairTime = 5000,
        coords = vector3(-1021.36, -3485.06, 13.44),
        blip = {enable = true, sprite = 402, display = 4, scale = 0.8, colour = 47}
    }, {
        cost = false,
        repairTime = 5000,
        coords = vector3(1234.26, 344.1, 81.29),
        blip = {enable = true, sprite = 402, display = 4, scale = 0.8, colour = 47}
    }, {
        cost = false,
        repairTime = 5000,
        coords = vector3(447.24, -992.39, 25.73),
        blip = {enable = true, sprite = 402, display = 4, scale = 0.8, colour = 47}
    }, {
        cost = 1500,
        repairTime = 5000,
        coords = vector3(-370.26, -107.92, 38.27),
        blip = {enable = true, sprite = 402, display = 4, scale = 0.8, colour = 47}
    }, {
        cost = 1500,
        repairTime = 5000,
        coords = vector3(-83.45, 80.48, 71.12),
        blip = {enable = true, sprite = 402, display = 4, scale = 0.8, colour = 47}
    }
}
