----------------------------------
----------- CH Farming -----------
----------------------------------
hook.Add("CH_Farming_SellCrops", "DarkRPLS_ch_farming_sell_crops", function(ply)
    local xp = DLS_XPValues("ch_farming_sell")
    DLS_checkPlayerDatabase(ply)
    DLS_addXPToPlayer(ply, xp)
    DLS_updatePlayerName(ply)

    ply:SetNWInt("darkrp_ls_level", DLS_getPlayerLevel(ply))
    ply:SetNWInt("darkrp_ls_xp", DLS_getPlayerXP(ply))

    ply:setDarkRPVar("level", DLS_getPlayerLevel(ply))
    ply:setDarkRPVar("xp", DLS_getPlayerXP(ply))
end)