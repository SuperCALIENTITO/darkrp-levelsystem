----------------------------------
------------ Functions -----------
----------------------------------
function DLS_getData(ply, datatype)
    if ( not ply:IsPlayer() ) then return 0 end
    if ( not datatype or isstring(datatype) ) then return 0 end

    return tonumber(sql.Query("SELECT " .. sql.SQLStr(datatype) .. " FROM " .. darkrp_ls.db .. " WHERE steamid = " .. ply:SteamID() .. ";")[1][datatype])
end

function DLS_setData(ply, datatype, value)
    if ( not ply:IsPlayer() ) then return false end
    if ( not datatype or isstring(datatype) ) then return false end
    if ( not value or isstring(value) ) then return false end

    sql.Query("UPDATE " .. darkrp_ls.db .. " SET " .. sql.SQLStr(datatype) .. " = " .. sql.SQLStr(value) .. " WHERE steamid = " .. ply:SteamID() .. ";")

    return true
end

function DLS_getLevelPlayer(ply)
    if ( not ply:IsPlayer() ) then return 0 end

    local data = DLS_getData(ply, "level")
    if #darkrp_ls["levels"] > data then
        return data
    else
        return tonumber(#darkrp_ls["levels"])
    end
end

function DLS_getXPPlayer(ply)
    if ( not ply:IsPlayer() ) then return 0 end

    return DLS_getData(ply, "xp")
end

function DLS_getLevelExp(level)
    if ( not level or not isnumber(level) ) then return 0 end

    local xp = darkrp_ls["levels"][level]
    return tonumber(xp)
end

function DLS_setLevelPlayer(ply, level)
    if ( not ply:IsPlayer() ) then return false end
    if ( not level or not isnumber(level) ) then return false end

    DLS_setData(ply, "level", level)
    return true
end

function DLS_setXPPlayer(ply, xp)
    if ( not ply:IsPlayer() ) then return false end
    if ( not level or not isnumber(xp) ) then return false end

    DLS_setData(ply, "xp", xp)
    return true
end

function DLS_addXPToPlayer(ply, xp)
    if ( not ply:IsPlayer() ) then return false end
    if ( not level or not isnumber(xp) ) then return false end

    if table.HasValue(darkrp_ls.vip_group, ply:GetUserGroup()) then
        xp = math.Round(xp * darkrp_ls.vip_multiplier)
    end

    local level = DLS_getLevelPlayer(ply)
    local xp = DLS_getXPPlayer(ply) + xp
    local xp_total = DLS_getLevelExp(level)

    if level == #darkrp_ls["levels"] then
        DLS_setData(ply, "level", #darkrp_ls["levels"])
        DLS_setData(ply, "xp", xp-xp_total)
    end

    if xp > xp_total then
        DLS_setData(ply, "level", level+1)
        DLS_setData(ply, "xp", xp-xp_total)
    else
        DLS_setData(ply, "xp", xp)
    end

    return true
end

function DLS_updatePlayerName(ply)
    if not IsValid(ply) then return false end

    DLS_setData(ply, "name", ply:Nick())
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