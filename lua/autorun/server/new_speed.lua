--[[ GMod Utility Scripts ]]
-- NewSpeed
-- Modifies player speed values to be more realistic

print("NewSpeed loaded v0.0.1")

local EnableNewSpeed = CreateConVar("ns_enabled", 1, {FCVAR_ARCHIVE, FCVAR_NOTIFY})

local LerpC = function(a, b, time) return a + (b - a) * time end

local LFAC = 0.1

hook.Add("SetupMove", "ns_Spawn", function(ply, mv, cmd)
	if ! IsValid(ply) then return end

	if ! EnableNewSpeed:GetBool() then
		return
	end

	ply:SetRunSpeed(180)
	ply:SetWalkSpeed(100)

	local MouseX = cmd:GetMouseX()

	if MouseX == 0 then
		local newang = ply:EyeAngles()
		newang.z = LerpC(newang.z, 0, 0.2)
		ply:SetEyeAngles(LerpC(ply:EyeAngles(), newang, LFAC))
	else
		if MouseX < 5 and MouseX > -5 then
			return
		end
		local c = math.Clamp(MouseX, -1, 1)
		local e = ply:EyeAngles() + Angle(0, 0, c)

		e.z = LerpC(e.z, c, 0.06)
		ply:SetEyeAngles(LerpC(ply:EyeAngles(), e, 0.1))
	end

	local c = math.Clamp(MouseX, -1, 1)

	ply.LastMouseX = MouseX
end)


