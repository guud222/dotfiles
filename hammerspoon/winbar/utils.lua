local function cycle_aware_copy(t, cache)
	if type(t) ~= "table" then
		return t
	end
	if cache[t] then
		return cache[t]
	end
	local res = {}
	cache[t] = res
	local mt = getmetatable(t)
	for k, v in pairs(t) do
		k = cycle_aware_copy(k, cache)
		v = cycle_aware_copy(v, cache)
		res[k] = v
	end
	setmetatable(res, mt)
	return res
end

local function deepcopy(t)
	return cycle_aware_copy(t, {})
end

return {
	deepcopy = deepcopy,
}
