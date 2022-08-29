----------------------------------
------------ Functions -----------
----------------------------------


----------------------------------
-------------- Util --------------
----------------------------------

function DLS.getPlayerLevel(ply)
    local v = tonumber(sql.Query("SELECT level FROM " .. darkrp_ls.db .. " WHERE player = " .. ply:SteamID64() .. ";")[1].level)
    return v
end

function DLS.getPlayerXP(ply)
    local xp = tonumber(sql.Query("SELECT xp FROM " .. darkrp_ls.db .. " WHERE player = " .. ply:SteamID64() .. ";")[1].xp)
    local levels = darkrp_ls["levels"][DLS.getPlayerLevel(ply)]
    if levels == nil then DLS.setPlayerLevel(ply, #darkrp_ls["levels"]) levels = #darkrp_ls["levels"] end

    if xp > levels then
        return levels-100
    elseif xp < 0 then
        return 1
    else
        return xp
    end
end

function DLS.setPlayerLevel(ply, level)
    DLS.setData(ply, "level", level)
end

function DLS.setPlayerXP(ply, xp)
    DLS.setData(ply, "xp", xp)
end

function DLS.getLevelXP(level)
    if ( #darkrp_ls["levels"] > level ) then
        return tonumber(darkrp_ls["levels"][level])
    else
        return tonumber(darkrp_ls["levels"][#darkrp_ls["levels"]])
    end
end

function DLS.getData(ply, datatype)
    return tonumber(sql.Query("SELECT " .. sql.SQLStr(datatype) .. " FROM " .. darkrp_ls.db .. " WHERE player = " .. ply:SteamID64() .. ";")[1][datatype])
end

function DLS.setData(ply, datatype, value)
    sql.Query("UPDATE " .. darkrp_ls.db .. " SET " .. sql.SQLStr(datatype) .. " = " .. sql.SQLStr(value) .. " WHERE player = " .. ply:SteamID64() .. ";")
end

function DLS.addXPToPlayer(ply, xp)
    local xp_plus = 0

    -- Global Bonus XP
    if darkrp_ls.global_xp and ( darkrp_ls.global_xp_percentage >= 1 ) then
        xp_plus = math.Round(xp * ( 1 + ( darkrp_ls.global_xp_percentage / 100 ) ))
    end

    -- VIPs get a bonus XP
    if table.HasValue(darkrp_ls.vip_group, ply:GetUserGroup()) and ( darkrp_ls.vip_enabled ) then
        xp_plus = math.Round(xp * darkrp_ls.vip_multiplier) + xp_plus
    end

    local level = DLS.getPlayerLevel(ply)
    local xp = DLS.getPlayerXP(ply) + xp + xp_plus
    local xp_total = DLS.getLevelXP(level)

    if xp > xp_total then
        DLS.setPlayerXP(ply, xp-xp_total)
        hook.Call("onPlayerGetXP", nil, ply, xp)

        if #darkrp_ls["levels"] > level then
            DLS.setPlayerLevel(ply, level+1)
            hook.Call("onPlayerLevelUp", nil, ply, level+1)
        else
            DLS.setPlayerLevel(ply, level)
            DLS.setPlayerXP(ply, 0)
            hook.Call("onPlayerLevelUp", nil, ply, level)
        end

    else
        DLS.setPlayerXP(ply, xp)
    end
end

----------------------------------
----------- Validators -----------
----------------------------------
function DLS.updatePlayerName(ply)
    sql.Query("UPDATE " .. darkrp_ls.db .. " SET plyname  = " .. sql.SQLStr(ply:Nick()) .. " WHERE player = " .. ply:SteamID64() .. ";")
end

function DLS.getLevelXP(level)
    if ( #darkrp_ls["levels"] > level ) then
        return tonumber(darkrp_ls["levels"][level])
    else
        return tonumber(darkrp_ls["levels"][#darkrp_ls["levels"]])
    end
end

function DLS.getData(ply, datatype)
    return tonumber(sql.Query("SELECT " .. sql.SQLStr(datatype) .. " FROM " .. darkrp_ls.db .. " WHERE player = " .. ply:SteamID64() .. ";")[1][datatype])
end

function DLS.setData(ply, datatype, value)
    sql.Query("UPDATE " .. darkrp_ls.db .. " SET " .. sql.SQLStr(datatype) .. " = " .. sql.SQLStr(value) .. " WHERE player = " .. ply:SteamID64() .. ";")
end

function DLS.addXPToPlayer(ply, xp)
    local xp_plus = 0

    -- Global Bonus XP
    if darkrp_ls.global_xp and ( darkrp_ls.global_xp_percentage >= 1 ) then
        xp_plus = math.Round(xp * ( 1 + ( darkrp_ls.global_xp_percentage / 100 ) ))
    end

    -- VIPs get a bonus XP
    if table.HasValue(darkrp_ls.vip_group, ply:GetUserGroup()) and ( darkrp_ls.vip_enabled ) then
        xp_plus = math.Round(xp * darkrp_ls.vip_multiplier) + xp_plus
    end

    local level = DLS.getPlayerLevel(ply)
    local xp = DLS.getPlayerXP(ply) + xp + xp_plus
    local xp_total = DLS.getLevelXP(level)

    if xp > xp_total then
        DLS.setPlayerXP(ply, xp-xp_total)
        hook.Call("onPlayerGetXP", nil, ply, xp-xp_total)

        if #darkrp_ls["levels"] > level then
            DLS.setPlayerLevel(ply, level+1)
            hook.Call("onPlayerLevelUp", nil, ply, level+1)
        else
            DLS.setPlayerLevel(ply, level)
            DLS.setPlayerXP(ply, 0)
            hook.Call("onPlayerLevelUp", nil, ply, level)
        end

    else
        DLS.setPlayerXP(ply, xp)
    end
end

----------------------------------
----------- Validators -----------
----------------------------------
function DLS.updatePlayerName(ply)
    sql.Query("UPDATE " .. darkrp_ls.db .. " SET name = " .. sql.SQLStr(ply:Nick()) .. " WHERE player = " .. ply:SteamID64() .. ";")
end

function DLS.checkPlayerDatabase(ply)
    local data = sql.Query("SELECT * FROM " .. darkrp_ls.db .. " WHERE player = " .. ply:SteamID64() .. ";")
    if not data then
        sql.Query("INSERT INTO " .. darkrp_ls.db .. " (player, plyname) VALUES (" .. ply:SteamID64() .. ", " .. sql.SQLStr(ply:Name()) .. ");")
    end
end

function DLS.levelExists(level)
    if not level then return false end
    if not isnumber(level) then return false end

    if #darkrp_ls["levels"] > level and level >= 1 then
        return true
    else
        return false
    end
end

function DLS.XPValues(xp_type)
    return darkrp_ls.xp[xp_type]
end