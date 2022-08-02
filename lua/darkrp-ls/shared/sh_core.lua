----------------------------------
------------ Functions -----------
----------------------------------

-- Util --
function DLS_getPlayerLevel(ply)
    local data = tonumber(sql.Query("SELECT level FROM " .. darkrp_ls.db .. " WHERE player = " .. ply:SteamID64() .. ";")[1].level)
    if #darkrp_ls["levels"] > data then
        return data
    else
        return tonumber(#darkrp_ls["levels"])
    end
end

function DLS_getPlayerXP(ply)
    return tonumber(sql.Query("SELECT xp FROM " .. darkrp_ls.db .. " WHERE player = " .. ply:SteamID64() .. ";")[1].xp)
end

function DLS_setPlayerLevel(ply, level)
    DLS_setData(ply, "level", level)
end

function DLS_setPlayerXP(ply, xp)
    DLS_setData(ply, "xp", xp)
end

function DLS_getLevelXP(level)
    if ( #darkrp_ls["levels"] > level ) then
        return tonumber(darkrp_ls["levels"][level])
    else
        return tonumber(darkrp_ls["levels"][#darkrp_ls["levels"]])
    end
end

function DLS_getData(ply, datatype)
    return tonumber(sql.Query("SELECT " .. sql.SQLStr(datatype) .. " FROM " .. darkrp_ls.db .. " WHERE player = " .. ply:SteamID64() .. ";")[1][datatype])
end

function DLS_setData(ply, datatype, value)
    sql.Query("UPDATE " .. darkrp_ls.db .. " SET " .. sql.SQLStr(datatype) .. " = " .. sql.SQLStr(value) .. " WHERE player = " .. ply:SteamID64() .. ";")
end

function DLS_addXPToPlayer(ply, xp)
    local xp = xp
    local xp_plus = 0

    -- Global Bonus XP
    if darkrp_ls.global_xp_bonus and ( darkrp_ls.global_xp_bonus_amount >= 1 ) then
        xp_plus = math.Round(xp * ( 1 + ( darkrp_ls.global_xp_bonus_amount / 100 ) ))
    end

    -- VIPs get a bonus XP
    if table.HasValue(darkrp_ls.vip_group, ply:GetUserGroup()) and ( darkrp_ls.vip_enabled ) then
        xp_plus = math.Round(xp * darkrp_ls.vip_multiplier) + xp_plus
    end

    local level = ply:GetPlayerLevel()
    local xp = ply:GetPlayerXP() + xp
    local xp_total = ply:GetPlayerXPToNextLevel()

    if level == #darkrp_ls["levels"] then
        DLS_setData(ply, "level", #darkrp_ls["levels"])
        DLS_setData(ply, "xp", xp-xp_total)
    end

    if xp > xp_total then
        ply:SetPlayerLevel(level + 1)
        ply:SetPlayerXP(xp-xp_total)
        hook.Call("onPlayerGetXP", nil, ply, xp)
        hook.Call("onPlayerLevelUp", nil, ply, DLS_getPlayerLevel(ply))
    else
        ply:SetPlayerXP(xp)
        hook.Call("onPlayerGetXP", nil, ply, xp)
    end
end


-- Validators --
function DLS_updatePlayerName(ply)
    sql.Query("UPDATE " .. darkrp_ls.db .. " SET name = " .. sql.SQLStr(ply:Nick()) .. " WHERE player = " .. ply:SteamID64() .. ";")
end

function DLS_checkPlayerDatabase(ply)
    local data = sql.Query("SELECT * FROM " .. darkrp_ls.db .. " WHERE player = " .. ply:SteamID64() .. ";")
    if not data then
        sql.Query("INSERT INTO " .. darkrp_ls.db .. " (player, plyname) VALUES (" .. ply:SteamID64() .. ", " .. sql.SQLStr(ply:Name()) .. ");")
    end
end

function DLS_levelExists(level)
    if not level then return false end
    if not isnumber(level) then return false end

    if #darkrp_ls["levels"] > level and level >= 1 then
        return true
    else
        return false
    end
end

function DLS_XPValues(xp_type)
    if darkrp_ls.use_cvars then
        return GetConVar("darkrp_ls_" .. xp_type):Int()
    else
        return darkrp_ls.xp[xp_type]
    end
end