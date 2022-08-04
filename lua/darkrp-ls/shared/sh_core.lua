----------------------------------
------------ Functions -----------
----------------------------------


----------------------------------
-------------- Util --------------
----------------------------------
function DLS_getPlayerLevel(ply)
    return tonumber(sql.Query("SELECT level FROM " .. darkrp_ls.db .. " WHERE player = " .. ply:SteamID64() .. ";")[1].level)
end

function DLS_getPlayerXP(ply)
    local xp = tonumber(sql.Query("SELECT xp FROM " .. darkrp_ls.db .. " WHERE player = " .. ply:SteamID64() .. ";")[1].xp)
    local levels = darkrp_ls["levels"][DLS_getPlayerLevel(ply)]
    if levels == nil then DLS_setPlayerLevel(ply, #darkrp_ls["levels"]) levels = #darkrp_ls["levels"] end

    if xp > levels then
        return levels-100
    elseif xp < 0 then
        return 1
    else
        return xp
    end
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
    local xp_plus = 0

    if darkrp_ls.debug then
        print("\n--------------")
    end

    -- Global Bonus XP
    if darkrp_ls.global_xp and ( darkrp_ls.global_xp_percentage >= 1 ) then
        xp_plus = math.Round(xp * ( 1 + ( darkrp_ls.global_xp_percentage / 100 ) ))
    end

    if darkrp_ls.debug then
        print("XP Global Bonus: " .. xp_plus)
    end

    -- VIPs get a bonus XP
    if table.HasValue(darkrp_ls.vip_group, ply:GetUserGroup()) and ( darkrp_ls.vip_enabled ) then
        xp_plus = math.Round(xp * darkrp_ls.vip_multiplier) + xp_plus
    end

    if darkrp_ls.debug then
        print("XP VIP Bonus   : " .. math.Round(xp * darkrp_ls.vip_multiplier))
        print("XP Plus Total  : " .. xp_plus)
        print("XP             : " .. xp)
        print("XP Total       : " .. xp + xp_plus)
        print("XP Level       : " .. DLS_getPlayerXP(ply))
    end

    local level = DLS_getPlayerLevel(ply)
    local xp = DLS_getPlayerXP(ply) + xp + xp_plus
    local xp_total = DLS_getLevelXP(level)

    if darkrp_ls.debug then
        print("XP Total: " .. xp_total)
        print("--------------")
    end

    if xp > xp_total then
        DLS_setPlayerXP(ply, xp_total)
        hook.Call("onPlayerGetXP", nil, ply, xp_total)

        if #darkrp_ls["levels"] > level then
            DLS_setPlayerLevel(ply, level+1)
            hook.Call("onPlayerLevelUp", nil, ply, level+1)
        else
            DLS_setPlayerLevel(ply, level)
            DLS_setPlayerXP(ply, 0)
            hook.Call("onPlayerLevelUp", nil, ply, level)
        end

    else
        DLS_setPlayerXP(ply, xp)
    end
end

----------------------------------
----------- Validators -----------
----------------------------------
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
    return darkrp_ls.xp[xp_type]
end