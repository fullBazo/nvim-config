require("notify").setup({
    background_colour = "#000000",
})

require("noice").setup({
    cmdline = {
        enabled = true,
        view = "cmdline_popup",  -- au centre de l'écran
        format = {
            cmdline = { icon = ">" },
            search_down = { icon = "/" },
            search_up = { icon = "?" },
        },
    },
    messages = {
        enabled = true,
    },
    popupmenu = {
        enabled = true,
    },
})

