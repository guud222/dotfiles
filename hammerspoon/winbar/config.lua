local utils = require("utils")
local config = {}

local function apply_configuration(config_table)
	if not config_table then
		return utils.deepcopy(config)
	end
	local function parse_sections(section_group_name)
		if config_table[section_group_name] == nil then
			return
		end
		if not next(config_table[section_group_name]) then
			config[section_group_name] = {}
			return
		end
		for section_name, section in pairs(config_table[section_group_name]) do
			config[section_group_name][section_name] = utils.deepcopy(section)
		end
	end
	parse_sections("option")
	return utils.deepcopy(config)
end

return {
	apply_configuration = apply_configuration,
}
