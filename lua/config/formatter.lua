local formatter = require("formatter")
local map = require("cartographer")
local key = map.n.nore.silent

local filetypes = {
	css = {
		exe = "prettier",
		args = { "--stdin-filepath", vim.api.nvim_buf_get_name(0) },
		stdin = true,
	},
	lua = {
		exe = "stylua",
		args = {},
		stdin = false,
	},
	go = {
		exe = "gofmt",
		args = {},
		stdin = false,
	},
	html = {
		exe = "prettier",
		args = { "--stdin-filepath", vim.api.nvim_buf_get_name(0) },
		stdin = true,
	},
	javascript = {
		exe = "prettier",
		args = { "--stdin-filepath", vim.api.nvim_buf_get_name(0) },
		stdin = true,
	},
	json = {
		exe = "jq",
		args = {},
		stdin = true,
	},
	markdown = {
		exe = "prettier",
		args = { "--stdin-filepath", vim.api.nvim_buf_get_name(0) },
		stdin = true,
	},
	python = {
		exe = "black",
		args = { "--quiet" },
		stdin = false,
	},
	sh = {
		exe = "shfmt",
		args = { "-w" },
		stdin = false,
	},
	terraform = {
		exe = "terraform",
		args = { "fmt" },
		stdin = false,
	},
	yaml = {
		exe = "prettier",
		args = { "--stdin-filepath", vim.api.nvim_buf_get_name(0) },
		stdin = true,
	},
}

local config = {}
for lang, params in pairs(filetypes) do
	config[lang] = {
		function()
			return params
		end,
	}
end

formatter.setup({
	filetype = config,
})

key["<leader>f"] = ":Format<CR>"
