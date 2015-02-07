
if SERVER then
	function OverrideDeathSound()
		return true
	end
	
	hook.Add("PlayerDeathSound", "OverrideDeathSound", OverrideDeathSound)
end

--[[

function CheckDeath(ply,hitgroup,dmginfo)

	if dmginfo:GetDamage() >= ply:Health() then
	
		if not ply.Dying then
			ply.Dying = true
			
			ply:AnimRestartGesture( GESTURE_SLOT_CUSTOM, ACT_GMOD_DEATH, false )

			timer.Create(ply:Nick() .. "_DeathAnim", ply:SequenceDuration() , 1, function()
			
				ply:Kill()
			
			
			end)
			
			
			
		end
		
	end
			
	if ply.Dying then
		dmginfo:ScaleDamage(0)
		ply:SetHealth(0)
	end

end

hook.Add("ScalePlayerDamage","Dark Souls Death Animations",CheckDeath)

--]]


function TestAnimation(ply,cmd,args)

	--ply:AnimRestartGesture(GESTURE_SLOT_CUSTOM, ACT_GMOD_TAUNT_CHEER, true)
   -- ply:AnimSetGestureWeight(GESTURE_SLOT_CUSTOM, 1)
		
	ply:SetSequence(ply:LookupSequence("death_01"))
		
		
	print("GESTURING")

end

concommand.Add( "sendanimation", TestAnimation)


--[[

[media]http://www.youtube.com/watch?v=JAWS-Ctv0dw[/media]

[quote]
Dark Souls Death Message for Garrysmod sounds ripped from Dark Souls, textures custom made. 

Dark Souls was developed by FromSoftware, Published by BANDAI NAMCO Games. 

If you install this on your server, players who do not have this addon installed will not be able to see or hear it it unless you use resource.AddWorkshop or tell your clients to install this addon. 

I am aware that there is another Dark Souls Death Message on the workshop, this is not a copy or a reupload of that addon. If you need proof, you can view the code on github [URL="https://github.com/BurgerLUA/DarkSoulsDeath"]here[/URL]
[/quote]

[URL="http://steamcommunity.com/sharedfiles/filedetails/?id=373858511"][img]http://i.imgur.com/S7kzKcc.png[/img][/URL]

--]]

