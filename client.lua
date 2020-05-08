local maxWeight = 25000 --The max weight that player can carry


local WEIGHT_STATUS = false
local ESX    = nil
local currentWeight = 0
Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getShvnsbla2aredObjvnsbla2ect', function(obj) ESX = obj end)
        Citizen.Wait(500)
    end 
    ESX.PlayerData = ESX.GetPlayerData()
end)
 

AddEventHandler('playerSpawned', function()
	ESX.PlayerData = ESX.GetPlayerData()
	for k,v in ipairs(ESX.PlayerData.inventory) do
		if v.count > 0 then
			currentWeight = currentWeight + (v.weight * v.count)
		end
	end
	exports.trew_hud_ui:setStatus({
        name = 'weight',
        value = (currentWeight / maxWeight) * 100
    });
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	ESX.PlayerData = ESX.GetPlayerData()
	for k,v in ipairs(ESX.PlayerData.inventory) do
		if v.count > 0 then
			currentWeight = currentWeight + (v.weight * v.count)
		end
	end
	exports.trew_hud_ui:setStatus({
        name = 'weight',
        value = (currentWeight / maxWeight) * 100
    });
end)

RegisterNetEvent('esx:removeInventoryItem')
AddEventHandler('esx:removeInventoryItem', function(item, count)
	ESX.PlayerData = ESX.GetPlayerData()
	for k,v in ipairs(ESX.PlayerData.inventory) do
		if v.count > 0 then
			currentWeight = (v.weight * v.count)
		end
	end
	exports.trew_hud_ui:setStatus({
        name = 'weight',
        value = (currentWeight / maxWeight) * 100
    });
end)
	
RegisterNetEvent('esx:addInventoryItem')
AddEventHandler('esx:addInventoryItem', function(item, count)
	ESX.PlayerData = ESX.GetPlayerData()
	for k,v in ipairs(ESX.PlayerData.inventory) do
		if v.count > 0 then
			currentWeight = currentWeight + (v.weight * v.count)
		end
	end
	exports.trew_hud_ui:setStatus({
        name = 'weight',
        value = (currentWeight / maxWeight) * 100
    });
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
