----------------------------------
------------ Meth Lab ------------
----------------------------------
hook.Add("onPlayerSellMeth", "DarkRPLS_onPlayerSellMeth", function(ply, amount)
    for i=1, amount do
        DLS.simpleAddXP(ply, "methlab_payout")
    end
end)