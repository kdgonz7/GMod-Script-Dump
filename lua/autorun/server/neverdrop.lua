--[[ GMod Utility Scripts ]]
-- NeverDrop
-- prevents NPCs from dropping weapons

print("NeverDrop loaded v0.0.1")

hook.Add("OnNPCKilled", "NeverDrop", function(npc, attacker, inflictor)
	if ! attacker:IsNPC() and ! attacker:IsPlayer() then
		return
	end

	if ! IsValid(npc) then return end

	if attacker == npc then
		return
	end

	if attacker:GetActiveWeapon() == nil then
		return
	end

	if !IsValid(npc:GetActiveWeapon()) then
		return
	end

	npc:GetActiveWeapon():Remove()

	return true
end)