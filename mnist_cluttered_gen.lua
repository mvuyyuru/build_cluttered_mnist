require 'image'
require "lfs"
os.execute('rm -r images')
lfs.mkdir("images")
local mnist_cluttered = require 'mnist_cluttered'
local numberOfImages = 70000
local dataConfig = {megapatch_w=100, num_dist=5, nDigits=1,targetFilling = 'combine'}
local dataInfo = mnist_cluttered.createData(dataConfig)
for i = 1, numberOfImages do
   local observation, target, coord = unpack(dataInfo.nextExample())
   local formatted = image.toDisplayTensor({input=observation})
   image.save(string.format('images/%d_%d_%d_%d.png', i,target[1],coord[1][1],coord[1][2]), formatted)
end


