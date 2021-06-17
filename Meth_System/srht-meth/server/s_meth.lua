ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('srht-meth:giveweed')
AddEventHandler('srht-meth:giveweed', function()
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    if xPlayer.canCarryItem('meth_ham', 1) then
        xPlayer.addInventoryItem('meth_ham', 1)
    else
        TriggerClientEvent('esx:showNotification', src, 'Üzerinde bunu taşıyacak yer yok!')
    end
end)

RegisterServerEvent('srht-meth:processweed')
AddEventHandler('srht-meth:processweed', function()
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    if xPlayer.getInventoryItem('meth_ham').count >= 1 then
        if xPlayer.canCarryItem('meth_islenmis', 1) then
            xPlayer.removeInventoryItem('meth_ham', 1)
            Citizen.Wait(500)
            xPlayer.addInventoryItem('meth_islenmis', 1)
        else
            TriggerClientEvent('esx:showNotification', src, 'Üzerinde bunu taşıyacak yer yok!')
        end
    else
        TriggerClientEvent('esx:showNotification', src, 'Üzerinde meth yaprağı yok!')
    end
end)

RegisterServerEvent('srht-meth:processweed2')
AddEventHandler('srht-meth:processweed2', function()
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    if xPlayer.getInventoryItem('meth_islenmis').count >= 1 then
        if xPlayer.canCarryItem('meth_islenmis2', 1) then
            xPlayer.removeInventoryItem('meth_islenmis', 1)
            Citizen.Wait(500)
            xPlayer.addInventoryItem('meth_islenmis2', 1)
        else
            TriggerClientEvent('esx:showNotification', src, 'Üzerinde bunu taşıyacak yer yok!')
        end
    else
        TriggerClientEvent('esx:showNotification', src, 'Üzerinde ayıklanmış meth yok!')
    end
end)

RegisterServerEvent('srht-meth:packweed')
AddEventHandler('srht-meth:packweed', function()
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    if xPlayer.getInventoryItem('meth_islenmis2').count >= 1 then
        if xPlayer.getInventoryItem('poset').count >= 1 then
            if xPlayer.canCarryItem('meth_paketlenmis', 1) then
                xPlayer.removeInventoryItem('poset', 1)
                Citizen.Wait(250)
                xPlayer.removeInventoryItem('meth_islenmis2', 1)
                Citizen.Wait(500)
                xPlayer.addInventoryItem('meth_paketlenmis', 1)
            else
                TriggerClientEvent('esx:showNotification', src, 'Üzerinde bunu taşıyacak yer yok!')
            end
        else
            TriggerClientEvent('esx:showNotification', src, 'Üzerinde yeterli poşet yok!')
        end
    else
        TriggerClientEvent('esx:showNotification', src, 'Üzerinde kurutulmuş meth yok!')
    end
end)

RegisterServerEvent('srht-meth:sellweed')
AddEventHandler('srht-meth:sellweed', function()
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    local money = math.random(Config.MinMethPara, Config.MaxMethPara)
    if xPlayer.getInventoryItem('meth_paketlenmis').count >= 1 then
        xPlayer.removeInventoryItem('meth_paketlenmis', 1)
        Citizen.Wait(500)
        if Config.BlackMoney then
            xPlayer.addAccountMoney('black_money', money)
        else
            xPlayer.addMoney(money)
        end
    else
        TriggerClientEvent('esx:showNotification', src, 'Üzerinde paketlenmiş meth yok!')
    end
end)
