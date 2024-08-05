--[[ GMod Utility Scripts ]]
-- I Can Hear You!
-- causes combines to hear your microphone

local VOX_Threshold = CreateConVar("vox_threshold", 0.1, {FCVAR_ARCHIVE, FCVAR_NOTIFY})

print("I Can Hear You! loaded v0.0.1")

if CLIENT then
	hook.Add("Think", "CombineHearYourMicrophone", function()
		for k, v in pairs(player.GetHumans()) do
			if v:IsSpeaking() then
				if v:VoiceVolume() * 100 > VOX_Threshold:GetInt() then
					print("FIND THEM")
				end
			end
		end
	end)
end
