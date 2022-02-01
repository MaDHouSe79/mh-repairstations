local function SocietyAccount(amount)
    if Config.UseSocietyAccount then 
        TriggerEvent('qb-bossmenu:server:addAccountMoney', Config.SocietyAccount, amount)
    end
end

QBCore.Functions.CreateCallback('qb-repairstations:server:pay', function(source, cb, cost)
    if QBCore.Functions.GetPlayer(source).Functions.RemoveMoney("cash", cost, "repair-station") then
		SocietyAccount(cost)
		cb({
			state   = true,
			message = Lang:t('company.cost_repair', {amount = cost})
		})
		else
		if QBCore.Functions.GetPlayer(source).Functions.RemoveMoney("bank", cost, "repair-station") then
			SocietyAccount(cost)
			cb({
				state   = true,
				message = Lang:t('company.cost_repair', {amount = cost})
			})
		else
			cb({
				state   = false,
				message = Lang:t('company.not_enough_money')
			})
		end
    end
end)
