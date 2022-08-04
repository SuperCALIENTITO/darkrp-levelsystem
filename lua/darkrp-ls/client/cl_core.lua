net.Receive("darkrp_levelsystem_levelup", function()
    local data = net.ReadTable()

    local name = data.name
    local level = data.lvl

    chat.AddText(darkrp_ls.prefix_color, darkrp_ls.prefix, Color(255, 255, 255), " ", name, " ", DLS.GetLanguage("levelup"), " ", level)
end)