ESX = nil


TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('milomarEMS:sprawdz')
AddEventHandler('milomarEMS:sprawdz', function()
local xPlayers = ESX.GetPlayers()
local cops = 0
for i=1, #xPlayers, 1 do
	 local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
	 if xPlayer.job.name == 'ambulance' then
			cops = cops + 1
	end
end

      if cops == 0 then 
      	TriggerClientEvent('esx:showNotification', source, '~r~Brak medyków na służbie')
      elseif cops == 1 then 
        TriggerClientEvent('esx:showNotification', source, '~b~Na służbie obecnie jest '.. cops .. " medyk")
      else 
      	TriggerClientEvent('esx:showNotification', source, '~b~Na służbie obecnie jest '.. cops .. " medyków")
      end



end)

