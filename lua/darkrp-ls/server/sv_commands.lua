util.AddNetworkString("darkrp_levelsystem_menu")
hook.Add("PlayerSay", "DarkRPLS_commands", function(ply, text)
    if istable(darkrp_ls.command) then
        for k, v in ipairs(darkrp_ls.command) do
            if string.lower(text) == string.lower(v) then
                local stats = sql.Query("SELECT * FROM " .. darkrp_ls.db .. " WHERE player = " .. sql.SQLStr(ply:SteamID64()) .. ";")
                net.Start("darkrp_levelsystem_menu")
                    net.WriteTable({
                        level = stats[1]["level"],
                        xp = stats[1]["xp"]
                    })
                net.Send(ply)
                return ""
            end
        end
    else
        if string.lower(text) == string.lower(darkrp_ls.command) then
            local stats = sql.Query("SELECT * FROM " .. darkrp_ls.db .. " WHERE player = " .. sql.SQLStr(ply:SteamID64()) .. ";")
            net.Start("darkrp_levelsystem_menu")
                net.WriteTable({
                    level = stats[1]["level"],
                    xp = stats[1]["xp"]
                })
            net.Send(ply)
            return ""
        end
    end

    return text
end)