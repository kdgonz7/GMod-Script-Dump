--[[ GMod Utility Scripts ]]
-- Universal Weapon Tilt
-- adds weapon tilting when moving left and right

print("Universal Weapon Tilt loaded v0.0.1")

hook.Add("CalcViewModelView", "UnivTilt", function(weapon, vm, oldpos, oldang, pos, ang)
	if ! IsValid(ply) then return end
	if ply:InVehicle() then
		return
	end

	local newang = angles
	newang.p = 49
	if ply:KeyDown(IN_LEFT) or ply:KeyDown(IN_RIGHT) then
		return newang, oldpos
	end
end)
