net.Receive("darkrp_levelsystem_menu", function()
    local data = net.ReadTable()

    local level = data.level
    local xp = data.xp
    local xp_total = DLS_getLevelXP(tonumber(level))

    ----------------------------------
    ------------- Windows ------------
    ----------------------------------
    local sFrame = vgui.Create("DFrame")
    sFrame:SetTitle("DarkRP Level System")
    sFrame:SetSize(300, 200)
    sFrame:Center()
    sFrame:MakePopup()

    ----------------------------------
    ------------- Labels -------------
    ----------------------------------
    local s1Label = vgui.Create("DLabel", sFrame)
    s1Label:SetPos(24, 30)
    s1Label:SetSize(285, 16)
    s1Label:SetText(DLS_GetLanguage("level_current") .. ": " .. level)

    local s1Icon = vgui.Create("DImage", sFrame)
    s1Icon:SetPos(5, 30)
    s1Icon:SetSize(16, 16)
    s1Icon:SetImage("darkrp_ls/level_add.png")

    local s2Label = vgui.Create("DLabel", sFrame)
    s2Label:SetPos(24, 50)
    s2Label:SetSize(285, 16)
    s2Label:SetText(DLS_GetLanguage("level_next1") ..  xp_total - xp .. " " .. DLS_GetLanguage("xp") .. DLS_GetLanguage("level_next2"))

    local s2Icon = vgui.Create("DImage", sFrame)
    s2Icon:SetPos(5, 50)
    s2Icon:SetSize(16, 16)
    s2Icon:SetImage("darkrp_ls/xp_add.png")

    local s3Label = vgui.Create("DLabel", sFrame)
    s3Label:SetPos(24, 70)
    s3Label:SetSize(285, 16)
    s3Label:SetText(DLS_GetLanguage("xp_current") .. ": " .. xp .. " / " .. xp_total)

    local s3Icon = vgui.Create("DImage", sFrame)
    s3Icon:SetPos(5, 70)
    s3Icon:SetSize(16, 16)
    s3Icon:SetImage("darkrp_ls/xp.png")

    local s4Label = vgui.Create("DLabel", sFrame)
    s4Label:SetPos(24, 90)
    s4Label:SetSize(285, 16)
    s4Label:SetText(DLS_GetLanguage("level") .. ": " .. level .. "/" .. #darkrp_ls["levels"])

    local s4Icon = vgui.Create("DImage", sFrame)
    s4Icon:SetPos(5, 90)
    s4Icon:SetSize(16, 16)
    s4Icon:SetImage("darkrp_ls/level.png")

    local s1Progress = vgui.Create("DProgress", sFrame)
    s1Progress:SetPos(5, 178)
    s1Progress:SetSize(290, 16)
    s1Progress:SetFraction(math.Round(xp / xp_total, 2))

    local s5Label = vgui.Create("DLabel", sFrame)
    s5Label:SetPos(118, 160)
    s5Label:SetSize(285, 16)
    s5Label:SetText(DLS_GetLanguage("progress") .. ": " .. math.Round(xp / xp_total * 100) .. "%")
end)