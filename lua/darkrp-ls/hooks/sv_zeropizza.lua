----------------------------------
---------- Zero's Pizza ----------
----------------------------------
hook.Add("zpiz_OnPizzaSold", "DarkRPLS_zpiz_OnPizzaSold", function(ply)
    local xp = DLS_XPValues("zpiz_pizzasold")
    DLS_checkPlayerDatabase(ply)
    DLS_addXPToPlayer(ply, xp)
    DLS_updatePlayerName(ply)

    ply:SetNWInt("darkrp_ls_level", DLS_getPlayerLevel(ply))
    ply:SetNWInt("darkrp_ls_xp", DLS_getPlayerXP(ply))

    ply:setDarkRPVar("level", DLS_getPlayerLevel(ply))
    ply:setDarkRPVar("xp", DLS_getPlayerXP(ply))
end)