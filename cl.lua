---------------------------------------------
-- Create By Ceek                          --
-- Discord : https://discord.gg/XRemZSYf7V -- 
---------------------------------------------

ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

local menuOpen = false
mainMenu = RageUI.CreateMenu("Bienvenue !", "Voici les choses à savoir !",nil, nil,nil,nil,0,0,0,245)
subMenu = RageUI.CreateSubMenu(mainMenu, "Touches", "Connaitre les touches.")
subMenu2 = RageUI.CreateSubMenu(mainMenu, "Faq", "En savoir plus.")
subMenu4 = RageUI.CreateSubMenu(mainMenu, "Commandes", "Connaitre les commandes.")
mainMenu.Closed = function()
    menuOpen = false
end

local Touche = {
    {category = "↓ Menu ↓"},
    { Name = "Boutique", Description = "Ouvrir la boutique du serveur afin d'y acheter des articles.", RightLabel = "~r~F1"},
    { Name = "Menu animation", Description = "Ouvrir le menu animation afin d'effectuer des actions.", RightLabel = "~r~F3"},
    { Name = "Ouvrir l'inventaire", Description = "Ouvrir votre inventaire afin d'accéder au carte d'identité / argent ect...", RightLabel = "~r~F5"},
    { Name = "Menu entreprise", Description = "Ouvrir le menu d'entreprise afin de gérer les intéractions lorsque vous faites partie d'une entreprise.", RightLabel = "~r~F6"},
    { Name = "Menu gang", Description = "Ouvrir le menu gang afin de gérer les intéractions lorsque vous faites partie d'un gang.", RightLabel = "~r~F9"},
    {category = "↓ Raccourcis animations ↓"},
    { Name = "Lever les mains", Description = "Ce raccourci se trouve à gauche au-dessus de TAB, il sert à lever les mains.", RightLabel = "~r~²"},
    { Name = "Pointer du doigt", Description = "Ce raccourci sert à pointer du doigt.", RightLabel = "~r~B"},
    { Name = "Tomber au sol", Description = "Ce raccourci sert à tomber Ko.", RightLabel = "~r~Insert"},
    {category = "↓ Véhicules ↓"},
    { Name = "Drift", Description = "Cette touche vous permets de drift.", RightLabel = "~r~Shift"},
    { Name = "Ouvrir le coffre", Description = "Ouvrir le coffre afin d'y déposer ou retiré vos objets.", RightLabel = "~r~U"},
    { Name = "Mettre la ceinture", Description = "Vous permet de metre la ceinture dans un véhicule.", RightLabel = "~r~K"},
    {category = "↓ Autres ↓"},
    { Name = "Faire une commande", Description = "Ça vous permets d'ouvrir le chat.", RightLabel = "~r~T"},
    { Name = "Radio", Description = "Permet de parler à la radio avec vos collègues.", RightLabel = "~r~F10"},
    { Name = "Changer la portée de voix", Description = "Permet de parler plus fort ou moins fort.", RightLabel = "~r~W"},
}

local Commande = {
    { Name = "Report", Description = "Cette commande permet de faire appel à une administrateur en cas de problème.", RightLabel = "~r~/report"},
    { Name = "Porter une personne", Description = "Cette commande permet de porter quelqu'un.", RightLabel = "~r~/porter"},
    { Name = "Prendre en otage", Description = "Cette commande permet de prendre en otage quelqu'un.", RightLabel = "~r~/otage"},
    { Name = "Raccourci danse", Description = "Cette commande permet d'éviter d'aller dans le menu animation à chaque fois.", RightLabel = "~r~/e + la danse"},
}

local faq = {
    { Name = "Louer un véhicule ?", Description = "~r~Cliquez sur la touche [Entrée] pour obtenir le point GPS vers la location de véhicule.", RightLabel = "→→→", color = 46, Text = "Louer un véhicule", Pos = vector3(-1034.69, -2732.89, 20.16)},
    { Name = "Passer mon permis ?", Description = "Sans votre permis de conduire vous pourrez pas acheter une voiture ou vous aurez des ennuis avec la LSPD.", RightLabel = "→→→", color = 46, Text = "Passer mon permis", Pos = vector3(239.02, -1381.09, 33.74)},
    { Name = "Acheter un véhicule ?", Description = "~r~Cliquez sur la touche [Entrée] pour obtenir le point GPS vers le concessionnaire.", RightLabel = "→→→", color = 46, Text = "Acheter un véhicule", Pos = vector3(-33.86, -1101.77, 26.41)},
    { Name = "Acheter un téléphone ?", Description = "~r~Cliquez sur la touche [Entrée] pour obtenir le point GPS vers le magasin de téléphone.", RightLabel = "→→→", color = 46, Text = "Acheter un téléphone", Pos = vector3(-638.53, -283.32, 36.24)},
    { Name = "Pôle emploi ?", Description = "~r~Cliquez sur la touche [Entrée] pour obtenir le point GPS vers le pôle emploi", RightLabel = "→→→", color = 46, Text = "Pôle emploi", Pos = vector3(-263.42, -967.34, 32.0)},
    { Name = "Parking central ?", Description = "~r~Cliquez sur la touche [Entrée] pour obtenir le point GPS vers le parking central", RightLabel = "→→→", color = 46, Text = "Parking central", Pos = vector3(227.151, -788.44, 33.06)},
}

local IsCheck = false
function mainMenuOpen()
    if menuOpen then
        menuOpen = false
    else
        menuOpen = true
        RageUI.Visible(mainMenu, true)
        Citizen.CreateThread(function()
            while menuOpen do
                RageUI.IsVisible(mainMenu, function()
                    DisableControlAction(1, 51, true)
                    local name = GetPlayerName(PlayerId())    
                    RageUI.Separator("~b~"..name.."")
                    RageUI.Button("Touches", nil, {RightLabel = "→→→"}, true , {},subMenu)
                    RageUI.Button("Commandes", nil, {RightLabel = "→→→"}, true , {},subMenu4)
                    RageUI.Button("FAQ", nil, {RightLabel = "→→→"}, true , {},subMenu2)

                end)

                RageUI.IsVisible(subMenu, function()
                    for k,v in pairs(Touche) do
                        if v.category ~= nil then
                            RageUI.Separator(v.category) 
                        else 
                            RageUI.Button(v.Name, v.Description, {RightLabel = v.RightLabel}, true , {})
                        end
                    end
                end)
                RageUI.IsVisible(subMenu4, function()
                    for k,v in pairs(Commande) do
                        RageUI.Button(v.Name, v.Description, {RightLabel = v.RightLabel}, true , {})
                    end
                end)
                RageUI.IsVisible(subMenu2, function()
                    for k,v in pairs(faq) do
                        RageUI.Button(v.Name, v.Description, {RightLabel = v.RightLabel}, true , {    
                            onSelected = function()
                                local blip = AddBlipForCoord(v.Pos)
                                SetBlipColour (blip, v.color)
                                SetBlipRoute(blip,  true)
                                BeginTextCommandSetBlipName("STRING")
                                AddTextComponentString(v.Text)
                                EndTextCommandSetBlipName(blip)
                            end
                        },subMenu2)
                    end
                end)
                Wait(1)
            end
        end)
    end
end

Citizen.CreateThread(function()
    while true do
        local pos = GetEntityCoords(PlayerPedId())
        local dest = vector3(-252.86,-1281.25,30.77)
        local distance = GetDistanceBetweenCoords(pos, dest, true)
        local interval = 200
           if distance <= 1 then
            interval = 0
            Visual.Subtitle("Appuyer sur ~b~[E]~s~ pour parler à~r~ Benard", 1)
                if IsControlJustPressed(1, 51) then
                    mainMenuOpen()
                end
            end
        Wait(interval)
    end
end)

Citizen.CreateThread(function()
    local hash = GetHashKey("player_zero")
    while not HasModelLoaded(hash) do
    RequestModel(hash)
    Wait(20)
    end
    ped = CreatePed("player_zero", "player_zero",-252.86, -1281.25, 29.77, 260.0, false, true) -- Mettre les coordonnées ICI
    SetBlockingOfNonTemporaryEvents(ped, true)
    FreezeEntityPosition(ped, true)
    SetEntityInvincible(ped, true)
    TaskStartScenarioInPlace(ped, "WORLD_HUMAN_CLIPBOARD")  -- Animation (a verifier je suis pas sur)
end)

print("Create By Ceek  Discord :https://discord.gg/XRemZSYf7V")
print("Create By Ceek  Discord :https://discord.gg/XRemZSYf7V")
