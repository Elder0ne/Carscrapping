local QBCore = exports['qb-core']:GetCoreObject()
local missionStarted = false 
local car = nil


CreateThread(function()
  exports['qb-target']:AddBoxZone("name", vector3(-1140.88, -1987.93, 13.17), 1, 1, { 
    name = "name", 
    heading = 12.0, 
    debugPoly = true, 
    minZ = 11.7, 
    maxZ = 13.9, 
  }, {
    options = { 
      { 
        type = "client", 
        event = "carpart:client:spawnCar", 
        icon = "fas fa-search",
        label = 'Talk To Jake', 
      }
    },
    distance = 2.5, 
  })
end)

RegisterNetEvent('carpart:client:spawnCar', function()
    if missionStarted then
        QBCore.Functions.Notify('You Are Already Working', 'error', 5000) 
        return
    end

    missionStarted = true
    TriggerEvent('carpart:client:startJob')

    QBCore.Functions.SpawnVehicle('adder', function(veh)
      car = veh
    end, vector4(-1157.11, -2007.35, 13.18, 173.24), true)
end)

RegisterNetEvent('carpart:client:startJob', function()
  QBCore.Functions.Notify('Go Inside The Building', 'primary', 5000)
  TriggerEvent('carpart:client:removeDoors')
end)

RegisterNetEvent('carpart:client:endJob', function()
  missionStarted = false
  
end)

CreateThread(function()
    carblip = AddBlipForCoord(vector3(-1140.11, -1988.37, 13.17))
    SetBlipSprite (carblip, 446)
    SetBlipDisplay(carblip, 4)
    SetBlipScale  (carblip, 0.65)
    SetBlipAsShortRange(carblip, true)
    SetBlipColour(carblip, 0)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentSubstringPlayerName("Car Scrapping")
    EndTextCommandSetBlipName(carblip)
end)

RegisterNetEvent('carpart:client:removeDoors', function()
CircleZone:Create(vector3(-1157.45, -2007.6, 13.18), 3.0, {
  name="s",
  useZ=false,
  debugPoly=true
})

end)

RegisterNetEvent('carpart:client:polyZoneTest', function()
    QBCore.Functions.Notify('Remove The Doors', 'primary', 5000)
    Wait(10000)
    PolyZone:destroy()
end)

