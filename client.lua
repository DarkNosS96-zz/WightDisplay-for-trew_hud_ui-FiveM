local WEIGHT_STATUS = false
local ESX    = nil
 
Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end 
    ESX.PlayerData = ESX.GetPlayerData()
end)
 
 
AddEventHandler('playerSpawned', function()
    if WEIGHT_STATUS == false then
        exports.trew_hud_ui:createStatus({
            status = 'weight',
            color = '#865a09',
            icon = '<i class="fas fa-box-open"></i>'
        });
        WEIGHT_STATUS = true
    end
end)
   
   
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1000)
		if WEIGHT_STATUS == false then
			exports.trew_hud_ui:createStatus({
				status = 'weight',
				color = '#865a09',
				icon = '<i class="fas fa-box-open"></i>'
			});
			WEIGHT_STATUS = true
		end
        local currentWeight = 0
		ESX.PlayerData = ESX.GetPlayerData()
        for k,v in ipairs(ESX.PlayerData.inventory) do
            if v.count > 0 then
                currentWeight = currentWeight + (v.weight * v.count)
            end
        end
        currentWeight = currentWeight*4
        currentWeight = currentWeight/1000
        exports.trew_hud_ui:setStatus({
            name = 'weight',
            value = currentWeight
        });
    end
end)
