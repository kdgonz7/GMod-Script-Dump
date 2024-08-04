local C = CreateConVar("bg_body_drag_key", KEY_E, {FCVAR_USERINFO})
local T = CreateConVar("bg_body_drag_throw", MOUSE_RIGHT, {FCVAR_USERINFO})
local G = CreateConVar("bg_body_throw_grenade", MOUSE_MIDDLE, {FCVAR_USERINFO})

hook.Add("KeyPress", "BodyDrag", function(ply, key)
	if input.IsKeyDown(C:GetInt()) or input.IsMouseDown(C:GetInt()) then
		net.Start("BD_Start")
		net.SendToServer()
	end
	if (input.IsMouseDown(T:GetInt()) or key == T:GetInt() or input.IsKeyDown(T:GetInt())) then
		net.Start("BD_Throw")
		net.SendToServer()
	end

	if (input.IsMouseDown(G:GetInt()) or key == G:GetInt() or input.IsKeyDown(G:GetInt())) then
		net.Start("BD_ThrowWithGrenade")
		net.SendToServer()
	end
end)

hook.Add("KeyRelease", "BodyDrag", function(ply, key)
	if ! input.IsKeyDown(C:GetInt()) then
		net.Start("BD_Drop")
		net.SendToServer()
	end
end)
