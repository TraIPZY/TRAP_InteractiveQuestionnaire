local webhook = "https://discord.com/api/webhooks/1441837386756526210/3onww67A_XMghvj5g26LadCFZ3WT0hL2xI3-3NE0MUzFdmptYPCH-8sPWqFTCeRwwXpN"

RegisterNetEvent("ppa:sendToPolice")
AddEventHandler("ppa:sendToPolice", function(data)

    local message = {
        username = "PPA - Test Psychologique",
        embeds = {{
            title = "Nouveau test psychologique",
            color = 3447003,
            fields = {
                -- Informations personnelles
                {name = "Nom complet", value = data.name or "Non spécifié", inline = true},
                {name = "Âge", value = data.age or "Non spécifié", inline = true},

                -- Historique personnel
                {name = "As-tu déjà eu des épisodes de dépression, d’angoisse ou de crise de panique ?", value = data.depression or "Non spécifié"},
                {name = "As-tu déjà consulté un psychologue, psychiatre ou pris des médicaments pour la santé mentale ?", value = data.psy or "Non spécifié"},
                {name = "As-tu déjà eu des idées suicidaires ou d’automutilation ?", value = data.suicidal or "Non spécifié"},
                {name = "Comment gères-tu le stress dans ta vie de tous les jours ?", value = data.stress or "Non spécifié"},

                -- Gestion de la colère
                {name = "Comment réagis-tu quand quelqu’un te manque de respect ?", value = data.disrespect or "Non spécifié"},
                {name = "Raconte une situation où tu t’es vraiment mis en colère. Qu’as-tu fait ?", value = data.anger or "Non spécifié"},
                {name = "As-tu déjà cassé des objets ou frappé quelqu’un sous la colère ?", value = data.physical or "Non spécifié"},
                {name = "Comment te calmes-tu quand tu sens que tu perds patience ?", value = data.calm or "Non spécifié"},

                -- Consommation
                {name = "À quelle fréquence bois-tu de l’alcool ? Jusqu’à l’ivresse ?", value = data.alcohol or "Non spécifié"},
                {name = "As-tu déjà conduit ou manipulé quelque chose de dangereux sous l’effet de l’alcool ou de drogues ?", value = data.dangerous or "Non spécifié"},
                {name = "As-tu déjà eu des problèmes liés à ta consommation ?", value = data.problems or "Non spécifié"},

                -- Antécédents de violence
                {name = "As-tu déjà été impliqué dans des bagarres ?", value = data.fights or "Non spécifié"},
                {name = "Es-tu déjà allé au tribunal (criminel ou civil) ?", value = data.tribunal or "Non spécifié"},
                {name = "Y a-t-il déjà eu des plaintes contre toi pour menaces, harcèlement, violence conjugale ou autre ?", value = data.complaints or "Non spécifié"},
                {name = "As-tu déjà intimidé ou menacé quelqu’un ?", value = data.bully or "Non spécifié"},

                -- Motivation PPA
                {name = "Pourquoi veux-tu obtenir un PPA ?", value = data.reason or "Non spécifié"},
                {name = "Qu’est-ce que cela changerait dans ta vie quotidienne ?", value = data.impact or "Non spécifié"},
                {name = "Comment vois-tu ta responsabilité en tant que propriétaire d’arme ?", value = data.responsibility or "Non spécifié"},

                -- Sécurité et risques
                {name = "Comment assurerais-tu la sécurité de l’arme à la maison ?", value = data.security or "Non spécifié"},
                {name = "Que ferais-tu si tu te sens très en colère ou déprimé alors que tu as accès à une arme ?", value = data.emotion or "Non spécifié"},
                {name = "Comment réagirais-tu si quelqu’un dans ton entourage veut manipuler ton arme ?", value = data.manipulate or "Non spécifié"},

                -- Commentaire général
                {name = "Commentaires supplémentaires", value = data.commentaire or "Aucun"}
            }
        }}
    }

    PerformHttpRequest(webhook, function() end, "POST", json.encode(message), {
        ["Content-Type"] = "application/json"
    })
end)
