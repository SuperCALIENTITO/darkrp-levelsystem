local MODULE = GAS.Logging:MODULE()

MODULE.Category = "DarkRP Level System"
MODULE.Name = "Level Ups"
MODULE.Colour = Color(55, 195, 227)

MODULE:Setup(function()

    MODULE:Hook("onPlayerLevelUp", function(ply, level)
        MODULE:Log("{1} has leveled up to level {2}", GAS.Logging:FormatPlayer(ply), level)
    end)

end)

GAS.Logging:AddModule(MODULE)