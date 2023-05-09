hs.hotkey.bind({ "cmd", "alt", "ctrl" }, "R", function()
	hs.reload()
end)
hs.alert.show("Config loaded")

require("winbar").setup()
local spaceWatch = hs.spaces.watcher.new(require("winbar").drawing)
spaceWatch:start()
