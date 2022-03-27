
-- defs
local IMG = "img/"
local ROOT_MECH = "units/player/"
local PNG = ".png"
local TILE_HALF_HEIGHT = 21

function modApi:createMechAnimations(animDefs)
	Assert.Equals('table', type(animDefs), "Argument #1")

	for file, animDef in pairs(animDefs) do
		local filePath = ROOT_MECH..file..PNG
		local fullFilePath = IMG..filePath

		if not modApi:assetExists(fullFilePath) then
			Assert.Error(string.format("Asset %q not found in resource.dat", fullFilePath))
		end

		local anim = ANIMS.MechUnit:new(animDef)
		anim.Image = filePath

		if anim.center_x then
			anim.PosX = -anim.center_x
		end

		if anim.center_y then
			anim.PosY = -anim.center_y + TILE_HALF_HEIGHT 
		end

		ANIMS[file] = anim
	end
end

function modApi:createAnimations(animDefs)
	Assert.Equals('table', type(animDefs), "Argument #1")

	for file, animDef in pairs(animDefs) do
		if type(animDef.Image) ~= 'string' then
			Assert.Error("Animation 'Image' must be a 'string'")
		end

		local filePath = animDef.Image
		local fullFilePath = IMG..filePath

		if not modApi:assetExists(fullFilePath) then
			Assert.Error(string.format("Asset %q not found in resource.dat", fullFilePath))
		end

		local base = animDef.Base or "Animation"
		local baseAnim = ANIMS[base]

		if baseAnim == nil then
			Assert.Error(string.format("Base animation %s not found", base))
		end

		local anim = baseAnim:new(animDef)

		if anim.center_x then
			anim.PosX = -anim.center_x
		end

		if anim.center_y then
			anim.PosY = -anim.center_y + TILE_HALF_HEIGHT 
		end

		ANIMS[file] = anim
	end
end