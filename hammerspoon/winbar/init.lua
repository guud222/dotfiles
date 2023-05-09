local winbar = {}

local defaults = {
	style = {
		font = "Cascadia code",
		size = 12,
		normalColor = { red = 1, green = 1, blue = 1, alpha = 0.8 },
		activeColor = { red = 1, green = 0, blue = 0, alpha = 0.8 },
		alignment = "center",
	},
	content = function()
		return "•"
	end,
}

local function deepExtend(org, new)
	for k, v in pairs(org) do
		if type(v) == "table" then
			deepExtend(org[k], new[k] or {})
		elseif type(new[k]) == type(org[k]) then
			org[k] = new[k]
		end
	end
end

local options = {}

function winbar.setup(opts)
	deepExtend(defaults, opts or {})
	options = defaults
	winbar.drawing()
end

function winbar.drawing()
	local desk = {}

	function desk:new(isActive, id, content)
		local obj = { isActive = isActive, id = id, content = content }
		setmetatable(obj, self)
		self.__index = self
		return obj
	end

	local bar = { desks = {}, length = 0 }
	for i, v in ipairs(hs.spaces.spacesForScreen()) do
		local isActive = v == hs.spaces.activeSpaceOnScreen()
		local id = i
		local content = options.content(i)
		table.insert(bar.desks, desk:new(isActive, id, content))
		bar.length = bar.length + #options.content(id)
	end

	local width = hs.screen.mainScreen():frame().w
	local height = hs.screen.mainScreen():frame().h
	local sx = (width - bar.length * options.style.size) / 2
	local sy = height - options.style.size
	for _, des in ipairs(bar.desks) do
		local text = hs.drawing.text(
			{ x = sx, y = sy, w = #des.content * options.style.size, h = options.style.size },
			des.content
		)
		local style = options.style
		if des.isActive then
			style["color"] = style["activeColor"]
		else
			style["color"] = style["normalColor"]
		end
		text:setTextStyle(style)
		text:show()
		sx = sx + #des.content * options.style.size
	end
end

return winbar
