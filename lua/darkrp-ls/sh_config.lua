----------------------------------
-------- DarkRP-LS Config --------
----------------------------------

-- You can use DLS_GetLanguage(phrase) for translations as well.
--
-- Example:
-- darkrp_ls.level_name = DLS_GetLanguage("level")
--
-- Return:
-- English: "Level"
-- Spanish: "Nivel"


----------------------------------
--------- Generic Config ---------
----------------------------------
darkrp_ls.prefix = "[DarkRP-LS]" -- The prefix on the chat.
darkrp_ls.prefix_color = Color(91, 123, 227) -- The color of the prefix.
darkrp_ls.level_name = "Level" -- The name of the level.
darkrp_ls.command = "!level" -- The command to use. (can also be a table) { "!level", "!levels" }
darkrp_ls.db = "darkrp_levelsystem" -- The database name.
darkrp_ls.use_cvars = true -- Use the cvars to give experience?


----------------------------------
--------- Donator Config ---------
----------------------------------
darkrp_ls.vip_group = {
    "vip",
    "donator",
    "supporter",
    "moderator",
    "admin",
    "superadmin",
} -- The groups that are VIP.
darkrp_ls.vip_multiplier = 1.5 -- The multiplier for VIPs.


----------------------------------
---------- Level Config ----------
----------------------------------

-- Generic Config
darkrp_ls.xp["connection"] = 15
darkrp_ls.xp["kill"] = 15
darkrp_ls.xp["death"] = 3
darkrp_ls.xp["chat"] = 1
darkrp_ls.xp["physgun"] = 2

-- DarkRP Config
darkrp_ls.xp["buy_shipment"] = 25
darkrp_ls.xp["buy_ammo"] = 2
darkrp_ls.xp["buy_vehicle"] = 10
darkrp_ls.xp["buy_weapon"] = 5
darkrp_ls.xp["buy_door"] = 2
darkrp_ls.xp["player_arrested"] = 2
darkrp_ls.xp["player_arrest"] = 10
darkrp_ls.xp["player_salary"] = 1 -- <-- this option is like a giver of experience every time you get a salary.
darkrp_ls.xp["player_lockpick"] = 10
darkrp_ls.xp["player_hit_success"] = 40
darkrp_ls.xp["player_hit_fail"] = 8
darkrp_ls.xp["player_license"] = 10

-- if you want to disable one of the experience types, just set it to 0.