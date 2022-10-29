
-- Changes to Ui Class
-- Targets mod loader v2.6.4

-- The mod loader's Ui Class defaults to
-- being of size 0,0.
-- Rarely is this desired, and a lot of
-- Ui object start by inheriting the size
-- of the parent ui element.

-- This file changes the default behavior
-- of the Ui Class to inherit the size of
-- its parent by default, by setting both
-- wPercent and hPercent to 1.

-- In order to leave the option to set
-- fixed values with widthpx and
-- heightpx, these functions will now
-- clear wPercent and hPercent,
-- respectively.

-- Ui
-- added compact


-- Ui.crop does much the same as UiWeightLayout.compact
-- Syncronize names.
function Ui:crop(flag)
	if flag == nil then flag = true end

	self.isCompact = flag
	self.cropped = flag

	return self
end

Ui.compact = Ui.crop
