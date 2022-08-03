util.AddNetworkString("darkrp_levelsystem_levelup")
hook.Add("onPlayerLevelUp", "LevelUpLololololol", function(ply, level)
    if darkrp_ls.display_level then

        net.Start("darkrp_levelsystem_levelup")
        net.WriteTable({
            player = ply:Nick(),
            level = level,
        })
        
        for _, v in ipairs(player.GetAll()) do
            net.Send(v)
        end

    end
end)