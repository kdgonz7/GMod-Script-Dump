--[[ GMod Utility Scripts ]]
-- Siphon
-- allows players to siphon health from NPCs

-- gms_siphon_amount - how much health should be siphoned per kill

print("Siphon loaded v0.0.1")

local SIPHONAMOUNT = CreateConVar("gms_siphon_amount", 50, FCVAR_ARCHIVE)

local DoSiphon = function (play)
	local att = play
	local max = att:GetMaxHealth()
	att:SetHealth(att:Health() + SIPHONAMOUNT:GetInt())

	if att:IsPlayer() and att:Health() > max then
		local shield = att:Health() - max

		att:SetHealth(max)
		att:SetArmor(att:Armor() + shield)

		if att:Armor() > att:GetMaxArmor() then
			att:SetArmor(att:GetMaxArmor())
		end
	end
end

hook.Add("OnNPCKilled", "Siphon", function(target, attacker, inflictor)
	if ! IsValid(target) then return end
	if ! IsValid(attacker) then return end

	DoSiphon(attacker)
end)
