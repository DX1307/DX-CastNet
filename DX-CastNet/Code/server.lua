ESX = exports['es_extended']:getSharedObject()

ESX.RegisterUsableItem(Config.Itemuse, function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
    TriggerClientEvent('DX-CastNet:DXHIGH:UseItem',source)
end)


RegisterServerEvent('DX-CastNet:DXHIGH:AddItem')
AddEventHandler('DX-CastNet:DXHIGH:AddItem', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	for k,v in pairs(Config.Droprate) do
		if math.random(1, 100) <= v.Percent then
			local xItemCount = math.random(v.ItemCount[1], v.ItemCount[2])
			xPlayer.addInventoryItem(v.ItemName, xItemCount)
            TriggerClientEvent('okokNotify:Alert', source, Lang[Config.lang]['title'], "คุณได้รับ <span style='color:#f38847'>"..v.ItemName.."</span> X <span style='color:#f38847'>"..xItemCount.."</span> ชิ้น", 5000, 'success')
		end
	end
end)


RegisterServerEvent('DX-CastNet:DXHIGH:RemoveItem')
AddEventHandler('DX-CastNet:DXHIGH:RemoveItem', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
    local RandomRemove = math.random(1,100)

    if RandomRemove > Config.PercentRemove then
	    xPlayer.removeInventoryItem(Config.Itemuse, 1)
        TriggerClientEvent('okokNotify:Alert', source, Lang[Config.lang]['title'], "แหของคุณเสียหาย X <span style='color:#f38847'> ( 1 ) </span> ชิ้น", 5000, 'error')
	end
end)