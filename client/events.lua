RegisterNetEvent('qb-carfixstation:client:markAnimation', function()
    while true do
	Citizen.Wait(25)	
	if fixing then
            if zcoords < 0.5 and not turn then
		zcoords = zcoords + 0.03
		mcolor = mcolor + 2
	    else
		turn = true
		zcoords = zcoords - 0.051
		mcolor = mcolor + 2
		if zcoords <= -0.4 then
		    turn = false
		end
            end
	else
	break
	end
    end
end)

function RepairVehicle(target, repairTime)
    local playerPed = GetPlayerPed(-1)
    local vehicle = GetVehiclePedIsIn(playerPed, false)
    fixing = true
    FreezeEntityPosition(target, true)	
    TriggerEvent('qb-carfixstation:client:markAnimation')	
    sendNotification(Lang:t('system.repair_processing'), 'primary', repairTime)
    if Config.EnableSoundEffect == true then
        TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 5.0, 'car_repair', 0.7)
    end
    Wait(repairTime)
    Citizen.Wait(1000)
    SetVehicleFixed(target)
    SetVehicleEngineHealth(target, 1000.0)
    SetVehicleBodyHealth(target, 1000.0)
    SetVehiclePetrolTankHealth(target, 1000.0)
    SetVehicleDirtLevel(target, 0)
    SetVehicleOnGroundProperly(target)	
    fixing = false
    FreezeEntityPosition(target, false)	
end

RegisterNetEvent('qb-carfixstation:client:fixCar', function(repairTime)
    local playerPed = GetPlayerPed(-1)
    local vehicle   = GetVehiclePedIsIn(playerPed, false)
    fixing = true
    RepairVehicle(vehicle, repairTime)
    hintToDisplay(Lang:t('system.repaired'))
    zcoords, mcolor, turn = 0.0, 0, false
end)
