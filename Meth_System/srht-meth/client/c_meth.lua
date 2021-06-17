ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)

local topluyormu = false
local isliyormu = false
local kurutuyormu = false
local paketliyormu = false

Citizen.CreateThread(function()
    while true do
        local sleep = 2000
        local player = PlayerPedId()
        local playercoords = GetEntityCoords(player)
        local dst = GetDistanceBetweenCoords(playercoords, Config.MethCikis.x, Config.MethCikis.y, Config.MethCikis.z, true)
        local dst2 = GetDistanceBetweenCoords(playercoords, Config.MethGiris.x, Config.MethGiris.y, Config.MethGiris.z, true)
        local dst3 = GetDistanceBetweenCoords(playercoords, Config.MethTopla.x, Config.MethTopla.y, Config.MethTopla.z, true)
        local dst4 = GetDistanceBetweenCoords(playercoords, Config.MethAyiklama.x, Config.MethAyiklama.y, Config.MethAyiklama.z, true)
        local dst5 = GetDistanceBetweenCoords(playercoords, Config.MethAyristirma.x, Config.MethAyristirma.y, Config.MethAyristirma.z, true)
        local dst6 = GetDistanceBetweenCoords(playercoords, Config.MethPaketleme.x, Config.MethPaketleme.y, Config.MethPaketleme.z, true)
        if dst < 10 then
            sleep = 7
            DrawMarker(2, Config.MethCikis.x, Config.MethCikis.y, Config.MethCikis.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.4, 0.4, 0.2, 255, 255, 255, 255, 0, 0, 0, 1, 0, 0, 0)
            if dst < 1 then
                DrawText3D(Config.MethCikis.x, Config.MethCikis.y, Config.MethCikis.z + 0.4, '~g~E~s~ - Gizemli Mekana Gir')
                if IsControlJustReleased(0, 38) then
                    SetEntityCoords(player, Config.MethGiris.x, Config.MethGiris.y, Config.MethGiris.z, false, false, false, true)
                end
            end
        end
        if dst2 < 10 then
            sleep = 7
            DrawMarker(2, Config.MethGiris.x, Config.MethGiris.y, Config.MethGiris.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.4, 0.4, 0.2, 255, 255, 255, 255, 0, 0, 0, 1, 0, 0, 0)
            if dst2 < 1 then
                DrawText3D(Config.MethGiris.x, Config.MethGiris.y, Config.MethGiris.z + 0.4, '~g~E~s~ - Dısarı Çık')
                if IsControlJustReleased(0, 38) then
                    SetEntityCoords(player, Config.MethCikis.x, Config.MethCikis.y, Config.MethCikis.z, false, false, false, true)
                end
            end
        end
        if dst3 < 10 then
            sleep = 7
            DrawMarker(2, Config.MethTopla.x, Config.MethTopla.y, Config.MethTopla.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.4, 0.4, 0.2, 255, 255, 255, 255, 0, 0, 0, 1, 0, 0, 0)
            if dst3 < 1 then
                DrawText3D(Config.MethTopla.x, Config.MethTopla.y, Config.MethTopla.z + 0.4, '~g~E~s~ - Meth  Topla')
                if IsControlJustReleased(0, 38) then
                    MethTopla()
                end
            end
        end
        if dst4 < 10 then
            sleep = 7
            DrawMarker(2, Config.MethAyiklama.x, Config.MethAyiklama.y, Config.MethAyiklama.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.4, 0.4, 0.2, 255, 255, 255, 255, 0, 0, 0, 1, 0, 0, 0)
            if dst4 < 1 then
                DrawText3D(Config.MethAyiklama.x, Config.MethAyiklama.y, Config.MethAyiklama.z + 0.4, '~g~E~s~ - Meth  Ayıkla')
                if IsControlJustReleased(0, 38) then
                    MethIsle()
                end
            end
        end
        if dst5 < 10 then
            sleep = 7
            DrawMarker(2, Config.MethAyristirma.x, Config.MethAyristirma.y, Config.MethAyristirma.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.4, 0.4, 0.2, 255, 255, 255, 255, 0, 0, 0, 1, 0, 0, 0)
            if dst5 < 1 then
                DrawText3D(Config.MethAyristirma.x, Config.MethAyristirma.y, Config.MethAyristirma.z + 0.4, '~g~E~s~ - Meth Yapragı Kurut')
                if IsControlJustReleased(0, 38) then
                    MethIsle2()
                end
            end
        end
        if dst6 < 10 then
            sleep = 7
            DrawMarker(2, Config.MethPaketleme.x, Config.MethPaketleme.y, Config.MethPaketleme.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.4, 0.4, 0.2, 255, 255, 255, 255, 0, 0, 0, 1, 0, 0, 0)
            if dst6 < 1 then
                DrawText3D(Config.MethPaketleme.x, Config.MethPaketleme.y, Config.MethPaketleme.z + 0.4, '~g~E~s~ - Meth Paketle')
                if IsControlJustReleased(0, 38) then
                    MethPaketle()
                end
            end
        end
        Citizen.Wait(sleep)
    end
end)

function MethTopla()
    if not topluyormu then
        topluyormu = true
        exports['mythic_progbar']:Progress({
            name = "meth_ham",
            duration = 10000,
            label = 'Varilden Meth Topluyorsun...',
            useWhileDead = false,
            canCancel = false,
            controlDisables = {
                disableMovement = true,
                disableCarMovement = true,
                disableMouse = false,
                disableCombat = true,
            },
            animation = {
                animDict = "mp_arresting",
                anim = "a_uncuff",
                flags = 49,
            },
        }, function(cancelled)
            if not cancelled then
                TriggerServerEvent('srht-meth:giveweed')
                topluyormu = false
                ESX.ShowNotification('Başarıyla Meth  topladın!')
            else
                -- Do Something If Action Was Cancelled
            end
        end)
    end
end

function MethIsle()
    if not isliyormu then
        ESX.TriggerServerCallback('srht-meth:malzemekontrol', function(data)
            local player = PlayerPedId()
            isliyormu = true
            local finished = exports["reload-skillbar"]:taskBar(5000,math.random(5,15))
            if finished ~= 100 then
                TriggerServerEvent('srht-meth:removeitem', 'meth_ham', 1)
                isliyormu = false
                ClearPedTasksImmediately(player)
                ESX.ShowNotification('Methi ayıklayamadın!')
            else
                local finished2 = exports["reload-skillbar"]:taskBar(4750,math.random(5,15))
                if finished2 ~= 100 then
                    TriggerServerEvent('srht-meth:removeitem', 'meth_ham', 1)
                    isliyormu = false
                    ClearPedTasksImmediately(player)
                    ESX.ShowNotification('Methı ayıklayamadın!')
                else
                    local finished3 = exports["reload-skillbar"]:taskBar(4500,math.random(5,15))
                    if finished3 ~= 100 then
                        TriggerServerEvent('srht-meth:removeitem', 'meth_ham', 1)
                        isliyormu = false
                        ClearPedTasksImmediately(player)
                        ESX.ShowNotification('Methı ayıklayamadın!')
                    else
                        TriggerServerEvent('srht-meth:processweed')
                        isliyormu = false
                        ClearPedTasks(player)
                        ESX.ShowNotification('Methı başarıyla ayıkladın!')
                    end
                end
            end
        end, "meth_ham", 1)
    end
end

function MethIsle2()
    if not kurutuyormu then
        ESX.TriggerServerCallback('srht-meth:malzemekontrol', function(data)
            local player = PlayerPedId()
            kurutuyormu = true
            local finished = exports["reload-skillbar"]:taskBar(4500,math.random(5,15))
            if finished ~= 100 then
                TriggerServerEvent('srht-meth:removeitem', 'meth_islenmis', 1)
                kurutuyormu = false
                ClearPedTasksImmediately(player)
                ESX.ShowNotification('Methı kurutamadın!')
            else
                local finished2 = exports["reload-skillbar"]:taskBar(4250,math.random(5,15))
                if finished2 ~= 100 then
                    TriggerServerEvent('srht-meth:removeitem', 'meth_islenmis', 1)
                    kurutuyormu = false
                    ClearPedTasksImmediately(player)
                    ESX.ShowNotification('Methı kurutamadın!')
                else
                    local finished3 = exports["reload-skillbar"]:taskBar(4000,math.random(5,15))
                    if finished3 ~= 100 then
                        TriggerServerEvent('srht-meth:removeitem', 'meth_islenmis', 1)
                        kurutuyormu = false
                        ClearPedTasksImmediately(player)
                        ESX.ShowNotification('Methı kurutamadın!')
                    else
                        TriggerServerEvent('srht-meth:processweed2')
                        kurutuyormu = false
                        ClearPedTasks(player)
                        ESX.ShowNotification('Methı başarıyla kuruttun!')
                    end
                end
            end
        end, "meth_islenmis", 1)
    end
end

function MethPaketle()
    if not paketliyormu then
        ESX.TriggerServerCallback('srht-meth:malzemekontrol', function(data)
            ESX.TriggerServerCallback('srht-meth:malzemekontrol', function(data)
                local player = PlayerPedId()
                paketliyormu = true
                local finished = exports["reload-skillbar"]:taskBar(4000,math.random(5,15))
                if finished ~= 100 then
                    TriggerServerEvent('srht-meth:removeitem', 'meth_islenmis2', 1)
                    paketliyormu = false
                    ClearPedTasksImmediately(player)
                    ESX.ShowNotification('Methı paketleyemedin!')
                else
                    local finished2 = exports["reload-skillbar"]:taskBar(3750,math.random(5,15))
                    if finished2 ~= 100 then
                        TriggerServerEvent('srht-meth:removeitem', 'meth_islenmis2', 1)
                        paketliyormu = false
                        ClearPedTasksImmediately(player)
                        ESX.ShowNotification('Methı paketleyemedin!')
                    else
                        local finished3 = exports["reload-skillbar"]:taskBar(3500,math.random(5,15))
                        if finished3 ~= 100 then
                            TriggerServerEvent('srht-meth:removeitem', 'meth_islenmis2', 1)
                            paketliyormu = false
                            ClearPedTasksImmediately(player)
                            ESX.ShowNotification('Methı paketleyemedin!')
                        else
                            TriggerServerEvent('srht-meth:packweed')
                            paketliyormu = false
                            ClearPedTasks(player)
                            ESX.ShowNotification('Methı başarıyla paketledin!')
                        end
                    end
                end
            end, "poset", 1)
        end, "meth_islenmis2", 1)
    end
end

if Config.MethBlip then
    local coords = vector3(Config.MethCikis.x, Config.MethCikis.y, Config.MethCikis.z)
    local blip = AddBlipForCoord(coords)

	SetBlipSprite(blip, 140)
	SetBlipScale(blip, 0.7)
	SetBlipColour(blip, 2)
	SetBlipAsShortRange(blip, true)

	BeginTextCommandSetBlipName('STRING')
	AddTextComponentSubstringPlayerName('Meth Laboratuvarı')
    EndTextCommandSetBlipName(blip)
end
