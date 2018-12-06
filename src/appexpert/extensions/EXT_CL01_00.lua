function NSTEXT : HASDUPLICATES (separator : NSTEXT) : NSBOOL

	local previousItem = ""
	local result = false
	local regex = "[^" .. separator .. "]+"
	for currentItem in string.gmatch(self, regex) do
		if currentItem == previousItem then
			result = true
		else
			previousItem = currentItem
		end
	end
	return result
end