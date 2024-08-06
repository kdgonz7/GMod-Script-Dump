Garry's Mod Scripts I've made

- Ragdoll body looting
- Siphon
- No Ragdoll Collisions
- Whistling
- Spawn Protection
- No Drop On Death
- Body Grabbing and Throwing
- Player VOX

Posted addons:

- Body Drag / Throwing
- Whistling
- Player VOX

PVOX Hooks:

    PVOX_EmitAction
        Called when an action is emitted. Do note that the default
        behaviour will not run if this function returns false.

            hook.Add("PVOX_EmitAction", function(ply, action, override, _time)
                print(ply:Nick() .. " Chose to run " .. action)
                return true
            end)

            You can also check for certain modules

            hook.Add("PVOX_EmitAction", function(ply, action, override, _time)
                return action != "confirm_kill" -- disables the kill confirming module
            end)

    PVOX_ModuleBaseClass
        Called when the module base class is being inherited.
        
        This function is where you can add custom sounds and modules to the base class.

            hook.Add("PVOX_ModuleBaseClass", function(module_id)
                return {
                    ["always_Do"] = true
                }
            end)

            -- when PVOX starts up now, always_Do is now a variable in every module