----------------------------------
------------- Values -------------
----------------------------------
local xp_buy_shipment = GetConVar("darkrp_ls_buy_shipment"):GetInt()
local xp_buy_ammo = GetConVar("darkrp_ls_buy_ammo"):GetInt()
local xp_buy_vehicle = GetConVar("darkrp_ls_buy_vehicle"):GetInt()
local xp_buy_weapon = GetConVar("darkrp_ls_buy_weapon"):GetInt()
local xp_buy_door = GetConVar("darkrp_ls_buy_door"):GetInt()
local xp_player_arrested = GetConVar("darkrp_ls_player_arrested"):GetInt()
local xp_player_arrest = GetConVar("darkrp_ls_player_arrest"):GetInt()
local xp_player_salary = GetConVar("darkrp_ls_player_salary"):GetInt()
local xp_player_lockpick = GetConVar("darkrp_ls_player_lockpick"):GetInt()
local xp_player_hit_success = GetConVar("darkrp_ls_player_hit_success"):GetInt()
local xp_player_hit_fail = GetConVar("darkrp_ls_player_hit_fail"):GetInt()
local xp_player_license = GetConVar("darkrp_ls_player_license"):GetInt()

----------------------------------
------------- Shipments ----------
----------------------------------
hook.Add("playerBoughtShipment", "DarkRPLS_PlayerBoughtShipment", function(ply)
    DLS_checkPlayerDatabase(ply)
    DLS_levelUpPlayer(ply, xp_buy_shipment)
    DLS_updatePlayerName(ply)

    ply:SetNWInt("darkrp_ls_level", DLS_getLevelPlayer(ply))
    ply:SetNWInt("darkrp_ls_xp", DLS_getXPPlayer(ply))
    return
end)

----------------------------------
------------- Ammo ---------------
----------------------------------
hook.Add("playerBoughtAmmo", "DarkRPLS_PlayerBoughtAmmo", function(ply)
    DLS_checkPlayerDatabase(ply)
    DLS_levelUpPlayer(ply, xp_buy_ammo)
    DLS_updatePlayerName(ply)

    ply:SetNWInt("darkrp_ls_level", DLS_getLevelPlayer(ply))
    ply:SetNWInt("darkrp_ls_xp", DLS_getXPPlayer(ply))
    return
end)

----------------------------------
------------- Vehicle ------------
----------------------------------
hook.Add("playerBoughtVehicle", "DarkRPLS_PlayerBoughtVehicle", function(ply)
    DLS_checkPlayerDatabase(ply)
    DLS_levelUpPlayer(ply, xp_buy_vehicle)
    DLS_updatePlayerName(ply)

    ply:SetNWInt("darkrp_ls_level", DLS_getLevelPlayer(ply))
    ply:SetNWInt("darkrp_ls_xp", DLS_getXPPlayer(ply))
    return
end)

----------------------------------
------------- Weapon --------------
----------------------------------
hook.Add("playerBoughtWeapon", "DarkRPLS_PlayerBoughtWeapon", function(ply)
    DLS_checkPlayerDatabase(ply)
    DLS_levelUpPlayer(ply, xp_buy_weapon)
    DLS_updatePlayerName(ply)

    ply:SetNWInt("darkrp_ls_level", DLS_getLevelPlayer(ply))
    ply:SetNWInt("darkrp_ls_xp", DLS_getXPPlayer(ply))
    return
end)

----------------------------------
------------- Door ----------------
----------------------------------
hook.Add("playerBoughtDoor", "DarkRPLS_PlayerBoughtDoor", function(ply)
    DLS_checkPlayerDatabase(ply)
    DLS_levelUpPlayer(ply, xp_buy_door)
    DLS_updatePlayerName(ply)

    ply:SetNWInt("darkrp_ls_level", DLS_getLevelPlayer(ply))
    ply:SetNWInt("darkrp_ls_xp", DLS_getXPPlayer(ply))
    return
end)

----------------------------------
------------- Arrested -----------
----------------------------------
hook.Add("playerArrested", "DarkRPLS_PlayerArrested", function(criminal, _, police)
    DLS_checkPlayerDatabase(criminal)
    DLS_levelUpPlayer(criminal, xp_player_arrested)
    DLS_updatePlayerName(criminal)

    criminal:SetNWInt("darkrp_ls_xp", DLS_getXPPlayer(ply))

    if police:IsPlayer() and (criminal ~= police) then
        DLS_checkPlayerDatabase(police)
        DLS_levelUpPlayer(police, xp_player_arrest)
        DLS_updatePlayerName(police)

        police:SetNWInt("darkrp_ls_xp", DLS_getXPPlayer(ply))
    end
    return
end)

----------------------------------
------------- Salary --------------
----------------------------------
hook.Add("playerGetSalary", "DarkRPLS_PlayerGetSalary", function(ply)
    DLS_checkPlayerDatabase(ply)
    DLS_levelUpPlayer(ply, xp_player_salary)
    DLS_updatePlayerName(ply)

    ply:SetNWInt("darkrp_ls_level", DLS_getLevelPlayer(ply))
    ply:SetNWInt("darkrp_ls_xp", DLS_getXPPlayer(ply))
    return
end)

----------------------------------
------------- Lockpick ------------
----------------------------------
hook.Add("onLockpickCompleted", "DarkRPLS_PlayerLockpick", function(ply)
    DLS_checkPlayerDatabase(ply)
    DLS_levelUpPlayer(ply, xp_player_lockpick)
    DLS_updatePlayerName(ply)

    ply:SetNWInt("darkrp_ls_level", DLS_getLevelPlayer(ply))
    ply:SetNWInt("darkrp_ls_xp", DLS_getXPPlayer(ply))
    return
end)

----------------------------------
------------- Hit ----------------
----------------------------------
hook.Add("onHitCompleted", "DarkRPLS_PlayerHitSuccess", function(ply)
    DLS_checkPlayerDatabase(ply)
    DLS_levelUpPlayer(ply, xp_player_hit_success)
    DLS_updatePlayerName(ply)

    ply:SetNWInt("darkrp_ls_level", DLS_getLevelPlayer(ply))
    ply:SetNWInt("darkrp_ls_xp", DLS_getXPPlayer(ply))
    return
end)

hook.Add("onHitFailed", "DarkRPLS_PlayerHitFailed", function(ply)
    DLS_checkPlayerDatabase(ply)
    DLS_levelUpPlayer(ply, xp_player_hit_fail)
    DLS_updatePlayerName(ply)

    ply:SetNWInt("darkrp_ls_level", DLS_getLevelPlayer(ply))
    ply:SetNWInt("darkrp_ls_xp", DLS_getXPPlayer(ply))
    return
end)

----------------------------------
------------- License -------------
----------------------------------
hook.Add("playerGotLicense", "DarkRPLS_PlayerBoughtLicense", function(ply)
    DLS_checkPlayerDatabase(ply)
    DLS_levelUpPlayer(ply, xp_player_license)
    DLS_updatePlayerName(ply)

    ply:SetNWInt("darkrp_ls_level", DLS_getLevelPlayer(ply))
    ply:SetNWInt("darkrp_ls_xp", DLS_getXPPlayer(ply))
    return
end)