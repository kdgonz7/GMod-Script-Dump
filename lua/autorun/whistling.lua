--[[ GMod Utility Scripts ]]
-- Whistling
-- allows the player to whistle and alert NPCs to the last location
-- includes 10 unique whistling sounds

-- gmw_whistle_radius - the radius of the whistle, how many NPCs will be alerted in this radius. 0 = all NPCs
-- gmw_whistle_viewpunch - if 1, the player will be viewpunched when the whistle is played

print("Whistling loaded v0.0.1")

local WhistleViewPunch = CreateConVar("gmw_whistle_viewpunch", 1, FCVAR_ARCHIVE)

Sound("gmwhistle/whistle_1.wav")
Sound("gmwhistle/whistle_2.wav")
Sound("gmwhistle/whistle_3.wav")

local randomWhistlingSounds = {
	"gmwhistle/whistle_1.wav",
	"gmwhistle/whistle_2.wav",
	"gmwhistle/whistle_3.wav",
	"gmwhistle/whistle_4.wav",
	"gmwhistle/whistle_5.wav",
	"gmwhistle/whistle_6.wav",
	"gmwhistle/whistle_7.wav",
	"gmwhistle/whistle_8.wav",
	"gmwhistle/whistle_9.wav",
	"gmwhistle/whistle_10.wav",
}

-- the NPC classes that will be alerted
local SupportedNPCs = {
	["npc_*"] = true,
	["npc_drg*"] = true,
	["cfai_*"] = true,
	["vj_*"] = true,
	["drg_*"] = true,
}

local WHISTLECOOLDOWN = 2

hook.Add("PlayerSpawn", "Whistling", function(ply)
	ply:SetNWBool("whistling", false)
end)

hook.Add("PlayerDeath", "Whistling", function(ply)
	ply:SetNWBool("whistling", false)
end)

hook.Add("OnEntityCreated", "Whistling", function(ent)
	ent:SetNWBool("working", false)
	ent:SetNWVector("lastpos", Vector(0, 0, 0))
end)

concommand.Add("gmw_whistle", function(ply, cmd, args)
	if ply:GetNWBool("whistling", false) == true then
		return
	end

	ply:SetNWBool("whistling", true)

	local s = table.Random(randomWhistlingSounds)

	ply:EmitSound(s, 100)

	if WhistleViewPunch:GetInt() == 1 then
		ply:ViewPunch(Angle(math.random(-10, 10), math.random(-10, 10), math.random(-10, 10)))
	end

	for k, v in pairs (SupportedNPCs) do
		local elist = ents.FindByClass(k)

		for k2, v2 in pairs (elist) do
			-- v2 - entity

			if v2 == ply then
				continue
			end

			if k == "npc_*" then -- NPCs
				v2:SetSaveValue("m_vecLastPosition", ply:GetPos())
				if v2.SetSchedule != nil then
					v2:SetSchedule(SCHED_FORCED_GO_RUN)
				end
			elseif k == "drg_*" or k == "npc_drg*" then
				v2:SetNWBool("working", true)
				v2:SetNWVector("lastpos", ply:GetPos())
				v2:SetEyeTarget(ply:GetPos())
				v2:AddPatrolPos(ply:GetPos())
			end
		end
	end

	timer.Simple(WHISTLECOOLDOWN, function()
		ply:SetNWBool("whistling", false)
	end)
end)
