function on_collide(dt, shape_a, shape_b)
   if cooldown == 0 then
      if shape_a == petCollider then
	 statusText[#statusText+1] = string.format("badger")
      elseif shape_a == playerCollider then
	 statusText[#statusText+1] = string.format("player")
      end
      cooldown = maxCooldown
   end
end