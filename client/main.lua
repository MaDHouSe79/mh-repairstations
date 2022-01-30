Citizen.CreateThread(function()	
    while true do
	Citizen.Wait(5)	
	local playerPed = GetPlayerPed(-1)
	local pos       = GetEntityCoords(playerPed, true)		
	for k,v in pairs(Config.Stations) do
	    if not fixing then
		if (Vdist(pos.x, pos.y, pos.z, v.x, v.y, v.z) < 100) then
		    if IsPedInAnyVehicle(playerPed, false) then
			DrawMarker(36, v.x, v.y, v.z+1.1, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 2.0, 5.0, 1.0, 255, 0, 0, 100, true, true, 2, true, false, false, false)
			DrawMarker(0, v.x, v.y, v.z-0.4, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 5.0, 5.0, 1.0, 255, 255, 0, 100, false, false, 2, false, false, false, false)
			if (Vdist(pos.x, pos.y, pos.z, v.x, v.y, v.z) < 2.5) then							
			    position = k
			    if v.cost == false then
				hintToDisplay(Lang:t('info.press_repair_free'))
				if IsControlJustPressed(0, Config.RepairButton) then	-- E
				    TriggerEvent('qb-carfixstation:client:fixCar', Config.Stations[k].repairTime)
				    QBCore.Functions.Notify(cb.message, "primary",  Config.Stations[k].repairTime)						
				    SetPedCoordsKeepVehicle(playerPed, v.x, v.y, v.z)
				end								
			    else
				hintToDisplay(Lang:t('info.press_repair_cost', {amount = v.cost}))
				if IsControlJustPressed(0, Config.RepairButton) then	-- E
				    QBCore.Functions.TriggerCallback("qb-carfixstation:server:pay", function(cb)
				        if cb.state then
					    SetPedCoordsKeepVehicle(playerPed, v.x, v.y, v.z)
					    TriggerEvent('qb-carfixstation:client:fixCar', Config.Stations[k].repairTime)		
					    QBCore.Functions.Notify(cb.message, "primary",  Config.Stations[k].repairTime)
					else
					    SetPedCoordsKeepVehicle(playerPed, v.x, v.y, v.z)
				        end
			            end, v.cost)
		                end																
		            end
	                end
	            end
	        end
            else		
	        if position == k then
	            DrawMarker(27, v.x, v.y, v.z + zcoords+0.6, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 5.0, 5.0, 1.0, 255, 0+mcolor, 0, 255, false, false, 2, true, false, false, false)
		    DrawMarker(23, v.x, v.y, v.z + zcoords, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 5.0, 5.0, 1.0, 255, 0+mcolor, 0, 255, false, false, 2, true, false, false, false)
		    DrawMarker(27, v.x, v.y, v.z + zcoords-0.6, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 5.0, 5.0, 1.0, 255, 0+mcolor, 0, 255, false, false, 2, true, false, false, false)
	       else
		    DrawMarker(36, v.x, v.y, v.z+1.1, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 2.0, 5.0, 1.0, 255, 0, 0, 100, true, true, 2, true, false, false, false)
		    DrawMarker(0, v.x, v.y, v.z-0.4, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 5.0, 5.0, 1.0, 255, 255, 0, 100, false, false, 2, false, false, false, false)							
	       end
           end
        end
    end
end)
