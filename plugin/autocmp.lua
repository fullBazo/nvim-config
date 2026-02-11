require("nvim-autopairs").setup({
    check_ts = true,  -- support treesitter
    fast_wrap = {
        map = "<M-e>",  -- Alt+e pour wrapper du texte avec des parenthèses
    },
})
