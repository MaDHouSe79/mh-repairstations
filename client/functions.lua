function hintToDisplay(text)
    SetTextComponentFormat("STRING")
    AddTextComponentString(text)
    DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end

function sendNotification(message, type, timeout)
    QBCore.Functions.Notify(message, type, timeout)
end

if Config.Blips then
    Citizen.CreateThread(function()
        for i=1, #Config.Stations, 1 do
	    local blip = AddBlipForCoord(Config.Stations[i].x, Config.Stations[i].y, Config.Stations[i].z)
	    SetBlipSprite(blip, Config.BlipSprite)
	    SetBlipDisplay(blip, Config.BlipDisplay)
	    SetBlipScale  (blip, Config.BlipScale)
	    SetBlipColour (blip, Config.BlipColour)
	    SetBlipAsShortRange(blip, Config.BlipAsShortRange)
	    BeginTextCommandSetBlipName("STRING")
	    AddTextComponentSubstringPlayerName(Lang:t('company.name'))
	    EndTextCommandSetBlipName(blip)
        end
    end)
end
