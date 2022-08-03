net.Receive("darkrp_levelsystem_levelup", function()
    local data = net.ReadTable()

    local ply = data.player
    local level = data.level

    chat.AddText(darkrp_ls.prefix_color, darkrp_ls.prefix, " ", Color(255, 255, 255), " ", ply:Nick(), " ", DLS_GetLanguage("levelup"), " ", level)
end)