local QBCore, isLoggedIn = exports['qb-core']:GetCoreObject(), false
local fixing, pressed, blips = false, false, {}

local function HintToDisplay(text)
    SetTextComponentFormat("STRING")
    AddTextComponentString(text)
    DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end

local function Notify(message, type, length)
    if Config.NotifyScript == "ox_lib" and GetResourceState(Config.NotifyScript) ~= 'missing' then
        lib.notify({title = "MH Repair Stations", description = message, type = type})
    elseif Config.NotifyScript == "k5_notify" and GetResourceState(Config.NotifyScript) ~= 'missing' then
        exports["k5_notify"]:notify("MH Repair Stations", message, "k5style", length)
    elseif Config.NotifyScript == "okokNotify" and GetResourceState(Config.NotifyScript) ~= 'missing' then
        exports['okokNotify']:Alert("MH Repair Stations", message, length, type)
    elseif Config.NotifyScript == "Roda_Notifications" and GetResourceState(Config.NotifyScript) ~= 'missing' then
        exports['Roda_Notifications']:showNotify("MH Repair Stations", message, type, length)
    end
end

local function DeteteBlips()
    for k, blip in pairs(blips) do
        if DoesBlipExist(blip) then
            RemoveBlip(blip)
        end
    end
    blips = {}
end

local function CreateBlips()
    for i = 1, #Config.Stations, 1 do
        local blip = AddBlipForCoord(Config.Stations[i].coords.x, Config.Stations[i].coords.y, Config.Stations[i].coords.z)
        SetBlipSprite(blip, Config.Stations[i].blip.sprite)
        SetBlipDisplay(blip, Config.Stations[i].blip.display)
        SetBlipScale(blip, Config.Stations[i].blip.scale)
        SetBlipColour(blip, Config.Stations[i].blip.colour)
        SetBlipAsShortRange(blip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentSubstringPlayerName(Lang:t('company.name'))
        EndTextCommandSetBlipName(blip)
        blips[#blips + 1] = blip
    end
end

local function GetDistance(pos1, pos2)
    return #(vector3(pos1.x, pos1.y, pos1.z) - vector3(pos2.x, pos2.y, pos2.z))
end

local function RepairVehicle(target, repairTime)
    fixing = true
    FreezeEntityPosition(target, true)
    Notify(Lang:t('info.repair_processing'), 'primary', repairTime)
    TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 5.0, 'car_repair', 0.7)
    if lib.progressCircle({duration = repairTime, position = 'bottom', useWhileDead = false, canCancel = false, disable = {car = true}}) then
        SetVehicleFixed(target)
        SetVehicleEngineHealth(target, 1000.0)
        SetVehicleBodyHealth(target, 1000.0)
        SetVehiclePetrolTankHealth(target, 1000.0)
        SetVehicleDirtLevel(target, 0)
        SetVehicleOnGroundProperly(target)
        FreezeEntityPosition(target, false)
        fixing = false
    else
        fixing = false
    end
end

AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    CreateBlips()
    isLoggedIn = true
end)

AddEventHandler('QBCore:Client:OnPlayerUnload', function()
    DeteteBlips()
    isLoggedIn = false
    lib.hideTextUI()
end)

AddEventHandler('onResourceStart', function(resource)
    if resource == GetCurrentResourceName() then
        CreateBlips()
        isLoggedIn = true
        lib.hideTextUI()
    end
end)

AddEventHandler('onResourceStop', function(resource)
    if resource == GetCurrentResourceName() then
        DeteteBlips()
        isLoggedIn = false
        lib.hideTextUI()
    end
end)

CreateThread(function()
    while true do
        local sleep = 1000
        if isLoggedIn then            
            if IsPedInAnyVehicle(PlayerPedId(), false) then
                sleep = 500
                for k, v in pairs(Config.Stations) do
                    local pos = GetEntityCoords(PlayerPedId(), true)
                    local coords = vector3(v.coords.x, v.coords.y, v.coords.z)
                    if not fixing then
                        if (GetDistance(pos, coords) < 100) then
                            sleep = 10
                            if (GetDistance(pos, coords) < 2.5) then
                                if not v.cost then
                                    if not pressed then lib.showTextUI(Lang:t('info.press_repair_free')) else lib.hideTextUI() end
                                    if IsControlJustPressed(0, 38) then
                                        pressed = true
                                        SetPedCoordsKeepVehicle(PlayerPedId(), coords.x, coords.y, coords.z)
                                        RepairVehicle(GetVehiclePedIsIn(PlayerPedId(), false), v.repairTime)
                                        Notify(Lang:t('company.done_repair'), "primary", v.repairTime)
                                    end
                                elseif v.cost then
                                    if not pressed then lib.showTextUI(Lang:t('info.press_repair_cost', {amount = v.cost})) else lib.hideTextUI() end
                                    if IsControlJustPressed(0, 38) then
                                        pressed = true
                                        QBCore.Functions.TriggerCallback("qb-repairstations:server:pay", function(cb)
                                            if cb.state then
                                                SetPedCoordsKeepVehicle(PlayerPedId(), coords.x, coords.y, coords.z)
                                                RepairVehicle(GetVehiclePedIsIn(PlayerPedId(), false), v.repairTime)
                                                Notify(cb.message, "primary", v.repairTime)
                                            else
                                                SetPedCoordsKeepVehicle(PlayerPedId(), coords.x, coords.y, coords.z)
                                            end
                                        end, v.cost)
                                    end
                                end
                            elseif (GetDistance(pos, coords) > 2.5) then
                                pressed = false
                            end
                        end
                    end
                end
            end
        end
        Wait(sleep)
    end
end)