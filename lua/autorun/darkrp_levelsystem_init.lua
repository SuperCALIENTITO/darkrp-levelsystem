DLS = {}
darkrp_ls = {}
darkrp_ls.xp = {}
darkrp_ls.language = {}

----------------------------------
--------- Network String ---------
----------------------------------
if SERVER then
    util.AddNetworkString("darkrp_levelsystem_levelup")
    util.AddNetworkString("darkrp_levelsystem_menu")
end

----------------------------------
------------ Functions -----------
----------------------------------

local function AddFile(file, dir)
    local prefix = string.lower(string.Left(file, 3))
    if SERVER and (prefix == "sv_") then
        include(dir .. file)
        print("[DARKRP-LS] SERVER INCLUDE: " .. dir .. file)
    elseif (prefix == "sh_") then
        if SERVER then
            AddCSLuaFile(dir .. file)
            print("[DARKRP-LS] SHARED ADDCS:   " .. dir .. file)
        end
        include(dir .. file)
        print("[DARKRP-LS] SHARED INCLUDE: " .. dir .. file)
    elseif (prefix == "cl_") then
        if SERVER then
            AddCSLuaFile(dir .. file)
            print("[DARKRP-LS] CLIENT ADDCS:   " .. dir .. file)
        elseif CLIENT then
            include(dir .. file)
            print("[DARKRP-LS] CLIENT INCLUDE: " .. dir .. file)
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