ESX = nil

TriggerEvent('::{korioz#0110}::esx:getSharedObject', function(obj) ESX = obj end)


RegisterNetEvent('ZouwaBuyEau')
AddEventHandler('ZouwaBuyEau', function()

    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)  
    local price = 8
	local xPlayers = ESX.GetPlayers()

	if xPlayer.getAccount('bank').money >= price then

        xPlayer.removeAccountMoney('bank', price)
        xPlayer.addInventoryItem('water', 1)
        TriggerClientEvent('::{korioz#0110}::esx:showNotification', source, "Vous avez acheté une ~b~bouteille d'eau")
    else
         TriggerClientEvent('::{korioz#0110}::esx:showNotification', source, "Vous n'avez assez ~r~d\'argent")
    end
end)

RegisterNetEvent('ZouwaBuycoca')
AddEventHandler('ZouwaBuycoca', function()

    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)  
    local price = 8
	local xPlayers = ESX.GetPlayers()

	if xPlayer.getAccount('bank').money >= price then

        xPlayer.removeAccountMoney('bank', price)
        xPlayer.addInventoryItem('coca', 1)
        TriggerClientEvent('::{korioz#0110}::esx:showNotification', source, "Vous avez acheté une ~b~Canettre de Coca Cola")
    else
         TriggerClientEvent('::{korioz#0110}::esx:showNotification', source, "Vous n'avez assez ~r~d\'argent")
    end
end)


RegisterNetEvent('ZouwaBuybread')
AddEventHandler('ZouwaBuybread', function()

    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)  
    local price = 10
	local xPlayers = ESX.GetPlayers()

	if xPlayer.getAccount('bank').money >= price then

        xPlayer.removeAccountMoney('bank', price)
        xPlayer.addInventoryItem('bread', 1)
        TriggerClientEvent('::{korioz#0110}::esx:showNotification', source, "Vous avez acheté un ~b~pain")
    else
         TriggerClientEvent('::{korioz#0110}::esx:showNotification', source, "Vous n'avez assez ~r~d\'argent")
    end
end)

RegisterNetEvent('ZouwaBuyburger')
AddEventHandler('ZouwaBuyburger', function()

    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)  
    local price = 10
	local xPlayers = ESX.GetPlayers()

	if xPlayer.getAccount('bank').money >= price then

        xPlayer.removeAccountMoney('bank', price)
        xPlayer.addInventoryItem('burger', 1)
        TriggerClientEvent('::{korioz#0110}::esx:showNotification', source, "Vous avez acheté un ~b~Burger")
    else
         TriggerClientEvent('::{korioz#0110}::esx:showNotification', source, "Vous n'avez assez ~r~d\'argent")
    end
end)


RegisterNetEvent('ZouwaBuyPhone')
AddEventHandler('ZouwaBuyPhone', function()

    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)  
    local price = 500
	local xPlayers = ESX.GetPlayers()

	if xPlayer.getAccount('bank').money >= price then

        xPlayer.removeAccountMoney('bank', price)
        xPlayer.addInventoryItem('phone', 1)
        TriggerClientEvent('::{korioz#0110}::esx:showNotification', source, "Vous avez acheté un ~b~Téléphone")
    else
         TriggerClientEvent('::{korioz#0110}::esx:showNotification', source, "Vous n'avez assez ~r~d\'argent")
    end
end)


