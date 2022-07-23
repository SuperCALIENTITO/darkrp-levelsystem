darkrp_ls = {}
darkrp_ls.language = {}
darkrp_ls.db = "darkrp_levelsystem"

----------------------------------
------------- Convars ------------
----------------------------------
if SERVER then
CreateConVar("darkrp_ls_connections", "15", {FCVAR_ARCHIVE, FCVAR_NOTIFY}, "The amount of xp to get when a player connects.")
CreateConVar("darkrp_ls_kills", "15", {FCVAR_ARCHIVE, FCVAR_NOTIFY}, "The amount of xp to get when a player kills someone.")
CreateConVar("darkrp_ls_deaths", "3", {FCVAR_ARCHIVE, FCVAR_NOTIFY}, "The amount of xp to get when a player dies.")
CreateConVar("darkrp_ls_chats", "1", {FCVAR_ARCHIVE, FCVAR_NOTIFY}, "The amount of xp to get when a player talks.")
CreateConVar("darkrp_ls_physgun", "2", {FCVAR_ARCHIVE, FCVAR_NOTIFY}, "The amount of xp to get when a player uses the physgun.")
end

CreateClientConVar("darkrp_ls_notify", "1", true, true, "Should the player be notified when they level up?")
CreateClientConVar("darkrp_ls_notify_sound", "1", true, true, "Should the player be notified with a sound when they level up?")
CreateClientConVar("darkrp_ls_notify_chat", "0", true, true, "Should the player be notified with a chat message when they level up?")


if SERVER and not sql.TableExists(darkrp_ls.db) then
    sql.Query([[CREATE TABLE IF NOT EXISTS]] .. darkrp_ls.db .. [[(
        id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
        player INTEGER NOT NULL,
        plyname VARCHAR(255) NOT NULL,
        level INTEGER NOT NULL DEFAULT 1,
        xp INTEGER NOT NULL DEFAULT 0
    )]])
end

----------------------------------
------------ Functions -----------
----------------------------------

local function AddFile(file, dir)
    local prefix = string.lower(string.Left(file, 3))
    if SERVER and (prefix == "sv_") then
        include(dir .. file)
        print("[DRP-LS] SERVER INCLUDE: " .. file)
    elseif (prefix == "sh_") then
        if SERVER then
            AddCSLuaFile(dir .. file)
            print("[DRP-LS] SHARED ADDCS: " .. file)
        end
        include(dir .. file)
        print("[DRP-LS] SHARED INCLUDE: " .. file)
    elseif (prefix == "cl_") then
        if SERVER then
            AddCSLuaFile(dir .. file)
            print("[DRP-LS] CLIENT ADDCS: " .. file)
        elseif CLIENT then
            include(dir .. file)
            print("[DRP-LS] CLIENT INCLUDE: " .. file)
        end
    end
end

local function AddDir(dir)
    dir = dir .. "/"

    local files, directories = file.Find(dir .. "*", "LUA")
    for _, v in ipairs(files) do
        if string.EndsWith(v, ".lua") then
            AddFile(v, dir)
        end
    end

    for _, v in ipairs(directories) do AddDir(dir .. v) end
end
AddDir("darkrp-ls")