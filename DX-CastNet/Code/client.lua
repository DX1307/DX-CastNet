ESX = exports['es_extended']:getSharedObject()
local TIME = 4500


Citizen.CreateThread(function()
    while true do
        local sleep = 7
        local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
        local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, Config.Zonefish.location.x, Config.Zonefish.location.y, Config.Zonefish.location.z)
        if Config.Zonefish.EnableMarker then
            if dist <= Config.Zonefish.range + 15 then
                DrawMarker(28,Config.Zonefish.location.x, Config.Zonefish.location.y, Config.Zonefish.location.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, Config.Zonefish.range, Config.Zonefish.range, Config.Zonefish.range, Config.Zonefish.Marker_R, Config.Zonefish.Marker_G, Config.Zonefish.Marker_B,  Config.Zonefish.Blips_Alpha, false, true, 2, false, false, false, false)
                sleep = 7
            end
        end
        Citizen.Wait(sleep)
    end
end)

RegisterNetEvent('DX-CastNet:DXHIGH:UseItem')
AddEventHandler('DX-CastNet:DXHIGH:UseItem', function()
    if Config.Zonefish.EnableZone then
        local dst = GetDistanceBetweenCoords(vector3(Config.Zonefish.location.x, Config.Zonefish.location.y, Config.Zonefish.location.z), GetEntityCoords(PlayerPedId()), true)
        if dst < Config.Zonefish.range then
            TriggerEvent('DX-CastNet:DXHIGH:Loading')
        else
            exports['okokNotify']:Alert(Lang[Config.lang]['title'], Lang[Config.lang]['Youarenotinthezone'], TIME, 'error')
        end
    else
        if IsEntityInWater(GetPlayerPed(-1)) then
            TriggerEvent('DX-CastNet:DXHIGH:Loading')
        else
            exports['okokNotify']:Alert(Lang[Config.lang]['title'], Lang[Config.lang]['Youmustbeinwakewater'], TIME, 'error')
        end
    end
end)


RegisterNetEvent('DX-CastNet:DXHIGH:Loading')
AddEventHandler('DX-CastNet:DXHIGH:Loading', function()
    local RandomGive = math.random(1,100)
    Citizen.Wait(800)
        Anim_1()
    Citizen.Wait(800)
        Anim_2()
    Citizen.Wait(800)
        Anim_3()
    Citizen.Wait(2500)
    if Config.EnableSkillCheck then
        local success = lib.skillCheck({Config.MiniGame.Mini_one, Config.MiniGame.Mini_two, {areaSize = 60, speedMultiplier = 2}, Config.MiniGame.Mini_Three}, Config.MiniGame.MimiSkillCheck)
        if success then 
            if RandomGive > Config.PercentGive then
                TriggerServerEvent('DX-CastNet:DXHIGH:AddItem')
                Citizen.Wait(800)
                TriggerServerEvent('DX-CastNet:DXHIGH:RemoveItem')
                CancelFishing()
            else
                exports['okokNotify']:Alert(Lang[Config.lang]['title'],Lang[Config.lang]['gotnothing'], TIME, 'error')
                CancelFishing()
            end
        else
            exports['okokNotify']:Alert(Lang[Config.lang]['title'], Lang[Config.lang]['doit'], 5000, 'error')
            CancelFishing()
        end
    else
        if RandomGive > Config.PercentGive then
            TriggerServerEvent('DX-CastNet:DXHIGH:AddItem')
            Citizen.Wait(800)
            TriggerServerEvent('DX-CastNet:DXHIGH:RemoveItem')
            CancelFishing()
        else
            exports['okokNotify']:Alert(Lang[Config.lang]['title'],Lang[Config.lang]['gotnothing'], TIME, 'error')
            CancelFishing()
        end
    end
end)


function Anim_1()
    Citizen.Wait(500)
    ESX.Streaming.RequestAnimDict("anim@arena@celeb@flat@solo@no_props@", function()
        TaskPlayAnim(PlayerPedId(), "anim@arena@celeb@flat@solo@no_props@", "slugger_a_player_a", 8.0, -8, -1, 49, 0, 0, 0, 0)
        FreezeEntityPosition(PlayerPedId(), true)
        Citizen.Wait(TIME)
        exports['okokNotify']:Alert(Lang[Config.lang]['title'], Lang[Config.lang]['doing'], TIME, 'success')
        ClearPedTasks(GetPlayerPed(-1))
        Citizen.Wait(250)
    end)
end

function Anim_2()
    exports['okokNotify']:Alert(Lang[Config.lang]['title'], Lang[Config.lang]['dragging'], TIME, 'info')
    Citizen.Wait(500)
    ESX.Streaming.RequestAnimDict("random@mugging4", function()
        TaskPlayAnim(PlayerPedId(), "random@mugging4", "struggle_loop_b_thief", 8.0, -8, -1, 49, 0, 0, 0, 0)
        FreezeEntityPosition(PlayerPedId(), true)
        Citizen.Wait(TIME)
        ClearPedTasks(GetPlayerPed(-1))
        Citizen.Wait(250)
    end)
end

function Anim_3()
    Citizen.Wait(500)
    exports['okokNotify']:Alert(Lang[Config.lang]['title'], Lang[Config.lang]['test'], TIME, 'info')
    ESX.Streaming.RequestAnimDict("move_m@_idles@shake_off", function()
        TaskPlayAnim(PlayerPedId(), "move_m@_idles@shake_off", "shakeoff_1", 8.0, -8, -1, 49, 0, 0, 0, 0)
        FreezeEntityPosition(PlayerPedId(), true)
        Citizen.Wait(TIME)
        ClearPedTasks(GetPlayerPed(-1))
        Citizen.Wait(250)
    end)
end


function CancelFishing()
    Citizen.Wait(250)
    FreezeEntityPosition(PlayerPedId(), false)
    ClearPedTasksImmediately(GetPlayerPed(-1))
end

Citizen.CreateThread(function()
    if Config.Zonefish.EnableBlips then
        local blip = AddBlipForCoord(Config.Zonefish.location.x, Config.Zonefish.location.y, Config.Zonefish.location.z)
        local BlipFish = AddBlipForRadius(Config.Zonefish.location.x, Config.Zonefish.location.y, Config.Zonefish.location.z)
        SetBlipSprite (blip, Config.Zonefish.Blips_id)
        SetBlipDisplay(blip, 4)
        SetBlipScale  (blip, Config.Zonefish.Blips_Scale)
        SetBlipColour (blip, Config.Zonefish.Blips_Colour)


        SetBlipScale(BlipFish, Config.Zonefish.range)
        SetBlipAlpha(BlipFish,Config.Zonefish.Blips_Alpha)
        SetBlipColour(BlipFish,Config.Zonefish.Blips_Colour)

        SetBlipAsShortRange(blip, true)
        AddTextEntry('START', Config.Zonefish.Blips_Name)
        BeginTextCommandSetBlipName("START")
        EndTextCommandSetBlipName(blip)
    end
end)
