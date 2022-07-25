----------------------------------
-------- DarkRP-LS Config --------
----------------------------------

-- You also can use DLS_GetLanguage(phrase) for translations.
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
darkrp_ls.prefix_color = Color(0, 255, 0) -- The color of the prefix.
darkrp_ls.level_name = "Level" -- The name of the level.


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