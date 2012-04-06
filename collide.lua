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
	 statusText[#statusText+1] = string.format("badger")
	 cooldown = maxCooldown
      else
	 for i=1, #fish do
	    if o == fish[i].fishCollider then
	       statusText[#statusText+1] = string.format("fish %s", i)
	       fish[i] = nil
	       fishCreate(i)
	       playerScore = playerScore + 1000000
	    end
	 end
      end
   end
end