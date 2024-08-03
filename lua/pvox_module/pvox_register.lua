--* This module registers the combine playermodel for PVOX.
--*
--* this behaviour is already registered as a module, but however, not as a playermodel bind.

if SERVER then
	PVox:RegisterPlayerModel("models/player/combine_soldier.mdl", "combinesoldier")
	PVox:RegisterPlayerModel("models/player/combine_soldier_prisonguard.mdl", "combinesoldier")
end