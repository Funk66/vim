local gitsigns = require("gitsigns")

gitsigns.setup({
	on_attach = function()
		local map = require('cartographer')
		local key = map.n.nore.silent

		-- Navigation
		map.n.nore.expr[']c'] = "&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'"
		map.n.nore.expr['[c'] = "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'"

		-- Actions
		map.n.v.nore.silent['<leader>hs'] = gitsigns.stage_hunk
		map.n.v.nore.silent['<leader>hr'] = gitsigns.reset_hunk
		key['<leader>hS'] = gitsigns.stage_buffer
		key['<leader>hu'] = gitsigns.undo_stage_hunk
		key['<leader>hR'] = gitsigns.reset_buffer
		key['<leader>hp'] = gitsigns.preview_hunk
		key['<leader>hb'] = function()
			gitsigns.blame_line({ full = true })
		end
		key['<leader>tb'] = gitsigns.toggle_current_line_blame
		key['<leader>hd'] = gitsigns.diffthis
		key['<leader>hD'] = function()
			gitsigns.diffthis("~")
		end
		key['<leader>td'] = gitsigns.toggle_deleted

		-- Text object
		map.o.x.nore.silent['ih'] = ":<C-U>Gitsigns select_hunk<CR>"
	end,
})
