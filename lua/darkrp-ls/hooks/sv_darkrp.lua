----------------------------------
------------- Shipments ----------
----------------------------------
hook.Add("playerBoughtShipment", "DarkRPLS_PlayerBoughtShipment", function(ply)
    local xp = DLS.XPValues("buy_shipment")
    DLS.checkPlayerDatabase(ply)
    DLS.addXPToPlayer(ply, xp)
    DLS.updatePlayerName(ply)

    ply:SetNWInt("darkrp_ls_level", DLS.getPlayerLevel(ply))
    ply:SetNWInt("darkrp_ls_xp", DLS.getPlayerXP(ply))
    return
end)

----------------------------------
------------- Ammo ---------------
----------------------------------
hook.Add("playerBoughtAmmo", "DarkRPLS_PlayerBoughtAmmo", function(ply)
    local xp = DLS.XPValues("buy_ammo")
    DLS.checkPlayerDatabase(ply)
    DLS.addXPToPlayer(ply, xp)
    DLS.updatePlayerName(ply)

    ply:SetNWInt("darkrp_ls_level", DLS.getPlayerLevel(ply))
    ply:SetNWInt("darkrp_ls_xp", DLS.getPlayerXP(ply))
    return
end)

----------------------------------
------------- Vehicle ------------
----------------------------------
hook.Add("playerBoughtVehicle", "DarkRPLS_PlayerBoughtVehicle", function(ply)
    local xp = DLS.XPValues("buy_vehicle")
    DLS.checkPlayerDatabase(ply)
    DLS.addXPToPlayer(ply, xp)
    DLS.updatePlayerName(ply)

    ply:SetNWInt("darkrp_ls_level", DLS.getPlayerLevel(ply))
    ply:SetNWInt("darkrp_ls_xp", DLS.getPlayerXP(ply))
    return
end)

----------------------------------
------------- Weapon --------------
----------------------------------
hook.Add("playerBoughtWeapon", "DarkRPLS_PlayerBoughtWeapon", function(ply)
    local xp = DLS.XPValues("buy_weapon")
    DLS.checkPlayerDatabase(ply)
    DLS.addXPToPlayer(ply, xp)
    DLS.updatePlayerName(ply)

    ply:SetNWInt("darkrp_ls_level", DLS.getPlayerLevel(ply))
    ply:SetNWInt("darkrp_ls_xp", DLS.getPlayerXP(ply))
    return
end)

----------------------------------
------------- Door ----------------
----------------------------------
hook.Add("playerBoughtDoor", "DarkRPLS_PlayerBoughtDoor", function(ply)
    local xp = DLS.XPValues("buy_door")
    DLS.checkPlayerDatabase(ply)
    DLS.addXPToPlayer(ply, xp)
    DLS.updatePlayerName(ply)

    ply:SetNWInt("darkrp_ls_level", DLS.getPlayerLevel(ply))
    ply:SetNWInt("darkrp_ls_xp", DLS.getPlayerXP(ply))
    return
end)

----------------------------------
------------- Arrested -----------
----------------------------------
hook.Add("playerArrested", "DarkRPLS_PlayerArrested", function(criminal, _, police)
    local xp_criminal = DLS.XPValues("player_arrested")
    DLS.checkPlayerDatabase(criminal)
    DLS.addXPToPlayer(criminal, xp_criminal)
    DLS.updatePlayerName(criminal)

    criminal:SetNWInt("darkrp_ls_xp", DLS.getPlayerXP(ply))

    if police:IsPlayer() and (criminal ~= police) then
        local xp_police = DLS.XPValues("player_arrest")
        DLS.checkPlayerDatabase(police)
        DLS.addXPToPlayer(police, xp_police)
        DLS.updatePlayerName(police)

        police:SetNWInt("darkrp_ls_xp", DLS.getPlayerXP(ply))
    end
    return
end)

----------------------------------
------------- Salary --------------
----------------------------------
hook.Add("playerGetSalary", "DarkRPLS_PlayerGetSalary", function(ply)
    local xp = DLS.XPValues("player_salary")
    DLS.checkPlayerDatabase(ply)
    DLS.addXPToPlayer(ply, xp)
    DLS.updatePlayerName(ply)

    ply:SetNWInt("darkrp_ls_level", DLS.getPlayerLevel(ply))
    ply:SetNWInt("darkrp_ls_xp", DLS.getPlayerXP(ply))
    return
end)

----------------------------------
------------- Lockpick ------------
----------------------------------
hook.Add("onLockpickCompleted", "DarkRPLS_PlayerLockpick", function(ply)
    local xp = DLS.XPValues("player_lockpick")
    DLS.checkPlayerDatabase(ply)
    DLS.addXPToPlayer(ply, xp)
    DLS.updatePlayerName(ply)

    ply:SetNWInt("darkrp_ls_level", DLS.getPlayerLevel(ply))
    ply:SetNWInt("darkrp_ls_xp", DLS.getPlayerXP(ply))
    return
end)

----------------------------------
--------------- Hit --------------
----------------------------------
hook.Add("onHitCompleted", "DarkRPLS_PlayerHitSuccess", function(ply)
    local xp = DLS.XPValues("player_hit_success")
    DLS.checkPlayerDatabase(ply)
    DLS.addXPToPlayer(ply, xp)
    DLS.updatePlayerName(ply)

    ply:SetNWInt("darkrp_ls_level", DLS.getPlayerLevel(ply))
    ply:SetNWInt("darkrp_ls_xp", DLS.getPlayerXP(ply))
    return
end)

hook.Add("onHitFailed", "DarkRPLS_PlayerHitFailed", function(ply)
    local xp = DLS.XPValues("player_hit_failed")
    DLS.checkPlayerDatabase(ply)
    DLS.addXPToPlayer(ply, xp)
    DLS.updatePlayerName(ply)

    ply:SetNWInt("darkrp_ls_level", DLS.getPlayerLevel(ply))
    ply:SetNWInt("darkrp_ls_xp", DLS.getPlayerXP(ply))
    return
end)

----------------------------------
------------- License ------------
----------------------------------
hook.Add("playerGotLicense", "DarkRPLS_PlayerBoughtLicense", function(ply)
    local xp = DLS.XPValues("buy_license")
    DLS.checkPlayerDatabase(ply)
    DLS.addXPToPlayer(ply, xp)
    DLS.updatePlayerName(ply)

    ply:SetNWInt("darkrp_ls_level", DLS.getPlayerLevel(ply))
    ply:SetNWInt("darkrp_ls_xp", DLS.getPlayerXP(ply))
    return
end)