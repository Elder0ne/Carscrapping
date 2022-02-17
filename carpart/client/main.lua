local QBCore = exports['qb-core']:GetCoreObject()
local modelHash = MP_M_WareMech_01
local pedCoords = vector3(-1140.85, -1987.95, 13.16)
local missionStarted = false 
local endMission = false


CreateThread(function()
  exports['qb-target']:AddBoxZone("name", vector3(-1140.88, -1988.06, 13.17), 2, 2, { 
    name = "name", 
    heading = 12.0, 
    debugPoly = true, 
    minZ = 11.7, 
    maxZ = 15.9, 
  }, {
    options = { 
      { 
        type = "client", 
        event = "carpart:client:spawnCar", 
        icon = "fas fa-search",
        label = 'Talk  To Jake', 
      }
    },
    distance = 2.5, 
  })
end)

RegisterNetEvent('carpart:client:spawnCar', function()
    QBCore.Functions.SpawnVehicle("adder", function(veh)                  
  end, vector4(-1157.11, -2007.35, 13.18, 173.24), true)

    if missionStarted == true then 
    end)
  else 
    missionStarted = true
      TriggerEvent('carpart:client:startJob')
end)

RegisterNetEvent('carpart:client:startJob', function()
  QBCore.Functions.Notify('Go Inside The Building And Work On The Car', 'success', 5000)
end)

RegisterNetEvent('carpart:client:endJob', function()
  endMission = true
end)

CreateThread(function()
    carblip = AddBlipForCoord(vector3(-1140.11, -1988.37, 13.17))
    SetBlipSprite (carblip, 446)
    SetBlipDisplay(carblip, 4)
    SetBlipScale  (carblip, 0.65)
    SetBlipAsShortRange(carblip, true)
    SetBlipColour(carblip, 0)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentSubstringPlayerName("Car Part")
    EndTextCommandSetBlipName(carblip)
end)

local function
   CreatePed(modelHash, pedCoords, male)
  RequestModel(1)
  Wait(1)
    return CreatePed(modelHash, pedModel, vector.xyz, true)
end