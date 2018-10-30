Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

emsonline = 0
policeonline = 0
taxionline = 0
mecanoonline = 0

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(10000)
		ESX.TriggerServerCallback('guy293_getJobsOnline', function(ems, police, taxi, mecano)
			emsonline    = ems
			policeonline = police
			taxionline   = taxi
		    mecanoonline = mecano
		
		end)
	end
end)
			
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
			DrawText2(0.70, 1.449, 1.0,1.0,0.45, "LSPD De Servico: " .. policeonline , 0 ,119, 255, 150)
			DrawText2(0.70, 1.42, 1.0,1.0,0.45, "EMS De Servico: " .. emsonline , 246 ,56, 56, 150)
			DrawText2(0.70, 1.391, 1.0,1.0,0.45, "TAXI De Servico: " .. taxionline , 239 ,255, 0, 150)
	        DrawText2(0.70, 1.475, 1.0,1.0,0.45, "MECANICO De Servico: " .. mecanoonline , 31, 171, 6, 150)
	end
end)

function DrawText2(x,y ,width,height,scale, text, r,g,b,a)
    SetTextFont(1)
    SetTextProportional(0)
    SetTextScale(scale, scale)
    SetTextColour(r, g, b, a)
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(2, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x - width/1.47, y - height/0.896 + 0.005)
end