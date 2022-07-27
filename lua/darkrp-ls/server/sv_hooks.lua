----------------------------------
----------- Connection -----------
----------------------------------
hook.Add("PlayerInitialSpawn", "DarkRPLS_connection", function(ply)
    local xp = DLS_XPValues("connection")
    DLS_checkPlayerDatabase(ply)
    DLS_addXPToPlayer(ply, xp)
    DLS_updatePlayerName(ply)

    ply:SetNWInt("darkrp_ls_level", DLS_getLevelPlayer(ply))
    ply:SetNWInt("darkrp_ls_xp", DLS_getXPPlayer(ply))
    return
end)


----------------------------------
-------------- Kills -------------
----------------------------------
hook.Add("PlayerDeath", "DarkRPLS_Death", function(victim, inflictor, attacker)
    local xp_deaths = DLS_XPValues("death")
    DLS_checkPlayerDatabase(victim)
    DLS_addXPToPlayer(victim, xp_deaths)
    DLS_updatePlayerName(victim)

    victim:SetNWInt("darkrp_ls_level", DLS_getLevelPlayer(victim))
    victim:SetNWInt("darkrp_ls_xp", DLS_getXPPlayer(victim))

    if inflictor:IsPlayer() and (victim ~= attacker) then
        local xp_kills = DLS_XPValues("kill")
        DLS_checkPlayerDatabase(attacker)
        DLS_addXPToPlayer(attacker, xp_kills)
        DLS_updatePlayerName(attacker)

        attacker:SetNWInt("darkrp_ls_level", DLS_getLevelPlayer(attacker))
        attacker:SetNWInt("darkrp_ls_xp", DLS_getXPPlayer(attacker))
    end
    return
end)


----------------------------------
-------------- Chats -------------
----------------------------------
hook.Add("PlayerSay", "DarkRPLS_Chat", function(ply)
    DLS_checkPlayerDatabase(ply)
    DLS_addXPToPlayer(ply, xp_chats)
    DLS_updatePlayerName(ply)

    ply:SetNWInt("darkrp_ls_level", DLS_getLevelPlayer(ply))
    ply:SetNWInt("darkrp_ls_xp", DLS_getXPPlayer(ply))
    return
end)


----------------------------------
------------- Physgun ------------
----------------------------------
hook.Add("PhysgunPickup", "DarkRPLS_Physgun", function(ply)
    DLS_checkPlayerDatabase(ply)
    DLS_addXPToPlayer(ply, xp_physgun)
    DLS_updatePlayerName(ply)

    ply:SetNWInt("darkrp_ls_level", DLS_getLevelPlayer(ply))
    ply:SetNWInt("darkrp_ls_xp", DLS_getXPPlayer(ply))
    return
end)