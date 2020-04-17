ESX 						   = nil


TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('milomarSchowek:wez')
AddEventHandler('milomarSchowek:wez', function(item)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local iloscPrzycisk = xPlayer.getInventoryItem('panic').count
	if xPlayer.job.name == 'police' then
	if iloscPrzycisk == 0 then
		xPlayer.addInventoryItem('panic', 1)
		TriggerClientEvent('milomarSchowek:animacja', source)
		TriggerClientEvent('esx:showNotification', source, '~g~Wziąłeś przycisk zagrożenia')
	else
		TriggerClientEvent('esx:showNotification', source, '~r~Już masz przycisk zagrożenia!')
	end
end
end)

