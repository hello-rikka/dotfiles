return {
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            { "nvim-treesitter/nvim-treesitter" },
            'LukasPietzschmann/telescope-tabs',
            config = function()
                require('telescope').load_extension 'telescope-tabs'
                require('telescope-tabs').setup {
                    -- Your custom config :^)
                }
            end,
        },
        cmd = "Telescope",
    },
}
