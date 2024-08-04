hook.Add( "AddToolMenuCategories", "catty", function()
	spawnmenu.AddToolCategory( "Options", "Unhinged", "#UNHINGED" )
end )

hook.Add( "PopulateToolMenu", "catty", function()
	spawnmenu.AddToolMenuOption( "Options", "Unhinged", "UnhingedConfig", "#Config", "", "", function( panel )
		panel:ClearControls()

		if LocalPlayer():IsSuperAdmin() then
		panel:CheckBox( "Body Dragging Enabled", "bg_body_drag_enabled" )
		panel:ControlHelp( "Enables or disables body dragging (more like body throwing but who cares)" )

		panel:CheckBox( "Grab enemies while they're alive? (Will kill them)", "bg_grab_while_alive" )
		panel:ControlHelp( "Pressing E on an enemy while they're alive will allow you to grab them if this is on. #Trepang2" )
		end

		panel:KeyBinder( "Body Drag Key", "bg_body_drag_key" )
		panel:ControlHelp( "What do you want to use to grab bodies? Default = E" )
		panel:KeyBinder( "Throw Key", "bg_body_drag_throw" )
		panel:ControlHelp( "What do you want to use to absolutely yeet bodies? Default = RIGHT CLICK" )


	end )
end )
