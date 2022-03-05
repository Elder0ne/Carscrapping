local QBCore = exports['qb-core']:GetCoreObject()

QBCore.Commands.Add("damn", "Give Random Items (God Only)", {}, false, function(source, args)
    TriggerClientEvent('carscrap:client:devTools', source)
end)

RegisterNetEvent('carscrap:server:giveRewards', function()
    Player.Functions.AddMoney('cash', 125)
    TriggerClientEvent('carscrap:client:devTools')
    QBCore.Functions.Notify('You Got $125 From Scrapping The Car', 'success', 5000) 
end)