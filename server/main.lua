local QBCore = exports['qb-core']:GetCoreObject()

QBCore.Commands.Add("damn", "Give Random Items (God Only)", {}, false, function(source, args)
    TriggerClientEvent('carscrap:client:devTools', source)
end)

