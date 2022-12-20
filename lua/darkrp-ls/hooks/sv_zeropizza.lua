----------------------------------
---------- Zero's Pizza ----------
----------------------------------
hook.Add("zpiz_OnPizzaSold", "DarkRPLS_zpiz_OnPizzaSold", function(ply)
    DLS.simpleAddXP(ply, "zpiz_pizzasold")
end)