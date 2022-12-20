----------------------------------
------------- Shipments ----------
----------------------------------
hook.Add("playerBoughtShipment", "DarkRPLS_PlayerBoughtShipment", function(ply)
    DLS.simpleAddXP(ply, "buy_shipment")
end)

----------------------------------
------------- Ammo ---------------
----------------------------------
hook.Add("playerBoughtAmmo", "DarkRPLS_PlayerBoughtAmmo", function(ply)
    DLS.simpleAddXP(ply, "buy_ammo")
end)

----------------------------------
------------- Vehicle ------------
----------------------------------
hook.Add("playerBoughtCustomVehicle", "DarkRPLS_PlayerBuyVehicle", function(ply, ent)
    DLS.simpleAddXP(ply, "buy_vehicle")
end)

----------------------------------
------------- Weapon --------------
----------------------------------
hook.Add("playerBoughtWeapon", "DarkRPLS_PlayerBoughtWeapon", function(ply)
    DLS.simpleAddXP(ply, "buy_weapon")
end)

----------------------------------
------------- Door ----------------
----------------------------------
hook.Add("playerBoughtDoor", "DarkRPLS_PlayerBoughtDoor", function(ply)
    DLS.simpleAddXP(ply, "buy_door")
end)

----------------------------------
------------- Arrested -----------
----------------------------------
hook.Add("playerArrested", "DarkRPLS_PlayerArrested", function(criminal, _, police)
    DLS.simpleAddXP(criminal, "player_arrested")

    if police:IsPlayer() and (criminal ~= police) then
        DLS.simpleAddXP(police, "player_arrest")
    end
end)

----------------------------------
------------- Salary --------------
----------------------------------
hook.Add("playerGetSalary", "DarkRPLS_PlayerGetSalary", function(ply)
    DLS.simpleAddXP(ply, "player_salary")
end)

----------------------------------
------------- Lockpick ------------
----------------------------------
hook.Add("onLockpickCompleted", "DarkRPLS_PlayerLockpick", function(ply)
    DLS.simpleAddXP(ply, "player_lockpick")
end)

----------------------------------
--------------- Hit --------------
----------------------------------
hook.Add("onHitCompleted", "DarkRPLS_PlayerHitSuccess", function(ply)
    DLS.simpleAddXP(ply, "player_hit_success")
end)

hook.Add("onHitFailed", "DarkRPLS_PlayerHitFailed", function(ply)
    DLS.simpleAddXP(ply, "player_hit_fail")
end)

----------------------------------
------------- License ------------
----------------------------------
hook.Add("playerGotLicense", "DarkRPLS_PlayerBoughtLicense", function(ply)
    DLS.simpleAddXP(ply, "player_license")
end)