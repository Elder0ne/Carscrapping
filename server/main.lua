local QBCore = exports['qb-core']:GetCoreObject()


QBCore.Commands.Add("damn", "Give Random Items (God Only)", {}, false, function(source, args)
    TriggerClientEvent('carscrap:client:devTools', source)
end)

RegisterNetEvent('carscrap:server:giveRewards', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    Player.Functions.AddMoney('cash', 125)
    TriggerClientEvent('carscrap:client:devTools')
end)