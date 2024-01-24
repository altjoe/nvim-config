return { {
    'neovim/nvim-lspconfig',
    dependencies = {
        { 'hrsh7th/cmp-nvim-lsp' },
    }
},
    { 'williamboman/mason.nvim' },
    { 'williamboman/mason-lspconfig.nvim' },
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        lazy = true,
        config = false,
    },

    -- Autocompletion
    {
        'hrsh7th/nvim-cmp',
        dependencies = {
            { 'L3MON4D3/LuaSnip' }
        },

    }, { 'hrsh7th/cmp-buffer' }
, { 'hrsh7th/cmp-path' }
, { 'saadparwaiz1/cmp_luasnip' }
, { 'hrsh7th/cmp-nvim-lua' }
, { 'l3mon4d3/luasnip' }
, { 'rafamadriz/friendly-snippets' }
}


--     --
