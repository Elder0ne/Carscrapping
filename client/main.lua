local QBCore = exports['qb-core']:GetCoreObject()
local missionStarted = false 
local car = -1216765807
local ped = PlayerPedId()
local door = 277255495
local door2 = 0

function PlayerOpenDoor()
  SetVehicleDoorOpen(car, 0, false, false)
  Wait(10000)
  TriggerEvent('carscrap:client:doAnimation')
  SetVehicleDoorBroken(car, 0, true)
end

function SpawnDoor()
  door2 = CreateObject(door, -1155.83, -2007.33, 13.18, true, false, false)
  AttachEntityToEntity(door2, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 57005), 0.14, 0, -0.01, 90.0, -90.0, 180.0, true, true, false, true, 1, true)
end


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
        event = "carscrap:client:spawnCar", 
        icon = "fas fa-search",
        label = 'Talk To Jake', 
      }
    },
    distance = 2.5, 
  })
end)

RegisterNetEvent('carscrap:client:spawnCar', function()
    if missionStarted then
        QBCore.Functions.Notify('You Are Already Working', 'error', 5000) 
        return
    end

    missionStarted = true
    TriggerEvent('carscrap:client:startJob')

    QBCore.Functions.SpawnVehicle('adder', function(veh)
      car = veh
    end, vector4(-1157.11, -2007.35, 13.18, 173.24), true)
end)

RegisterNetEvent('carscrap:client:startJob', function()
  QBCore.Functions.Notify('Go Inside The Building', 'primary', 5000)
  TriggerEvent('carscrap:client:removeDoors')
end)

RegisterNetEvent('carscrap:client:removeDoors', function()
carZone = CircleZone:Create(vector3(-1157.45, -2007.6, 13.18), 3.0, {
  name="s",
  useZ=false,
  debugPoly=true
})
    carZone:onPlayerInOut(function(isPointInside)
      TriggerEvent('carscrap:client:circleCarZone')
    end)
end)

RegisterNetEvent('carscrap:client:circleCarZone', function()
    QBCore.Functions.Notify('Remove The Doors', 'primary', 5000)
      TaskGoStraightToCoord(ped, -1155.84, -2007.33, 13.18, 138.98, 15.0, -1, 0.0, 0.0)
    Wait(5000)
    FreezeEntityPosition(ped, true)
    PlayerOpenDoor()
    Wait(6000)
    carZone:destroy()
end)

RegisterNetEvent('carscrap:client:doAnimation', function()
QBCore.Functions.Progressbar("doorRemoval", 'Removing the door', 5500, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = "mini@repair",
        anim = "fixing_a_ped",
        flags = 16,
    }, {}, {}, function() -- Done
        StopAnimTask(PlayerPedId(), "mini@repair", "fixing_a_ped", 1.0)
            SpawnDoor()
            FreezeEntityPosition(ped, false)
              QBCore.Functions.Notify('Go To The Shelfs On Your Left', 'primary', 5000) 
            TriggerEvent('carscrap:client:deliverBox')
    end, function() -- Cancel
        StopAnimTask(PlayerPedId(), "mini@repair", "fixing_a_ped", 1.0)
        FreezeEntityPosition(ped, false)
        QBCore.Functions.Notify('Canceled', "error")
    end)
end)

RegisterNetEvent('carscrap:client:deliverBox', function()
partDeliver = BoxZone:Create(vector3(-1145.44, -2014.97, 13.18), 16.0, 5, {
  name="work",
  heading=314,
  debugPoly=true
})
partDeliver:onPlayerInOut(function(isPointInside)
TriggerEvent('carscrap:client:finishScrap')

  end)
end)

RegisterNetEvent('carscrap:client:finishScrap', function()
  QBCore.Functions.Progressbar('deliverGoods', 'Putting door on shelf', 5000, false, true, { -- Name | Label | Time | useWhileDead | canCancel
      disableMovement = true,
      disableCarMovement = true,
      disableMouse = false,
      disableCombat = true,
  }, {
      animDict = 'anim@gangops@facility@servers@',
      anim = 'hotwire',
      flags = 16,
  }, {}, {}, function() -- Play When Done
      TriggerServerEvent('carscrap:server:giveRewards')
      QBCore.Functions.Notify('You Got $125 From Scrapping The Car', 'success', 5000) 
          TriggerEvent('carscrap:client:devTools')
      partDeliver:destroy()
  end, function() -- Play When Cancel
      QBCore.Functions.Notify('You Canceled', error, 5000) 
  end)
end)

RegisterNetEvent('carscrap:client:devTools', function()
  DetachEntity(door2, false, false)
  DeleteEntity(door2)
  ClearPedTasksImmediately(ped)
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