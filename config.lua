-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny
-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny

vim.opt.shiftwidth = 4 -- the number of spaces inserted for each indentation
vim.opt.tabstop = 4 -- insert 2 spaces for a tab
vim.g.gitblame_enabled = 0 -- disable gitblame on startup

lvim.builtin.which_key.mappings["gL"] = {
    "<cmd>GitBlameToggle<cr>", "Toggle Blame"
}

lvim.builtin.which_key.mappings["gS"] = {
    "<cmd>GitBlameCopyCommitURL<cr>", "Copy Commit URL"
}

lvim.keys.normal_mode["<C-J>"] = "<cmd>lua vim.diagnostic.goto_next()<cr>"
lvim.keys.normal_mode["<C-K>"] = "<cmd>lua vim.diagnostic.goto_prev()<cr>"
lvim.keys.normal_mode["<M-Down>"] = "<cmd>m .+1<cr>=="
lvim.keys.normal_mode["<M-Up>"] = "<cmd>m .-2<cr>=="
lvim.keys.visual_mode["<M-Up>"] = ":m '<lt>-2<cr>gv=gv"
lvim.keys.visual_mode["<M-Down>"] = ":m '>+1<cr>gv=gv"

lvim.plugins = {
    {
        "f-person/git-blame.nvim",
        event = "BufRead",
        config = function()
            vim.cmd "highlight default link gitblame SpecialComment"
            vim.g.gitblame_enabled = 0
        end,
    },
    {
        "folke/trouble.nvim",
        cmd = "TroubleToggle",
    },
    -- {
    --     "karb94/neoscroll.nvim",
    --     event = "WinScrolled",
    --     config = function()
    --         require('neoscroll').setup({
    --             -- All these keys will be mapped to their corresponding default scrolling animation
    --             mappings = { },
    --             hide_cursor = true,          -- Hide cursor while scrolling
    --             stop_eof = true,             -- Stop at <EOF> when scrolling downwards
    --             use_local_scrolloff = false, -- Use the local scope of scrolloff instead of the global scope
    --             respect_scrolloff = false,   -- Stop scrolling when the cursor reaches the scrolloff margin of the file
    --             cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
    --             easing_function = nil,        -- Default easing function
    --             pre_hook = nil,              -- Function to run before the scrolling animation starts
    --             post_hook = nil,              -- Function to run after the scrolling animation ends
    --         })

    --         local scroll = {}
    --         scroll['<ScrollWheelUp>'] = {'scroll', {'-0.10', 'false', '30'}}
    --         scroll['<ScrollWheelDown>'] = {'scroll', { '0.10', 'false', '30'}}
    --         require('neoscroll.config').set_mappings(scroll)
    --     end
    -- },
    {
        "tpope/vim-surround",

        -- make sure to change the value of `timeoutlen` if it's not triggering correctly, see https://github.com/tpope/vim-surround/issues/117
        -- setup = function()
        --  vim.o.timeoutlen = 500
        -- end
    },
    {
        "iamcco/markdown-preview.nvim",
        build = "cd app && npm install",
        ft = "markdown",
        config = function()
            vim.g.mkdp_auto_start = 1
        end,
    },
    {
        "flxf/uCpp.vim",
    },
}

lvim.builtin.which_key.mappings["t"] = {
    name = "Diagnostics",
    t = { "<cmd>TroubleToggle<cr>", "trouble" },
    w = { "<cmd>TroubleToggle workspace_diagnostics<cr>", "workspace" },
    d = { "<cmd>TroubleToggle document_diagnostics<cr>", "document" },
    q = { "<cmd>TroubleToggle quickfix<cr>", "quickfix" },
    l = { "<cmd>TroubleToggle loclist<cr>", "loclist" },
    r = { "<cmd>TroubleToggle lsp_references<cr>", "references" },
}

-- lvim.builtin.treesitter.rainbow.enable = true

vim.g.clipboard = {
    name = 'WslClipboard',
    copy = {
        ['+'] = 'clip.exe',
        ['*'] = 'clip.exe',
    },
    paste = {
        ['+'] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
        ['*'] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
    },
    cache_enabled = 0,
}
