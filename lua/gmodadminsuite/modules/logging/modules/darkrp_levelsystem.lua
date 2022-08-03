local MODULE = GAS.Logging:MODULE()

-- Level UPs
MODULE.Category = "DarkRP Level System"
MODULE.Name = "Level UPs"
MODULE.Colour = Color(55, 195, 227)

MODULE:Setup(function()

    MODULE:Hook("onPlayerLevelUp", function(ply, level)
        MODULE:Log("{1} has leveled up to level {2}", GAS.Logging:FormatPlayer(ply), level)
    end)

end)

GAS.Logging:AddModule(MODULE)


-- Player Get Experience