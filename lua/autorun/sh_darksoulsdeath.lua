if CLIENT then



	local endtime = 0
	
	local text = Material("burger/darksouls/youdiedtext")
	local back = Material("burger/darksouls/blackbar")
	
	local latch = false
	local alpha = 255
	
	local delay = 1


	function CLIENTPlayerDeath()
		
		
		
		

		if LocalPlayer():Alive() and latch then
			latch = false
			--print("latch is now false")
		end
		
		
		if not latch and not LocalPlayer():Alive() then
			starttime = CurTime()
			alpha = 255
			latch = true
			--print("latch is now true")
			timer.Simple(1,function() LocalPlayer():EmitSound("darksouls/death.mp3") end)
			
		end

		if not LocalPlayer():Alive() then

			local timepassed = math.abs(CurTime() - starttime ) - delay
			
			if timepassed > 0 and timepassed < 8 then
		
				local mul1 = 0.5 + math.min(timepassed/10,0.1)
				
			
				if timepassed < 2 then
					alpha = (timepassed-1) * (255/2)
					--print(alpha)
				end
				
				if timepassed > 3 then
					alpha = 255 - (timepassed-1-2) * (255/3)
					--print(alpha)
				end
				
				if timepassed then
					alpha2 = (timepassed-1) * (255/1)
				end
				
				if timepassed > 4 then
					alpha2 = 255 - (timepassed-4) * (255/4)
				end
				
					
				surface.SetDrawColor( 255, 255, 255, math.Clamp(alpha2,0,255) )
				surface.SetMaterial( back )
				surface.DrawTexturedRectRotated( ScrW()/2, ScrH()/2, ScrW() , ScrW()/4 ,0 )
				
				surface.SetDrawColor( 255, 255, 255, math.Clamp(alpha,0,200) )
				surface.SetMaterial( text )
				surface.DrawTexturedRectRotated( ScrW()/2, ScrH()/2, 1024*mul1 , (128+80)*mul1,0 )
			
			end
			
			
			
			
			
		end
		 
		 
	
	end
	
	hook.Add("HUDPaint","Dark Souls Clientside Player Death",CLIENTPlayerDeath)






end