ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


RegisterServerEvent('esx_steffe:givecoke')
AddEventHandler('esx_steffe:givecoke', function(item, qtty)
  local xPlayer = ESX.GetPlayerFromId(source)
  local player = ESX.GetPlayerFromId(source)
  xPlayer.addInventoryItem(cocaine, 5)
end)

RegisterServerEvent('coke:giver')
AddEventHandler('coke:giver', function()
	local src = source
    local xPlayer = ESX.GetPlayerFromId(src)

    xPlayer.addInventoryItem('cocaine', 5)
end)

ESX.RegisterServerCallback('coke:getPolice', function(source, callback)
	local players = ESX.GetPlayers()
	local copCount = 0

	for i=1, #players, 1 do
		local player = ESX.GetPlayerFromId(players[i])

		if player ~= nil and player.job ~= nil then
			if player.job.name == 'police' then
				copCount = copCount + 2
			end
		end
	end

	callback(copCount)
end)