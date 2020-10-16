krCB = {}
krCB.ServerCallbacks = {}

RegisterServerEvent('krCB:triggerServerCallback')
AddEventHandler('krCB:triggerServerCallback', function(name, requestId, ...)
	local _source = source

	krCB.TriggerServerCallback(name, requestID, _source, function(...)
		TriggerClientEvent('krCB:serverCallback', _source, requestId, ...)
	end, ...)
end)

krCB.RegisterServerCallback = function(name, cb)
	krCB.ServerCallbacks[name] = cb
end

krCB.TriggerServerCallback = function(name, requestId, source, cb, ...)
	if krCB.ServerCallbacks[name] ~= nil then
		krCB.ServerCallbacks[name](source, cb, ...)
	else
		print('vinnmarc_delivery => [' .. name .. '] does not exist')
	end
end

AddEventHandler('krCB:getSharedObject', function(cb)
	cb(krCB)
end)

function getSharedObject()
	return krCB
end
