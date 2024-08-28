
		-- {
		-- 	"L3MON4D3/LuaSnip",
		-- 	dependencies = {
		-- 		-- `friendly-snippets` contains a variety of premade snippets.
		-- 		--    See the README about individual language/framework/plugin snippets:
		-- 		--    https://github.com/rafamadriz/friendly-snippets
		-- 		{
		-- 			"rafamadriz/friendly-snippets",
		-- 			config = function()
		-- 				require("luasnip.loaders.from_vscode").lazy_load()
		-- 			end,
		-- 		},
		-- 	},
		-- },
		-- "saadparwaiz1/cmp_luasnip",

		-- {
		-- 	"folke/lazydev.nvim",
		-- 	ft = "lua", -- only load on lua files
		-- 	opts = {
		-- 		library = {
		-- 			-- See the configuration section for more details
		-- 			-- Load luvit types when the `vim.uv` word is found
		-- 			{ path = "luvit-meta/library", words = { "vim%.uv" } },
		-- 		},
		-- 	},
		-- },
		-- { "Bilal2453/luvit-meta", lazy = true }, -- optional `vim.uv` typings

local cmp = require("cmp")
local luasnip = require("luasnip")
luasnip.config.setup({})

cmp.setup({
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	completion = { completeopt = "menu,menuone,preview,noinsert,longest" },

	mapping = cmp.mapping.preset.insert({
		["<Up>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
		["<Down>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),

		-- Scroll the documentation window [b]ack / [f]orward
		["<C-b>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),

		--  This will auto-import if your LSP supports it.
		--  This will expand snippets if the LSP sent a snippet.
		["<C-n>"] = cmp.mapping.confirm({ select = true }),

		-- Manually trigger a completion from nvim-cmp.
		--  Generally you don't need this, because nvim-cmp will display
		--  completions whenever it has completion options available.
		["<C-Space>"] = cmp.mapping.complete({}),

		["<C-l>"] = cmp.mapping(function()
			if luasnip.expand_or_locally_jumpable() then
				luasnip.expand_or_jump()
			end
		end, { "i", "s" }),
		["<C-h>"] = cmp.mapping(function()
			if luasnip.locally_jumpable(-1) then
				luasnip.jump(-1)
			end
		end, { "i", "s" }),
	}),
	sources = {
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
		{ name = "path" },
		{ name = "lazydev" },
	},
	matching = {
		disallow_fuzzy_matching = false,
	},
})
