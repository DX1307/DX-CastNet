ESX = exports['es_extended']:getSharedObject()
local Script = ''..GetCurrentResourceName()..''
local TIME = 4500

RegisterNetEvent('DX-CastNet:DXHIGH:UseItem')
AddEventHandler('DX-CastNet:DXHIGH:UseItem', function()
    if IsEntityInWater(GetPlayerPed(-1)) then
        TriggerEvent('DX-CastNet:DXHIGH:Loading')
    else
        exports['okokNotify']:Alert(LANG[DXHIGH.LANG]['TITLE'], Lang[DXHIGH.lang]['Youmustbeinwakewater'], TIME, 'error')
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
    if DXHIGH.EnableSkillCheck then
        local success = lib.skillCheck({'easy', 'medium', {areaSize = 60, speedMultiplier = 2}, 'medium'}, {'w', 'a', 's', 'd'})
        if success then 
            if RandomGive > DXHIGH.PercentGive then
                TriggerServerEvent('DX-CastNet:DXHIGH:AddItem')
                Citizen.Wait(800)
                TriggerServerEvent('DX-CastNet:DXHIGH:RemoveItem')
                CancelFishing()
            else
                exports['okokNotify']:Alert(LANG[DXHIGH.LANG]['TITLE'],Lang[DXHIGH.lang]['gotnothing'], TIME, 'error')
                CancelFishing()
            end
        else
            exports['okokNotify']:Alert(LANG[DXHIGH.LANG]['TITLE'], Lang[DXHIGH.lang]['doit'], 5000, 'error')
        end
    else
        if RandomGive > DXHIGH.PercentGive then
            TriggerServerEvent('DX-CastNet:DXHIGH:AddItem')
            Citizen.Wait(800)
            TriggerServerEvent('DX-CastNet:DXHIGH:RemoveItem')
            CancelFishing()
        else
            exports['okokNotify']:Alert(LANG[DXHIGH.LANG]['TITLE'],Lang[DXHIGH.lang]['gotnothing'], TIME, 'error')
            CancelFishing()
        end
    end
end)


function Anim_1()
    Citizen.Wait(500)
    ESX.Streaming.RequestAnimDict("anim@arena@celeb@flat@solo@no_props@", function()
        TaskPlayAnim(PlayerPedId(), "anim@arena@celeb@flat@solo@no_props@", "slugger_a_player_a", 8.0, -8, -1, 49, 0, 0, 0, 0)
        Citizen.Wait(TIME)
        exports['okokNotify']:Alert(LANG[DXHIGH.LANG]['TITLE'], Lang[DXHIGH.lang]['doing'], TIME, 'success')
        ClearPedTasks(GetPlayerPed(-1))
        Citizen.Wait(500)
    end)
end

function Anim_2()
    exports['okokNotify']:Alert(LANG[DXHIGH.LANG]['TITLE'], Lang[DXHIGH.lang]['dragging'], TIME, 'info')
    Citizen.Wait(500)
    ESX.Streaming.RequestAnimDict("random@mugging4", function()
        TaskPlayAnim(PlayerPedId(), "random@mugging4", "struggle_loop_b_thief", 8.0, -8, -1, 49, 0, 0, 0, 0)
        Citizen.Wait(TIME)
        ClearPedTasks(GetPlayerPed(-1))
        Citizen.Wait(500)
    end)
end

function Anim_3()
    Citizen.Wait(500)
    exports['okokNotify']:Alert(LANG[DXHIGH.LANG]['TITLE'], Lang[DXHIGH.lang]['test'], TIME, 'info')
    ESX.Streaming.RequestAnimDict("move_m@_idles@shake_off", function()
        TaskPlayAnim(PlayerPedId(), "move_m@_idles@shake_off", "shakeoff_1", 8.0, -8, -1, 49, 0, 0, 0, 0)
        Citizen.Wait(TIME)
        ClearPedTasks(GetPlayerPed(-1))
        Citizen.Wait(500)
    end)
end


function CancelFishing()
    Citizen.Wait(250)
    ClearPedTasksImmediately(GetPlayerPed(-1))
end


print('Script Run'..Script..'✔️succeed✔️')