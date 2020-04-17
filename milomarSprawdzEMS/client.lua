ESX 			    			= nil
local marker   = 1
local MarkerColor    = { r = 255, g = 0, b = 0 }
--local gazeta         = { x = 448.47, y = -988.41, z = 30.69 }

local blips = {
  {name="Hospital", id=80, x= 312.29, y= -595.64, z= 42.3, color= 1},
  {name="Hospital", id=80, x= 268.71, y= -1357.75, z= 23.55, color= 1},
}


Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		for _, item in pairs(blips) do
	        if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), item.x, item.y, item.z, true) <= 25 then
                DrawMarker(27, item.x, item.y, item.z, 0, 0, 0, 0, 0, 0, 1.001, 1.0001, 0.1001,MarkerColor.r, MarkerColor.g, MarkerColor.b, 200, 0, 0, 0, 0)
                   if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), item.x,item.y,item.z, true) <= 1.5 then
                   	alert("Naciśnij ~INPUT_VEH_HORN~ aby sprawdzić liczbe EMS na służbie")
                      if (IsControlJustPressed(1,38)) and (GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), item.x, item.y, item.z, true) <= 5)  then
                      	TriggerServerEvent('milomarEMS:sprawdz')
                      end
                end
           end
	    end
	end
end)

function alert(msg)
	SetTextComponentFormat("STRING")
	AddTextComponentString(msg)
	DisplayHelpTextFromStringLabel(0,0,1,-1)
end

