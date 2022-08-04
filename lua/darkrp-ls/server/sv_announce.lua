hook.Add("onPlayerLevelUp", "onPlayerLevelUp", function(ply, level)
    print("Player " .. ply:Nick() .. " has leveled up to level " .. level)

    if darkrp_ls.display_level then

        net.Start("darkrp_levelsystem_levelup")
            net.WriteTable({
                lvl = tostring(level),
                name = ply:Nick()
            })

        for _, v in ipairs(player.GetAll()) do
            net.Send(v)
        end

    end
end)