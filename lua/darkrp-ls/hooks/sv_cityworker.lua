----------------------------------
----------- City Worker ----------
----------------------------------
hook.Add("CITYWORKER_FINISH", "DarkRPLS_CITYWORKER_FINISH", function(ply)
    DLS.simpleAddXP(ply, "cityworker_payout")
end)