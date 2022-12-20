----------------------------------
------------ Functions -----------
----------------------------------
local query = sql.Query
local qValue = sql.QueryValue
local toN = tonumber
local toS = tostring
local round = math.Round

----------------------------------
-------------- Util --------------
----------------------------------

function DLS.getPlayerLevel(ply)
    return toN(qValue("SELECT level FROM " .. darkrp_ls.db .. " WHERE player = \"" .. ply:SteamID() .. "\""))
end

function DLS.getPlayerXP(ply)
    local xp = toN(qValue("SELECT xp FROM " .. darkrp_ls.db .. " WHERE player = \"" .. ply:SteamID() .. "\""))
    local levels = darkrp_ls["levels"][DLS.getPlayerLevel(ply)]

    if levels == nil then
        DLS.setPlayerLevel(ply, #darkrp_ls["levels"])
        levels = #darkrp_ls["levels"]
    end

    return xp > levels and levels - 100 or xp < 0 and 1 or xp
end

function DLS.setPlayerLevel(ply, level)
    DLS.setData(ply, "level", level)
end

function DLS.setPlayerXP(ply, xp)
    DLS.setData(ply, "xp", xp)
end

function DLS.getLevelXP(level)
    return #darkrp_ls["levels"] > level and darkrp_ls["levels"][level] or darkrp_ls["levels"][#darkrp_ls["levels"]]
end

function DLS.getData(ply, datatype)
    return toN( qValue("SELECT " .. datatype .. " FROM " .. darkrp_ls.db .. " WHERE player = \"" .. ply:SteamID() .. "\"") )
end

function DLS.setData(ply, datatype, value)
    query("UPDATE " .. darkrp_ls.db .. " SET " .. datatype .. " = " .. value .. " WHERE player = \"" .. ply:SteamID() .. "\"")
end

function DLS.addXPToPlayer(ply, xp)
    if xp == 0 then return end

    local xp_plus = 0

    -- Global Bonus XP
    if darkrp_ls.global_xp then
        xp_plus = round( xp * darkrp_ls.global_xp_ratio )
    end

    -- VIPs get a bonus XP
    if darkrp_ls.vip_group[ply:GetUserGroup()] and darkrp_ls.vip_enabled then
        xp_plus = round( xp * darkrp_ls.vip_ratio ) + xp_plus
    end

    -- Random XP
    if darkrp_ls.xp_random then
        xp = math.random( xp, round(xp/2) )
        xp_plus = math.random( xp_plus, round(xp_plus/2) )
    end

    hook.Run("onPlayerGetXP", ply, xp, xp_plus)

    local level = DLS.getPlayerLevel(ply)
    local xp = DLS.getPlayerXP(ply) + xp + xp_plus
    local xp_total = DLS.getLevelXP(level)

    if xp > xp_total then
        DLS.setPlayerXP(ply, xp-xp_total)

        if #darkrp_ls["levels"] > level then
            DLS.setPlayerLevel(ply, level+1)
            hook.Run("onPlayerLevelUp", ply, level+1)
        else
            DLS.setPlayerLevel(ply, level)
            DLS.setPlayerXP(ply, 0)
            hook.Run("onPlayerLevelUp", ply, level)
        end

    else
        DLS.setPlayerXP(ply, xp)
    end
end

----------------------------------
----------- Validators -----------
----------------------------------
function DLS.updatePlayerName(ply)
    query("UPDATE " .. darkrp_ls.db .. " SET plyname  = " .. sql.SQLStr(ply:Nick()) .. " WHERE player = \"" .. ply:SteamID() .. "\"")
end

function DLS.getLevelXP(level)
    return #darkrp_ls["levels"] > level and darkrp_ls["levels"][level] or darkrp_ls["levels"][#darkrp_ls["levels"]]
end

function DLS.getData(ply, datatype)
    return tonumber(qValue("SELECT " .. datatype .. " FROM " .. darkrp_ls.db .. " WHERE player = \"" .. ply:SteamID() .. "\""))
end

function DLS.setData(ply, datatype, value)
    query("UPDATE " .. darkrp_ls.db .. " SET " .. datatype .. " = " .. value .. " WHERE player = \"" .. ply:SteamID() .. "\"")
end

function DLS.checkPlayerDatabase(ply)
    if not ply:IsPlayer() then return end

    local data = query("SELECT * FROM " .. darkrp_ls.db .. " WHERE player = \"" .. ply:SteamID() .. "\"")
    if not data then
        query("INSERT INTO " .. darkrp_ls.db .. " (player, plyname) VALUES (\"" .. ply:SteamID() .. "\", " .. sql.SQLStr(ply:Name()) .. ")")
    end
end

function DLS.levelExists(level)
    if not level then return false end
    if not isnumber(level) then return false end

    return #darkrp_ls["levels"] > level and level >= 1
end

function DLS.XPValues(xp_type)
    return darkrp_ls.xp[xp_type]
end

function DLS.simpleAddXP(ply, Type)
    local xp = DLS.XPValues(Type)
    DLS.addXPToPlayer(ply, xp)
    DLS.updatePlayerName(ply)

    ply:SetNWInt("darkrp_ls_level", DLS.getPlayerLevel(ply))
    ply:SetNWInt("darkrp_ls_xp", DLS.getPlayerXP(ply))

    ply:setDarkRPVar("level", DLS.getPlayerLevel(ply))
    ply:setDarkRPVar("xp", DLS.getPlayerXP(ply))
end