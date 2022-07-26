----------------------------------
------------ Functions -----------
----------------------------------
function DLS_getLevelPlayer(ply)
    if not IsValid(ply) then return false end

    local data = sql.Query("SELECT level FROM " .. darkrp_ls.db .. " WHERE player = " .. ply:SteamID64() .. ";")
    if #darkrp_ls["levels"] > tonumber(data[1].level) then
        return tonumber(data[1].level)
    else
        return tonumber(#darkrp_ls["levels"])
    end
end

function DLS_getXPPlayer(ply)
    if not IsValid(ply) then return false end

    local data = sql.Query("SELECT xp FROM " .. darkrp_ls.db .. " WHERE player = " .. ply:SteamID64() .. ";")
    return tonumber(data[1].xp)
end

function DLS_getLevelExp(level)
    if not level or isnumber(level) then return false end

    local xp = darkrp_ls["levels"][level]
    return tonumber(xp)
end

function DLS_setLevelPlayer(ply, level)
    if not IsValid(ply) then return false end
    if not isnumber(level) then return false end

    sql.Query("UPDATE " .. darkrp_ls.db .. " SET level = " .. level .. " WHERE player = " .. ply:SteamID64() .. ";")
    return true
end

function DLS_setXPPlayer(ply, xp)
    if not IsValid(ply) then return false end
    if not isnumber(xp) then return false end

    sql.Query("UPDATE " .. darkrp_ls.db .. " SET xp = " .. xp .. " WHERE player = " .. ply:SteamID64() .. ";")
    return true
end

function DLS_addXPToPlayer(ply, xp)
    if not IsValid(ply) then return false end
    if not isnumber(xp) then return false end

    if table.HasValue(darkrp_ls.vip_group, ply:GetUserGroup()) then
        xp = math.Round(xp * darkrp_ls.vip_multiplier)
    end


    local xp = tonumber(sql.Query("SELECT xp FROM " .. darkrp_ls.db .. " WHERE player = " .. ply:SteamID64() .. ";")[1]["xp"]) + xp
    local xp_total = DLS_getLevelExp(DLS_getLevelPlayer(ply))
    local level = DLS_getLevelPlayer(ply)

    if level == #darkrp_ls["levels"] then
        sql.Query("UPDATE " .. darkrp_ls.db .. " SET level = " .. #darkrp_ls["levels"] .. ", xp " .. sql.SQLStr(xp-xp_total) .. " WHERE player = " .. ply:SteamID64() .. ";")
    end

    if xp > xp_total then
        sql.Query("UPDATE " .. darkrp_ls.db .. " SET level = " .. sql.SQLStr(DLS_getLevelPlayer(ply) + 1) .. " WHERE player = " .. ply:SteamID64() .. ";")
        sql.Query("UPDATE " .. darkrp_ls.db .. " SET xp = " .. sql.SQLStr(xp-xp_total) .. " WHERE player = " .. ply:SteamID64() .. ";")
    else
        sql.Query("UPDATE " .. darkrp_ls.db .. " SET xp = " .. xp .. " WHERE player = " .. ply:SteamID64() .. ";")
    end

    return true
end

function DLS_updatePlayerName(ply)
    if not IsValid(ply) then return false end

    sql.Query("UPDATE " .. darkrp_ls.db .. " SET plyname = " .. sql.SQLStr(ply:Name()) .. " WHERE player = " .. ply:SteamID64() .. ";")
    return true
end

function DLS_checkPlayerDatabase(ply)
    if not IsValid(ply) then return false end

    local data = sql.Query("SELECT * FROM " .. darkrp_ls.db .. " WHERE player = " .. ply:SteamID64() .. ";")
    if not data then
        sql.Query("INSERT INTO " .. darkrp_ls.db .. " (player, plyname) VALUES (" .. ply:SteamID64() .. ", " .. sql.SQLStr(ply:Name()) .. ");")
    end

    return true
end

----------------------------------
------------ Hooks ---------------
----------------------------------