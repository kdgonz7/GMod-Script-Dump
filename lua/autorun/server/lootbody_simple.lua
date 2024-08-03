--[[ GMod Utility Scripts ]]
-- LootBody
-- allows players to loot ragdoll bodies

-- gloot_max_ammo_give - how much ammo should be given to the player on looting

local MAX_AMMOGIVE = CreateConVar("gloot_max_ammo_give", 10, FCVAR_ARCHIVE)

hook.Add("CreateEntityRagdoll", "LootBody", function(entity, ragdoll)
	ragdoll:SetNWBool("looted", false)
end)

hook.Add("KeyPress", "LootBody", function(ply, key)
	if key == IN_USE then
		local trace = util.TraceLine({
			start = ply:EyePos(),
			endpos = ply:EyePos() + ply:EyeAngles():Forward() * 100,
			filter = ply
		})

		if IsValid(trace.Entity) and trace.Entity:GetClass() == "prop_ragdoll" and trace.Entity:GetNWBool("looted", false) == false then
			local playerCurrentAmmoType = ply:GetActiveWeapon():GetPrimaryAmmoType()

			if playerCurrentAmmoType ~= -1 then
				local amount = math.random(1, MAX_AMMOGIVE:GetInt())

				ply:GiveAmmo(amount, playerCurrentAmmoType, false)

				local body = trace.Entity

				body:GetPhysicsObject():SetVelocity(Vector(0, 0, 500))
				body:SetNWBool("looted", true)
			end
		end
	end
end)
