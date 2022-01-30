require("telescope").setup {
    defaults = {
        file_ignore_patterns = {
            "node_modules/",
            ".git/",
            ".venv",
            "plugged/",
            "undodir/",
           "lib/"
        }
    },
    pickers = {
        find_files = {
            hidden = true,
            no_ignore = true
        }
    }
}
