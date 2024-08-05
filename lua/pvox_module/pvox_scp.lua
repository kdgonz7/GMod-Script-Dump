if ! PVox then return end

local NT_ENTITIES = {
    ["npc_cpt_scp_049_2"] = true,
    ["npc_cpt_scp_049_2_ntf"] = true,
}

local AFFECTED_PRESETS = {
    ["ninetailedfox"] = true,
}

MsgC(Color(255,174,0), "[NTF-SCP UTILS]", Color(255, 255, 255), " loaded!\n")

-- simple way to use extra sounds 

if CLIENT then return end

hook.Add("KeyPress", "NTF_DetectEntity", function (ply, key)
    if key == IN_ATTACK2 then
        local eyeTracer = ply:GetEyeTrace()
        if ! eyeTracer.Entity then return end

        if NT_ENTITIES[eyeTracer.Entity:GetClass()] then
            local preset = ply:GetNWString("vox_preset", "none")
            if ! AFFECTED_PRESETS[preset] then return end

            local mod = PVox.Modules[preset]
            if ! mod then return end

            mod:EmitAction(ply, "spot_zombie", true) -- custom action
        end
    end
end)

hook.Add("OnNPCKilled", "NTF_DetectKilledEntity", function (ent, attackerPLY, inflictorIDK)
    if NT_ENTITIES[ent:GetClass()] and attackerPLY:IsPlayer() then
        local preset = attackerPLY:GetNWString("vox_preset", nil)
        if ! preset || ! AFFECTED_PRESETS[preset] then return end

        local modul = PVox.Modules[preset]
        if ! modul then return end

        timer.Simple(0.1, function()
            modul:EmitAction(attackerPLY, "kill_zombie", true)
        end)
    end
end)
