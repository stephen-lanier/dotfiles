return {
    'shaunsingh/nord.nvim',
    name = 'nord',
    lazy = false,
    priority = 1000,
    opts = function()  
        vim.g.nord_contrast = true
        vim.g.nord_borders = false
        vim.g.nord_disable_background = true
        vim.g.nord_italic = true
        vim.g.nord_uniform_diff_background = true
        vim.g.nord_bold = true
    end,
    config = function()
        vim.cmd.colorscheme 'nord'
    end
}
