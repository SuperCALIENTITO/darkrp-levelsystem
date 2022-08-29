----------------------------------
----------- Connection -----------
----------------------------------
hook.Add("PlayerInitialSpawn", "DarkRPLS_connection", function(ply)
    local xp = DLS.XPValues("connection")
    DLS.checkPlayerDatabase(ply)
    DLS.addXPToPlayer(ply, xp)
    DLS.updatePlayerName(ply)

    timer.Simple(1, function()
        ply:SetNWInt("darkrp_ls_level", DLS.getPlayerLevel(ply))
        ply:SetNWInt("darkrp_ls_xp", DLS.getPlayerXP(ply))
    
        ply:setDarkRPVar("level", DLS.getPlayerLevel(ply))
        ply:setDarkRPVar("xp", DLS.getPlayerXP(ply))
    end)
end)


----------------------------------
-------------- Kills -------------
----------------------------------
hook.Add("PlayerDeath", "DarkRPLS_Death", function(victim, inflictor, attacker)
    local xp_deaths = DLS.XPValues("death")
    DLS.checkPlayerDatabase(victim)
    DLS.addXPToPlayer(victim, xp_deaths)
    DLS.updatePlayerName(victim)

    victim:SetNWInt("darkrp_ls_level", DLS.getPlayerLevel(victim))
    victim:SetNWInt("darkrp_ls_xp", DLS.getPlayerXP(victim))

    victim:setDarkRPVar("level", DLS.getPlayerLevel(victim))
    victim:setDarkRPVar("xp", DLS.getPlayerXP(victim))

    if inflictor:IsPlayer() and (victim ~= attacker) then
        local xp_kills = DLS.XPValues("kill")
        DLS.checkPlayerDatabase(attacker)
        DLS.addXPToPlayer(attacker, xp_kills)
        DLS.updatePlayerName(attacker)

        attacker:SetNWInt("darkrp_ls_level", DLS.getPlayerLevel(attacker))
        attacker:SetNWInt("darkrp_ls_xp", DLS.getPlayerXP(attacker))

        attacker:setDarkRPVar("level", DLS.getPlayerLevel(attacker))
        attacker:setDarkRPVar("xp", DLS.getPlayerXP(attacker))
    end
end)


----------------------------------
-------------- Chats -------------
----------------------------------
hook.Add("PlayerSay", "DarkRPLS_Chat", function(ply)
    local xp = DLS.XPValues("chat")
    DLS.checkPlayerDatabase(ply)
    DLS.addXPToPlayer(ply, xp)
    DLS.updatePlayerName(ply)

    ply:SetNWInt("darkrp_ls_level", DLS.getPlayerLevel(ply))
    ply:SetNWInt("darkrp_ls_xp", DLS.getPlayerXP(ply))

    ply:setDarkRPVar("level", DLS.getPlayerLevel(ply))
    ply:setDarkRPVar("xp", DLS.getPlayerXP(ply))
end)


----------------------------------
------------- Physgun ------------
----------------------------------
--[[
hook.Add("PhysgunPickup", "DarkRPLS_Physgun", function(ply, ent)
    if table.HasValue(darkrp_ls.entityWhitelist, ent:GetClass()) then
        local xp = DLS.XPValues("physgun")
        DLS.checkPlayerDatabase(ply)
        DLS.addXPToPlayer(ply, xp)
        DLS.updatePlayerName(ply)
        
        ply:SetNWInt("darkrp_ls_level", DLS.getPlayerLevel(ply))
        ply:SetNWInt("darkrp_ls_xp", DLS.getPlayerXP(ply))

        ply:setDarkRPVar("level", DLS.getPlayerLevel(ply))
        ply:setDarkRPVar("xp", DLS.getPlayerXP(ply))
    end
end)
--]]

----------------------------------
----------- NPC Killed -----------
----------------------------------
hook.Add("OnNPCKilled", "DarkRPLS_NPCKilled", function(npc, attacker, inflictor)
    if ( npc:IsNPC() or npc:IsNextBot() ) then
        local xp = DLS.XPValues("npc_killed")
        DLS.checkPlayerDatabase(attacker)
        DLS.addXPToPlayer(attacker, xp)
        DLS.updatePlayerName(attacker)

        attacker:setDarkRPVar("level", DLS.getPlayerLevel(attacker))
        attacker:setDarkRPVar("xp", DLS.getPlayerXP(attacker))

        attacker:SetNWInt("darkrp_ls_level", DLS.getPlayerLevel(attacker))
        attacker:SetNWInt("darkrp_ls_xp", DLS.getPlayerXP(attacker))
    end
end)


----------------------------------
----------- Toolgun -----------
----------------------------------
hook.Add("CanTool", "DarkRPLS_Toolgun", function(ply, _, _, _, button)
    if button == 107 then
        local xp = DLS.XPValues("toolgun")
        DLS.checkPlayerDatabase(ply)
        DLS.addXPToPlayer(ply, xp)
        DLS.updatePlayerName(ply)

        ply:setDarkRPVar("level", DLS.getPlayerLevel(ply))
        ply:setDarkRPVar("xp", DLS.getPlayerXP(ply))

        ply:SetNWInt("darkrp_ls_level", DLS.getPlayerLevel(ply))
        ply:SetNWInt("darkrp_ls_xp", DLS.getPlayerXP(ply))
    end
end)