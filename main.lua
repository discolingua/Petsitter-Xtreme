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
require 'collide'


function love.load()
   petLoad()
end

function love.update(dt)
   petUpdate(dt)
end

function love.draw()
   petDraw()
end