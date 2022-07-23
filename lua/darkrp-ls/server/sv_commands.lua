util.AddNetworkString("darkrp_levelsystem_net")
hook.Add("PlayerSay", "DarkRPLS_commands", function(ply, text)
    if string.lower(text) == "!level" then

        local stats = sql.Query("SELECT * FROM sbox_levelsystem WHERE player = " .. sql.SQLStr(ply:SteamID64()) .. ";")
        net.Start("DarkRPLS_levelsystem_net")
            net.WriteTable({
                level = stats[1]["level"],
                xp = stats[1]["xp"]
            })
        net.Send(ply)
        
        return ""
    end

    return text
end)