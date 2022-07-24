----------------------------------
------------- Values -------------
----------------------------------
local xp_deaths = GetConVar("darkrp_ls_deaths"):GetInt()
local xp_kills = GetConVar("darkrp_ls_kills"):GetInt()
local xp_chats = GetConVar("darkrp_ls_chats"):GetInt()
local xp_physgun = GetConVar("darkrp_ls_physgun"):GetInt()
local xp_connections = GetConVar("darkrp_ls_connections"):GetInt()

----------------------------------
----------- Connection -----------
----------------------------------
hook.Add("PlayerInitialSpawn", "DarkRPLS_connection", function(ply)
    DLS_checkPlayerDatabase(ply)
    DLS_levelUpPlayer(ply, xp_connections)
    DLS_updatePlayerName(ply)

    ply:SetNWInt("darkrp_ls_level", DLS_getLevelPlayer(ply))
    ply:SetNWInt("darkrp_ls_xp", DLS_getXPPlayer(ply))
    return
end)


----------------------------------
-------------- Kills -------------
----------------------------------
hook.Add("PlayerDeath", "DarkRPLS_Death", function(victim, inflictor, attacker)
    DLS_checkPlayerDatabase(victim)
    DLS_levelUpPlayer(victim, xp_deaths)
    DLS_updatePlayerName(victim)

    victim:SetNWInt("darkrp_ls_level", DLS_getLevelPlayer(victim))
    victim:SetNWInt("darkrp_ls_xp", DLS_getXPPlayer(victim))

    if inflictor:IsPlayer() and (victim ~= attacker) then
        DLS_checkPlayerDatabase(attacker)
        DLS_levelUpPlayer(attacker, xp_kills)
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
    DLS_levelUpPlayer(ply, xp_chats)
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
    DLS_levelUpPlayer(ply, xp_physgun)
    DLS_updatePlayerName(ply)

    ply:SetNWInt("darkrp_ls_level", DLS_getLevelPlayer(ply))
    ply:SetNWInt("darkrp_ls_xp", DLS_getXPPlayer(ply))
    return
end)