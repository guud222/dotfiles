local M = {}

local config_module = require("config")
-- local loader_module = require("winbar.loader")

local function set_winbar() end

local function setup(user_config)
	local config = config_module.apply_configuration(user_config)
	-- loader_module.load_all(config)
	set_winbar()
end

M = {
	setup = setup,
}

return M
