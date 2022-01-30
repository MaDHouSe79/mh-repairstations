local function SocietyAccount(amount)
    if Config.UseSocietyAccount then 
        TriggerEvent('qb-bossmenu:server:addAccountMoney', Config.SocietyAccount, amount)
    end
end

QBCore.Functions.CreateCallback('qb-carfixstation:server:pay', function(source, cb, cost)
    if QBCore.Functions.GetPlayer(source).Functions.RemoveMoney("cash", amount, "repair-station") then
	if state then
	    SocietyAccount(cost)
	end
	cb({
	    state   = true,
	    message = Lang:t('company.cost_repair', {amount = cost})
	})
    else
	if QBCore.Functions.GetPlayer(source).Functions.RemoveMoney("bank", amount, "repair-station") then
	    if state then
	    	SocietyAccount(cost)
	    end
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
