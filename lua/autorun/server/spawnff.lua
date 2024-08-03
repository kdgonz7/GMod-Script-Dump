--[[ GMod Utility Scripts ]]
-- SpawnFF
-- prevents spawnkilling by giving players temporary godmode on spawn.

-- sgm_spawn_cooldown - how long should it take for the player to be able to spawn again
-- sgm_spawn_remove_if_violent - removes the player if they are spamming attack keys in the first 2 seconds

local SPAWN_COOLDOWN = CreateConVar("sgm_spawn_cooldown", 5, FCVAR_ARCHIVE)
local SPAWN_REMOVE_IF_VIOLENT = CreateConVar("sgm_spawn_remove_if_violent", 0, FCVAR_ARCHIVE)

print("SpawnFF loaded v0.0.1")

hook.Add("PlayerSpawn", "SpawnFF", function(ply)
	ply:GodEnable()

	timer.Simple(SPAWN_COOLDOWN:GetInt(), function()
		if ! IsValid(ply) then return end
		if ! ply:Alive() then return end
		ply:GodDisable()
	end)
end)

hook.Add("KeyPress", "SpawnFF", function(ply, key)
	if ! SPAWN_REMOVE_IF_VIOLENT:GetBool() then return end

	timer.Simple(2, function()
		if key == IN_ATTACK or key == IN_ATTACK2 then
			ply:GodDisable()
		end
	end)
end)
