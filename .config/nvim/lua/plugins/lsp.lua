return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end
    },
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = {
            { 'neovim/nvim-lspconfig' },
        },
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = { "lua_ls", "rust_analyzer" },
            })
            require("mason-lspconfig").setup_handlers {
                function (server_name) -- default handler (optional)
                    require("lspconfig")[server_name].setup {}
                end,
            }
        end
    },
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "L3MON4D3/LuaSnip",
            "hrsh7th/cmp-nvim-lsp",
            "saadparwaiz1/cmp_luasnip",
            "rafamadriz/friendly-snippets",

        },
        config = function()
            local cmp = require("cmp")
            require("luasnip.loaders.from_vscode").lazy_load()

            cmp.setup({
                completion = {
                    completeopt = 'menu,menuone,noinsert'
                },
                snippet = {
                    expand = function(args)
                        require("luasnip").lsp_expand(args.body)
                    end,
                },
                mapping = cmp.mapping.preset.insert({
                    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-f>"] = cmp.mapping.scroll_docs(4),
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<C-e>"] = cmp.mapping.abort(),
                    ["<CR>"] = cmp.mapping.confirm({ select = true }),
                }),
                sources = cmp.config.sources({
                    { name = "nvim_lsp" },
                    { name = "luasnip" }, -- For luasnip users.
                }, {
                    { name = "buffer" },
                }),
            })
        end,
    },
}
