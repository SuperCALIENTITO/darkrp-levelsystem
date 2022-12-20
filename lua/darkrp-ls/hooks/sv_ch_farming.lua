----------------------------------
----------- CH Farming -----------
----------------------------------
hook.Add("CH_Farming_SellCrops", "DarkRPLS_ch_farming_sell_crops", function(ply)
    DLS.simpleAddXP(ply, "ch_farming_sell")
end)