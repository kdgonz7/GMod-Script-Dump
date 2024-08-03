--[[ GMod Utility Scripts ]]
-- NobodyCollide
-- prevents NPC ragdolls from colliding with players

print("NobodyCollide loaded v0.0.1")

hook.Add("CreateEntityRagdoll", "NobodyCollide", function(entity, ragdoll)
	ragdoll:SetCollisionGroup(COLLISION_GROUP_PASSABLE_DOOR)
end)
