return {
    {
        "nvim-tree/nvim-tree.lua",
        cmd = { "NvimTreeToggle", "NvimTreeFocus" },
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = function()
            return require "config.filemanager"
        end,
    },
}
