
local ppaPosition = vector3(461.4468, -984.9750, 30.8500) -- change à la position de ton objet
local ppaModel = `prop_laptop_01a` -- modèle de l'objet sur lequel le joueur cible


Citizen.CreateThread(function()
    while not exports.ox_target do
        Citizen.Wait(500)
    end

    -- Ajouter l'objet target
    exports.ox_target:addBoxZone({
        coords = ppaPosition,
        size = vec3(1.0, 1.0, 1.0), -- ajuster selon la taille de l'objet
        rotation = 0.0,
        debug = false,
        options = {
            {
                name = 'ppa_test',
                event = 'ppa:openMenu',
                icon = 'fas fa-laptop',
                label = 'Faire le test PPA',
                canInteract = function(entity)
                    return true -- tu peux ajouter condition si besoin
                end
            }
        }
    })
end)

-- Événement pour ouvrir le menu
RegisterNetEvent('ppa:openMenu', function()
    SetNuiFocus(true, true)
    SendNUIMessage({action = "open"})
end)

-- Fermer le menu depuis NUI
RegisterNUICallback("close", function(data, cb)
    SetNuiFocus(false, false)
    cb("ok")
end)

-- Envoyer les données au serveur
RegisterNUICallback("sendTest", function(data, cb)
    TriggerServerEvent("ppa:sendToPolice", data)
    SetNuiFocus(false, false)
    cb("ok")
end)
