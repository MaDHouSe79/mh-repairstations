local QBCore = exports['qb-core']:GetCoreObject()

QBCore.Functions.CreateCallback('qb-repairstations:server:pay', function(source, cb, cost)
	local src = source
    if QBCore.Functions.GetPlayer(src).Functions.RemoveMoney("cash", cost, "repair-station") then
        cb({state = true, message = Lang:t('company.cost_repair', {amount = cost})})
    else
        if QBCore.Functions.GetPlayer(src).Functions.RemoveMoney("bank", cost, "repair-station") then
            cb({state = true, message = Lang:t('company.cost_repair', {amount = cost})})
        else
            cb({state = false, message = Lang:t('company.not_enough_money')})
        end
    end
end)