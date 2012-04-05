--[[

Petsitter XTreme
a SomethingAwful Game Jam Game
h_double  2012 discolingua@gmail.com

Creative Commons Attribution-NonCommercial-ShareAlike 3.0 License.
http://creativecommons.org/licenses/by-nc-sa/3.0/

]]--

-- require modules
HC = require 'hardoncollider'

-- require callbacks
require 'load'
require 'update'
require 'draw'

function on_collide(dt, shape_a, shape_b, mtv_x, mtv_y)
   if cooldown == 0 then
      statusText[#statusText+1] = string.format("Colliding. mtv = (%s,%s)", mtv_x, mtv_y)
      cooldown = maxCooldown
   end
end

function love.load()
   petLoad()
end

function love.update(dt)
   petUpdate(dt)
end

function love.draw()
   petDraw()
end