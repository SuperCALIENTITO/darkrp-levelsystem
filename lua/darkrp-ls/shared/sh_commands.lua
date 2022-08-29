local function setPlayerLevel(ply, cmd, args)
    if not ply:IsSuperAdmin() then return end
    local target = args[1]

    for _, v in pairs(player.GetAll()) do
        if string.find(string.lower(v:Nick()), target) then
            v:SetPlayerLevel(args[2])
            MsgC(darkrp_ls.prefix_color, darkrp_ls.prefix .. "Set " .. v:Nick() .. "'s level to " .. args[2] .. ".")
        end
    end

end

local function autoComplete( cmd, args )

    args = string.Trim( args )

    local tbl = {}

    for _, v in pairs( player.GetAll() ) do
        local name = v:Nick()
        if string.find( string.lower( name ), args ) then
            nick = "\"" .. name .. "\""
            nick = "level_setlevel " .. nick
            table.insert( tbl, nick )
        end
    end

    return tbl
end

concommand.Add("level_setlevel", setPlayerLevel, autoComplete)