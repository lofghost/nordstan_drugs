local Keys = {
  ["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
  ["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
  ["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
  ["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
  ["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
  ["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
  ["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
  ["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
  ["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}
ESX              = nil
local PlayerData = {}
local starting = false
local InAction = false
local Anim = 'missheist_jewel@hacking'
local Dict = 'hack_loop'
local isCarrying = false
local koka = false
local RequiredPolice = 0

Citizen.CreateThread(function()
  while ESX == nil do
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    Citizen.Wait(0)
  end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
  PlayerData = xPlayer   
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
  PlayerData.job = job
end)

Citizen.CreateThread(function()
    while true do

        Citizen.Wait(5)

        for i=1, #Config.Order do
            local bedID   = Config.Order[i]
            local distance = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), bedID.objCoords.x, bedID.objCoords.y, bedID.objCoords.z, true)

            if distance < Config.MaxDistance and InAction == false then

                ESX.Game.Utils.DrawText3D({ x = bedID.objCoords.x, y = bedID.objCoords.y, z = bedID.objCoords.z + 1 }, bedID.text, 0.6)

                if IsControlJustReleased(0, Keys['E']) then
                  startorder()

                end
            end
        end
    end
end)

Citizen.CreateThread(function()
    while true do

        Citizen.Wait(5)

        for i=1, #Config.Take do
            local bedID   = Config.Take[i]
            local distance = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), bedID.objCoords.x, bedID.objCoords.y, bedID.objCoords.z, true)

            if status == true then

            if distance < Config.MaxDistance and InAction == false then

                ESX.Game.Utils.DrawText3D({ x = bedID.objCoords.x, y = bedID.objCoords.y, z = bedID.objCoords.z + 1 }, bedID.text, 0.6)

                if IsControlJustReleased(0, Keys['E']) then
                  TakeDrug()
                end
                end
            end
        end
    end
end)

Citizen.CreateThread(function()
    while true do

        Citizen.Wait(5)

        for i=1, #Config.Remove do
            local bedID   = Config.Remove[i]
            local distance = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), bedID.objCoords.x, bedID.objCoords.y, bedID.objCoords.z, true)

            if status1 == true then

            if distance < Config.MaxDistance and InAction == false then

                ESX.Game.Utils.DrawText3D({ x = bedID.objCoords.x, y = bedID.objCoords.y, z = bedID.objCoords.z + 1 }, bedID.text, 0.6)

                if IsControlJustReleased(0, Keys['E']) then
                  Leave()
                end
                end
            end
        end
    end
end)

Citizen.CreateThread(function()
    while true do

        Citizen.Wait(5)

        for i=1, #Config.TakeOn do
            local bedID   = Config.TakeOn[i]
            local distance = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), bedID.objCoords.x, bedID.objCoords.y, bedID.objCoords.z, true)

            if status2 == true then

            if distance < Config.MaxDistance and InAction == false then

                ESX.Game.Utils.DrawText3D({ x = bedID.objCoords.x, y = bedID.objCoords.y, z = bedID.objCoords.z + 1 }, bedID.text, 0.6)

                if IsControlJustReleased(0, Keys['E']) then
                	switchclotchs()
                end
                end
            end
        end
    end
end)

Citizen.CreateThread(function()
    while true do

        Citizen.Wait(5)

        for i=1, #Config.Pack do
            local bedID   = Config.Pack[i]
            local distance = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), bedID.objCoords.x, bedID.objCoords.y, bedID.objCoords.z, true)

            if status3 == true then

            if distance < Config.MaxDistance and InAction == false then

                ESX.Game.Utils.DrawText3D({ x = bedID.objCoords.x, y = bedID.objCoords.y, z = bedID.objCoords.z + 1 }, bedID.text, 0.6)

                if IsControlJustReleased(0, Keys['E']) then
                	startpack()
                end
                end
            end
        end
    end
end)

Citizen.CreateThread(function()
    while true do

        Citizen.Wait(5)

        for i=1, #Config.Koka do
            local bedID   = Config.Koka[i]
            local distance = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), bedID.objCoords.x, bedID.objCoords.y, bedID.objCoords.z, true)

            if koka == true then

            if distance < Config.MaxDistance and InAction == false then

                ESX.Game.Utils.DrawText3D({ x = bedID.objCoords.x, y = bedID.objCoords.y, z = bedID.objCoords.z + 1 }, bedID.text, 0.6)

                if IsControlJustReleased(0, Keys['E']) then
                	if koka == true then
                  startkoka()
              else sendNotification('Du måste ta på dina kläder!')
              end
                end
                end
            end
        end
    end
end)

function teleport(position)
  FreezeEntityPosition(GetPlayerPed(-1), true)
  DoScreenFadeOut(500)
  Citizen.Wait(500)
  ESX.Game.Teleport(GetPlayerPed(-1), position)
  Citizen.Wait(1000)
  FreezeEntityPosition(GetPlayerPed(-1), false)
  DoScreenFadeIn(500)
end

function startkoka()
  playerPed = (GetPlayerPed(-1))
  TaskStartScenarioInPlace(playerPed, "PROP_HUMAN_BUM_BIN", 0, true)
	sendNotification('Tar fram ingredienser')
	Citizen.Wait(4000)
	sendNotification('Bearbetar..')
	Citizen.Wait(10000)
	steffe()
end

function steffe()
	status3 = true
	sendNotification('Paketera ihop kokainet')
  ClearPedTasks(PlayerPedId())
end

function startpack()
	playerPed = (GetPlayerPed(-1))
  TaskStartScenarioInPlace(playerPed, "PROP_HUMAN_BUM_BIN", 0, true)
  status2 = false
  status3 = false
  koka = false
  Citizen.Wait(8000)
  print('Tryck på X')
  ClearPedTasks(PlayerPedId())
  teleport(Config.Teleport)
  TriggerServerEvent('coke:giver')
  sendNotification('Som belöning så får du lite koakin..')
end

function procent(time)
  showPro = true
  TimeLeft = 0
  repeat
  TimeLeft = TimeLeft + 1 
  Citizen.Wait(time)
  until(TimeLeft == 100)
  showPro = false
end

function DrawTextTop(text)
	SetTextFont(4)
	SetTextProportional(0)
	SetTextScale(0.0, 1.0)
	SetTextColour(255, 255, 255, 255)
	SetTextDropshadow(0, 0, 0, 0, 255)
	SetTextEdge(1, 0, 0, 0, 255)
	SetTextDropShadow()
	SetTextOutline()
	SetTextEntry("STRING")
	AddTextComponentString(text)
	SetTextCentre(true)
	DrawText(0.45, 0.15)
end

function switchclotchs()
    ESX.UI.Menu.CloseAll()

    ESX.UI.Menu.Open(
        'default', GetCurrentResourceName(), 'hallo_menu',
        {
            title    = 'Kläder',
            align    = 'center',
            elements = {
				{label = 'Kokain kläder', value = 'drugclo'},
				{label = 'Civila kläder', value = 'owned'},
            }
        },
        function(data, menu)
            if data.current.value == 'drugclo' then
            	koka = true
        menu.close()
        TriggerEvent('rdrp_apperance:getSkin', function(skin)
        
            if skin.sex == 0 then

                local clothesSkin = {
                	['arms'] = 95,
                	['tshirt_1'] = 15, ['tshirt_2'] = 0,
                	['torso_1'] = 15, ['torso_2'] = 0,
                    ['pants_1'] = 21, ['pants_2'] = 0,
                    ['shoes_1'] = 34, ['shoes_2'] = 0, 
                    ['mask_1'] = 90,    ['mask_2'] = 2,
                    ['helmet_1'] = 28,    ['helmet_2'] = 1, 
                    ['glasses_1'] = 24,  ['glasses_2'] = 1,            }
                TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)

            else

                local clothesSkin = {
                    ['pants_1'] = 101, ['pants_2'] = 16,
                    ['shoes_1'] = 25, ['shoes_2'] = 0,
                }
                TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)

            end

        end)
      end            	
            if data.current.value == 'owned' then
	        menu.close()
	        ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)

	            TriggerEvent('skinchanger:loadSkin', skin)

	        end)
	      end
        end,
        function(data, menu)
            menu.close()
        end
    )
end

function sendNotification(message, messageType, messageTimeout)
  TriggerEvent("pNotify:SendNotification", {
    text = message,
    type = messageType,
    queue = "steffe",
    timeout = messageTimeout,
    layout = "bottomCenter"
  })
end

function onway()
  ESX.TriggerServerCallback('coke:getPolice', function(count)
    if count >= RequiredPolice then
      local OrderCoords = {["x"] = 3857.4677734375, ["y"] = 4459.1484375, ["z"] = 1.8400267362595}
      sendNotification('Din beställning är nu beställd. (Kolla din GPS)')
      SetNewWaypoint(OrderCoords["x"], OrderCoords["y"])
      status = true
    else
      sendNotification('Det måste vara minst ' .. RequiredPolice .. ' <span style="color:blue;"><b>poliser</b></span> i tjänst för att göra detta.')
    end
  end)
end

function Leave()
  print('Funkar : ', status1)
  playerPed = (GetPlayerPed(-1))
  TaskStartScenarioInPlace(playerPed, "PROP_HUMAN_BUM_BIN", 0, true)
  Citizen.Wait(10000)
  sendNotification('Bearbeta kokainet nu')
  ClearPedTasks(PlayerPedId())
  koka = true
  status1 = false
end  

function TakeDrug()
  local OwndCoords = {["x"] = 1108.67, ["y"] = -2256.89, ["z"] = 30.96}
  local HashKeyBox = GetHashKey("prop_paper_box_02")
  local prop = CreateObject(HashKeyBox, true, true, true)
  sendNotification('Tar upp saker, lägger dem i en påse.')
  SetNewWaypoint(OwndCoords["x"], OwndCoords["y"])
  sendNotification('Åk tillbaka till labet.')
  NotifyPolice('En civilist har sett en person plocka på sig narkotika ingredienser på bryggan!')
  status1 = true
end

function startorder()
RequestAnimDict(Anim)
  while not HasAnimDictLoaded(Anim) do
    Citizen.Wait(0)
            end
            
            TaskPlayAnim(GetPlayerPed(-1), Anim ,Dict ,8.0, -8.0, -1, 1, 0, true, true, true )
            Citizen.Wait(3000)
            onway()
            end

function NotifyPolice(message)
	TriggerServerEvent('esx_phone:send', 'police', message, true, false)
end