local LerpC = function(a, b, c) return a + (b - a) * c end

local OpacityStart = CurTime()
local OpacityDuration = 5

hook.Add("HUDPaint", "SpawnFF", function()
	if LocalPlayer():HasGodMode() and ! GetConVar("sbox_godmode"):GetBool()  then
		local Progress = ( CurTime() - OpacityStart ) / OpacityDuration
		local Opacity = Lerp( Progress, 255, 0 )

		draw.SimpleText("YOU ARE BEING SPAWN PROTECTED", "DermaLarge", ScrW() * 0.5, ScrH() * 0.8, Color(255, 255, 255, Opacity), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

		if Opacity == 0 then
			OpacityStart = CurTime()
		end
	end
end)
