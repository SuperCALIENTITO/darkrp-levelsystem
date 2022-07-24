----------------------------------
------------ Functions -----------
----------------------------------
function DLS_getLevelPlayer(ply)
    local data = sql.Query("SELECT level FROM " .. darkrp_ls.db .. " WHERE player = " .. ply:SteamID64() .. ";")
    if #darkrp_ls["levels"] > tonumber(data[1].level) then
        return tonumber(data[1].level)
    else
        return tonumber(#darkrp_ls["levels"])
    end
end

function DLS_getXPPlayer(ply)
    local data = sql.Query("SELECT xp FROM " .. darkrp_ls.db .. " WHERE player = " .. ply:SteamID64() .. ";")
    return tonumber(data[1].xp)
end

function DLS_getLevelExp(level)
    local xp = darkrp_ls["levels"][level]
    return tonumber(xp)
end

function DLS_checkPlayerDatabase(ply)
    local data = sql.Query("SELECT * FROM " .. darkrp_ls.db .. " WHERE player = " .. ply:SteamID64() .. ";")
    if not data then
        sql.Query("INSERT INTO " .. darkrp_ls.db .. " (player, plyname) VALUES (" .. ply:SteamID64() .. ", " .. sql.SQLStr(ply:Name()) .. ");")
    end
end

function DLS_levelUpPlayer(ply, xp_type)
    local xp = tonumber(sql.Query("SELECT xp FROM " .. darkrp_ls.db .. " WHERE player = " .. ply:SteamID64() .. ";")[1]["xp"]) + xp_type
    local xp_total = DLS_getLevelExp(DLS_getLevelPlayer(ply))
    local level = DLS_getLevelPlayer(ply)

    if level == #darkrp_ls["levels"] then
        sql.Query("UPDATE " .. darkrp_ls.db .. " SET level = " .. #darkrp_ls["levels"] .. ", xp " .. sql.SQLStr(xp-xp_total) .. " WHERE player = " .. ply:SteamID64() .. ";")
    end

    if xp > xp_total then
        sql.Query("UPDATE " .. darkrp_ls.db .. " SET level = " .. sql.SQLStr(DLS_getLevelPlayer(ply) + 1) .. ", xp = 0 WHERE player = " .. ply:SteamID64() .. ";")
        sql.Query("UPDATE " .. darkrp_ls.db .. " SET xp = " .. sql.SQLStr(xp-xp_total) .. " WHERE player = " .. ply:SteamID64() .. ";")
    else
        sql.Query("UPDATE " .. darkrp_ls.db .. " SET xp = " .. xp .. " WHERE player = " .. ply:SteamID64() .. ";")
    end
end

function DLS_updatePlayerName(ply)
    sql.Query("UPDATE " .. darkrp_ls.db .. " SET plyname = " .. sql.SQLStr(ply:Name()) .. " WHERE player = " .. ply:SteamID64() .. ";")
end

----------------------------------
------------ Hooks ---------------
----------------------------------
local DarkRP_LS = {}
function DarkRP_LS:IsValid()
    return true
end

function DarkRP_LS:PlayerLevelUp(ply)
    print("DLS_levelUpPlayer", self, ply)
end

hook.Add("DLS_levelUpPlayer", "DarkRP_LS", DarkRP_LS.PlayerLevelUp)

