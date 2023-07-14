return {
	"nvim-web-devicons",
	opts = {
		color_icons = true,
		default = false,
		strict = false,
	},
	config = function()
		local devicons = require("nvim-web-devicons")
		devicons.set_default_icon("")
		devicons.set_icon({ xml = { icon = "󰗀", name = "Xml" } })
		devicons.set_icon({ md = { icon = "", name = "Md" } })
		local npms = { "", "-lock" }
		for _, npm in ipairs(npms) do
			devicons.set_icon({
				["package" .. npm .. ".json"] = {
					icon = "󱧘",
					name = "PackageJson",
				},
			})
		end
		local ymls = { "yml", "yaml" }
		for _, yml in ipairs(ymls) do
			devicons.set_icon({ yml = { icon = "", name = "Yaml" } })
		end
		local envs = { "", ".dev", ".development", ".stage", ".staging", ".prod", ".production", ".dist" }
		for _, env in ipairs(envs) do
			devicons.set_icon({
				[".env" .. env] = { icon = "󰫧", name = "Env" },
			})
		end
		local configs = { "envrc", "editorconfig" }
		for _, config in ipairs(configs) do
			devicons.set_icon({
				["." .. config] = { icon = "", name = "Config" },
			})
		end
		devicons.set_icon({
			[".gitignore"] = { icon = "󰊤", name = "GitIgnore" },
		})
		local words = { "doc", "docm", "docx", "odt" }
		for _, word in ipairs(words) do
			devicons.set_icon({
				[word] = { icon = "󰈭", name = "Doc" },
			})
		end
	end,
}
