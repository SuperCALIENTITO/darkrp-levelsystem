----------------------------------
------------- Shipments ----------
----------------------------------
hook.Add("playerBoughtShipment", "DarkRPLS_PlayerBoughtShipment", function(ply)
    local xp = DLS_XPValues("buy_shipment")
    DLS_checkPlayerDatabase(ply)
    DLS_addXPToPlayer(ply, xp)
    DLS_updatePlayerName(ply)

    ply:SetNWInt("darkrp_ls_level", DLS_getPlayerLevel(ply))
    ply:SetNWInt("darkrp_ls_xp", DLS_getPlayerXP(ply))

    ply:setDarkRPVar("level", DLS_getPlayerLevel(ply))
    ply:setDarkRPVar("xp", DLS_getPlayerXP(ply))
end)

----------------------------------
------------- Ammo ---------------
----------------------------------
hook.Add("playerBoughtAmmo", "DarkRPLS_PlayerBoughtAmmo", function(ply)
    local xp = DLS_XPValues("buy_ammo")
    DLS_checkPlayerDatabase(ply)
    DLS_addXPToPlayer(ply, xp)
    DLS_updatePlayerName(ply)

    ply:SetNWInt("darkrp_ls_level", DLS_getPlayerLevel(ply))
    ply:SetNWInt("darkrp_ls_xp", DLS_getPlayerXP(ply))

    ply:setDarkRPVar("level", DLS_getPlayerLevel(ply))
    ply:setDarkRPVar("xp", DLS_getPlayerXP(ply))
end)

----------------------------------
------------- Vehicle ------------
----------------------------------
hook.Add("playerBoughtCustomVehicle", "DarkRPLS_PlayerBuyVehicle", function(ply, ent)
    local xp = DLS_XPValues("buy_vehicle")
    DLS_checkPlayerDatabase(ply)
    DLS_addXPToPlayer(ply, xp)
    DLS_updatePlayerName(ply)

    ply:SetNWInt("darkrp_ls_level", DLS_getPlayerLevel(ply))
    ply:SetNWInt("darkrp_ls_xp", DLS_getPlayerXP(ply))

    ply:setDarkRPVar("level", DLS_getPlayerLevel(ply))
    ply:setDarkRPVar("xp", DLS_getPlayerXP(ply))
end)

----------------------------------
------------- Weapon --------------
----------------------------------
hook.Add("playerBoughtWeapon", "DarkRPLS_PlayerBoughtWeapon", function(ply)
    local xp = DLS_XPValues("buy_weapon")
    DLS_checkPlayerDatabase(ply)
    DLS_addXPToPlayer(ply, xp)
    DLS_updatePlayerName(ply)

    ply:SetNWInt("darkrp_ls_level", DLS_getPlayerLevel(ply))
    ply:SetNWInt("darkrp_ls_xp", DLS_getPlayerXP(ply))

    ply:setDarkRPVar("level", DLS_getPlayerLevel(ply))
    ply:setDarkRPVar("xp", DLS_getPlayerXP(ply))
end)

----------------------------------
------------- Door ----------------
----------------------------------
hook.Add("playerBoughtDoor", "DarkRPLS_PlayerBoughtDoor", function(ply)
    local xp = DLS_XPValues("buy_door")
    DLS_checkPlayerDatabase(ply)
    DLS_addXPToPlayer(ply, xp)
    DLS_updatePlayerName(ply)

    ply:SetNWInt("darkrp_ls_level", DLS_getPlayerLevel(ply))
    ply:SetNWInt("darkrp_ls_xp", DLS_getPlayerXP(ply))

    ply:setDarkRPVar("level", DLS_getPlayerLevel(ply))
    ply:setDarkRPVar("xp", DLS_getPlayerXP(ply))
end)

----------------------------------
------------- Arrested -----------
----------------------------------
hook.Add("playerArrested", "DarkRPLS_PlayerArrested", function(criminal, _, police)
    local xp_criminal = DLS_XPValues("player_arrested")
    DLS_checkPlayerDatabase(criminal)
    DLS_addXPToPlayer(criminal, xp_criminal)
    DLS_updatePlayerName(criminal)

    criminal:SetNWInt("darkrp_ls_level", DLS_getPlayerLevel(criminal))
    criminal:SetNWInt("darkrp_ls_xp", DLS_getPlayerXP(criminal))

    criminal:setDarkRPVar("level", DLS_getPlayerLevel(criminal))
    criminal:setDarkRPVar("xp", DLS_getPlayerXP(criminal))

    if police:IsPlayer() and (criminal ~= police) then
        local xp_police = DLS_XPValues("player_arrest")
        DLS_checkPlayerDatabase(police)
        DLS_addXPToPlayer(police, xp_police)
        DLS_updatePlayerName(police)

        police:SetNWInt("darkrp_ls_level", DLS_getPlayerLevel(police))
        police:SetNWInt("darkrp_ls_xp", DLS_getPlayerXP(police))

        police:setDarkRPVar("level", DLS_getPlayerLevel(police))
        police:setDarkRPVar("xp", DLS_getPlayerXP(police))
    end
end)

----------------------------------
------------- Salary --------------
----------------------------------
hook.Add("playerGetSalary", "DarkRPLS_PlayerGetSalary", function(ply)
    local xp = DLS_XPValues("player_salary")
    DLS_checkPlayerDatabase(ply)
    DLS_addXPToPlayer(ply, xp)
    DLS_updatePlayerName(ply)

    ply:SetNWInt("darkrp_ls_level", DLS_getPlayerLevel(ply))
    ply:SetNWInt("darkrp_ls_xp", DLS_getPlayerXP(ply))

    ply:setDarkRPVar("level", DLS_getPlayerLevel(ply))
    ply:setDarkRPVar("xp", DLS_getPlayerXP(ply))
end)

----------------------------------
------------- Lockpick ------------
----------------------------------
hook.Add("onLockpickCompleted", "DarkRPLS_PlayerLockpick", function(ply)
    local xp = DLS_XPValues("player_lockpick")
    DLS_checkPlayerDatabase(ply)
    DLS_addXPToPlayer(ply, xp)
    DLS_updatePlayerName(ply)

    ply:SetNWInt("darkrp_ls_level", DLS_getPlayerLevel(ply))
    ply:SetNWInt("darkrp_ls_xp", DLS_getPlayerXP(ply))

    ply:setDarkRPVar("level", DLS_getPlayerLevel(ply))
    ply:setDarkRPVar("xp", DLS_getPlayerXP(ply))
end)

----------------------------------
--------------- Hit --------------
----------------------------------
hook.Add("onHitCompleted", "DarkRPLS_PlayerHitSuccess", function(ply)
    local xp = DLS_XPValues("player_hit_success")
    DLS_checkPlayerDatabase(ply)
    DLS_addXPToPlayer(ply, xp)
    DLS_updatePlayerName(ply)

    ply:SetNWInt("darkrp_ls_level", DLS_getPlayerLevel(ply))
    ply:SetNWInt("darkrp_ls_xp", DLS_getPlayerXP(ply))

    ply:setDarkRPVar("level", DLS_getPlayerLevel(ply))
    ply:setDarkRPVar("xp", DLS_getPlayerXP(ply))
end)

hook.Add("onHitFailed", "DarkRPLS_PlayerHitFailed", function(ply)
    local xp = DLS_XPValues("player_hit_fail")
    DLS_checkPlayerDatabase(ply)
    DLS_addXPToPlayer(ply, xp)
    DLS_updatePlayerName(ply)

    ply:SetNWInt("darkrp_ls_level", DLS_getPlayerLevel(ply))
    ply:SetNWInt("darkrp_ls_xp", DLS_getPlayerXP(ply))

    ply:setDarkRPVar("level", DLS_getPlayerLevel(ply))
    ply:setDarkRPVar("xp", DLS_getPlayerXP(ply))
end)

----------------------------------
------------- License ------------
----------------------------------
hook.Add("playerGotLicense", "DarkRPLS_PlayerBoughtLicense", function(ply)
    local xp = DLS_XPValues("buy_license")
    DLS_checkPlayerDatabase(ply)
    DLS_addXPToPlayer(ply, xp)
    DLS_updatePlayerName(ply)

    ply:SetNWInt("darkrp_ls_level", DLS_getPlayerLevel(ply))
    ply:SetNWInt("darkrp_ls_xp", DLS_getPlayerXP(ply))

    ply:setDarkRPVar("level", DLS_getPlayerLevel(ply))
    ply:setDarkRPVar("xp", DLS_getPlayerXP(ply))
end)