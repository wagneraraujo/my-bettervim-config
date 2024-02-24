vim.cmd([[
set clipboard+=unnamedplus
]])

require("better-vim.plugins-configs");
return {
	theme = {
		name = "catppuccin",
		flavours = "mocha",
	},

	mappings = {
		custom = {
			["<c-m>"] = { "<cmd>NvimTreeFocus<cr>", "Open file explorer", noremap = true },
			["<c-Left>"] = { "<cmd>BufferLineCyclePrev<cr>", "Open file explorer", noremap = true },
			["<c-Right>"] = { "<cmd>BufferLineCycleNext<cr>", "Open file explorer", noremap = true },
		},
	},
	bufferline = {


	},
	plugins = {
		{
			"chentoast/marks.nvim",
			config = function()
				require("marks").setup({
					mappings = {
						set_next = "m,",
						next = "m]",
						preview = "m:",
						prev = false,
					},
				})
			end,
		},
		{
			"sbdchd/neoformat",
		},
		{
			'anuvyklack/pretty-fold.nvim',
			config = function()
				require('pretty-fold').setup({
					config = {
						sections = {
							left = {
								'content',
							},
							right = {
								' ', 'number_of_folded_lines', ': ', 'percentage', ' ',
								function(config) return config.fill_char:rep(3) end
							}
						},
						fill_char = '•',

						remove_fold_markers = true,

						-- Keep the indentation of the content of the fold string.
						keep_indentation = true,

						-- Possible values:
						-- "delete" : Delete all comment signs from the fold string.
						-- "spaces" : Replace all comment signs with equal number of spaces.
						-- false    : Do nothing with comment signs.
						process_comment_signs = 'spaces',

						-- Comment signs additional to the value of `&commentstring` option.
						comment_signs = {},

						-- List of patterns that will be removed from content foldtext section.
						stop_words = {
							'@brief%s*', -- (for C++) Remove '@brief' and all spaces after.
						},

						add_close_pattern = true, -- true, 'last_line' or false

						matchup_patterns = {
							{ '{', '}' },
							{ '%(', ')' }, -- % to escape lua pattern char
							{ '%[', ']' }, -- % to escape lua pattern char
						},

						ft_ignore = { 'neorg' },
					}
				})
			end
		},
-- 		vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
-- vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)
		{"kevinhwang91/nvim-ufo", dependencies = 'kevinhwang91/promise-async',
			config = function()
				require("ufo").setup{{
					mappings = {
					["zR"] = {
							"<cmd>require('ufo').openAllFolds()<cr>"
						},
					["zM"] = {
							"<cmd>require('ufo').closeAllFolds()<cr>"
						}
					}
				}}
			end,
		},

	},
}
