if SERVER then
	PVox:ImplementModule("duck", function(ply)
		return {
			["print_name"] = "Duck",
			["description"] = "A duck. With 1 unique, high quality voice line.",
			["actions"] = {
				["on_ready"] = {
					"playervox/modules/duck/quack_5.mp3",
				},
				["enemy_spotted"] = "on_ready",
				["enemy_killed"] = "on_ready",
				["take_damage"] = "on_ready",
				["no_ammo"] = "on_ready",
				["death"] = "on_ready",
				["frag_out"] = "on_ready",
				["confirm_kill"] = "on_ready",
				["reload"] = "on_ready",
				["switchtaunt"] = "on_ready",
			}
		}
	end)
	PVox:RegisterPlayerModel("models/player/duckie2/duckie.mdl", "duck")
end