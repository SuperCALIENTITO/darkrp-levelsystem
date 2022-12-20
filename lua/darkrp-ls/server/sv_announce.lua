hook.Add("onPlayerLevelUp", "onPlayerLevelUp", function(ply, level)

    if darkrp_ls.debug then
        print("[DarkRP_LS] " .. ply:Nick() .. " has leveled up to level " .. level .. "!")
    end

    if darkrp_ls.display_level then

        net.Start("darkrp_levelsystem_levelup")
            net.WriteString(ply:Nick())
            net.WriteInt(level)
		net.Broadcast()
    end
end)