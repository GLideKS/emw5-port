--Safe Freeslotting from Chrispy Chars
rawset(_G,"SafeFreeslot",function(...)
	local to_freeslot = {...}
	local returning = nil
	local single = (#to_freeslot == 1)
	for _, item in ipairs(to_freeslot) do
		if rawget(_G, item) == nil then
			if single then
				returning = freeslot(item)
			else
				freeslot(item)
			end
		end
	end
	return returning
end)