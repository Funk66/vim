local gitlinker = require("gitlinker")
local hosts = require("gitlinker.hosts")

gitlinker.setup({
	callbacks = {
		["kialo.github.com"] = function(url_data)
			url_data["host"] = "github.com"
			return hosts.get_github_type_url(url_data)
		end,
	},
})
