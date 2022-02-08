require("telescope").setup {
    defaults = {
        file_ignore_patterns = {
            "node_modules/",
            ".git/",
            ".venv",
            "plugged/",
            "undodir/",
            "lib/",
            "target"
            "__pycache__/",
            ".pytest_cache/"
        }
    },
    pickers = {
        find_files = {
            hidden = true,
            no_ignore = true
        }
    }
}
