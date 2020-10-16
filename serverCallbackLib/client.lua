krCB = {}
krCB.CurrentRequestId          = 0
krCB.ServerCallbacks           = {}

krCB.TriggerServerCallback = function(name, cb, ...)
	krCB.ServerCallbacks[krCB.CurrentRequestId] = cb

	TriggerServerEvent('krCB:triggerServerCallback', name, krCB.CurrentRequestId, ...)

	if krCB.CurrentRequestId < 65535 then
		krCB.CurrentRequestId = krCB.CurrentRequestId + 1
	else
		krCB.CurrentRequestId = 0
	end
end

RegisterNetEvent('krCB:serverCallback')
AddEventHandler('krCB:serverCallback', function(requestId, ...)
	krCB.ServerCallbacks[requestId](...)
	krCB.ServerCallbacks[requestId] = nil
end)

AddEventHandler('krCB:getSharedObject', function(cb)
	cb(krCB)
end)

function getSharedObject()
	return krCB
end
