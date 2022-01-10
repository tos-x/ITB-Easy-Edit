
local VERSION = "0.0.0"

local function finalizeInit(self)
end

local function onModsMetadataDone()
	local exit = false
		or easyEdit.initialized
		or easyEdit.version > VERSION

	if exit then
		return
	end

	easyEdit:finalizeInit()
	easyEdit.initialized = true
end


local isNewestVersion = false
	or easyEdit == nil
	or modApi:isVersion(VERSION, easyEdit.version) == false

if isNewestVersion then
	easyEdit = easyEdit or {}
	easyEdit.version = VERSION
	easyEdit.finalizeInit = finalizeInit

	-- easyEdit needs to be initialized after all mods have been enumerated,
	-- but before any mod begins initializing. onModsMetadataDone will suffice.
	modApi.events.onModsMetadataDone:subscribe(onModsMetadataDone)
end

return easyEdit
