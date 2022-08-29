----------------------------------
------------ Meth Lab ------------
----------------------------------
hook.Add("onPlayerSellMeth", "DarkRPLS_onPlayerSellMeth", function(ply, amount)
    local xp = DLS_XPValues("methlab_payout") * amount
    DLS_checkPlayerDatabase(ply)
    DLS_addXPToPlayer(ply, xp)
    DLS_updatePlayerName(ply)

    ply:SetNWInt("darkrp_ls_level", DLS_getPlayerLevel(ply))
    ply:SetNWInt("darkrp_ls_xp", DLS_getPlayerXP(ply))

    ply:setDarkRPVar("level", DLS_getPlayerLevel(ply))
    ply:setDarkRPVar("xp", DLS_getPlayerXP(ply))
end)