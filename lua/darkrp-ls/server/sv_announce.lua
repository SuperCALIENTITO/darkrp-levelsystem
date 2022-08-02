hook.Add("onPlayerLevelUp", "LevelUpLololololol", DLS_AnnounceLevelUp(ply, level)
    if darkrp_ls.display_level then
        for _, v in ipairs(player.GetAll()) do
            v:ChatPrint(darkrp_ls.prefix .. " " .. ply:Nick() .. " " .. DLS_GetLanguage("levelup") .. " " .. level.. ".")
        end
    end
end)