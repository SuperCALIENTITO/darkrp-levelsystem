----------------------------------
----------- Connection -----------
----------------------------------
hook.Add("PlayerInitialSpawn", "DarkRPLS_connection", function(ply)
    DLS.checkPlayerDatabase(ply)

    timer.Simple(0.2, function()
        DLS.simpleAddXP(ply, "connection")
    end)
end)

----------------------------------
-------------- Kills -------------
----------------------------------
hook.Add("PlayerDeath", "DarkRPLS_Death", function(victim, inflictor, attacker)
    DLS.simpleAddXP(victim, "death")
    if inflictor:IsPlayer() and (victim ~= attacker) then
        DLS.simpleAddXP(attacker, "kill")
    end
end)

----------------------------------
-------------- Chats -------------
----------------------------------
hook.Add("PlayerSay", "DarkRPLS_Chat", function(ply)
    DLS.simpleAddXP(ply, "chat")
end)

----------------------------------
----------- NPC Killed -----------
----------------------------------
hook.Add("OnNPCKilled", "DarkRPLS_NPCKilled", function(npc, attacker, inflictor)
    if ( npc:IsNPC() or npc:IsNextBot() ) then
        DLS.simpleAddXP(inflictor, "npc_killed")
    end
end)

----------------------------------
------------- Toolgun ------------
----------------------------------
hook.Add("CanTool", "DarkRPLS_Toolgun", function(ply, _, _, _, button)
    if button == 107 then
        DLS.simpleAddXP(ply, "toolgun")
    end
end)