JobAction = function(locationName)
    if locationName == "Start" then
        StartMeth("StartDevlivery")
    end
end

StartMeth = function(state)
	if state == "Another" then
		Delivery = "started"
	elseif state == "StartDevlivery" then
		local elements = {}

	    ESX.PlayAnimation(PlayerPedId(), "mp_prison_break", "hack_loop", {
	        ["flag"] = 1
	    })

	    SetEntityHeading(PlayerPedId(), 13.09755897522)

	    if Delivery == "started" then
	    	table.insert(elements, { ["label"] = "Avsluta leverans", ["value"] = "StartOrEnd" })
	    else
			table.insert(elements, { ["label"] = "På börja leverans: 3kg", ["value"] = "StartOrEnd",
				["kg"] = "3"
			})
	    end

	    ESX.UI.Menu.Open('default', GetCurrentResourceName(), "meth_start",
	        {
	            title    = "Metamfetamin",
	            align    = "center",
	            elements = elements
	        },
	    function(data, menu)
	        local value = data["current"]["value"]

	        if value == "StartOrEnd" then
	            if Delivery == "started" then
	                Delivery = nil
	                ESX.ShowNotification('Du avslutade leverans')
	            else
	                ESX.ShowNotification('Du har påbörjat en leverans på ' .. data["current"]["kg"] .. 'kg')
	                StartMeth("Another")
	            end
	        elseif value == "" then

	            menu.close()
	            ClearPedTasks(PlayerPedId())
	        end
	    end, function(data, menu)
	        menu.close()
	        ClearPedTasks(PlayerPedId())
	    end)	    
	end
end