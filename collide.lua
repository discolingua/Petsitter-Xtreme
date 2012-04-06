function on_collide(dt, shape_a, shape_b)
   local p  -- player collider
   local o  -- other collider
   if shape_a == playerCollider then
      p = shape_a
      o = shape_b
   elseif shape_b == playerCollider then
      p = shape_b
      o = shape_a
   end
   if p and (cooldown == 0) then
      if o == petCollider then
	 -- statusText[#statusText+1] = string.format("BADGER")
	 love.audio.play(petFx)
	 playerHealth = playerHealth -1
	 cooldown = maxCooldown
	 bloodstain(playerX + 32, playerY + 32)
      else
	 for i=1, #fish do
	    if o == fish[i].fishCollider then
	       -- statusText[#statusText+1] = string.format("FISH %s", i)
	       fish[i] = nil
	       fishCreate(i)
	       playerScore = playerScore + 1000000000
	       petFrenzy = petFrenzy + .1
	       if math.random(1,3) == 1 and playerHealth < 5 then
		  playerHealth = playerHealth + 1
	       end
	    end
	 end
      end
   end
end


function bloodstain(thisX,thisY)
   local i = #blood + 1
   blood[i] = {}
   blood[i].bloodX = thisX
   blood[i].bloodY = thisY
end
