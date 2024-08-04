local C = CreateConVar("bg_body_drag_key", KEY_E, {FCVAR_USERINFO})
local T = CreateConVar("bg_body_drag_throw", IN_ATTACK2, {FCVAR_USERINFO})

hook.Add("KeyPress", "BodyDrag", function(ply, key)
	if input.IsKeyDown(C:GetInt()) or input.IsMouseDown(C:GetInt()) then
		net.Start("BD_Start")
		net.SendToServer()
	end
	if (input.IsMouseDown(T:GetInt()) or key == T:GetInt() or input.IsKeyDown(T:GetInt())) then
		net.Start("BD_Throw")
		net.SendToServer()
	end
end)

hook.Add("KeyRelease", "BodyDrag", function(ply, key)
	if ! input.IsKeyDown(C:GetInt()) then
		net.Start("BD_Drop")
		net.SendToServer()
	end
end)
