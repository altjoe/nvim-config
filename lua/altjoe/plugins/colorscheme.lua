return {
	-- add gruvbox
	{ "sainnhe/everforest" },
	{ "rebelot/kanagawa.nvim" },
	-- Configure LazyVim to load gruvbox
	{
		"LazyVim/LazyVim",
		opts = {
			colorscheme = "everforest",
		},
	},
}
