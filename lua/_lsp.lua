local lsp_installer = require "nvim-lsp-installer"

local function setLspKeymaps()
    local keymap = vim.api.nvim_set_keymap

    local map_opts = {noremap = true, silent = true}

    keymap("n", "<leader>lf", ":lua vim.diagnostic.open_float()<CR>", map_opts)
    keymap("n", "<leader>lgd", ":lua vim.lsp.buf.definition()<cr>", map_opts)
    keymap("n", "<leader>lgD", ":lua vim.lsp.buf.declaration()<cr>", map_opts)
    keymap("n", "<leader>lgi", ":lua vim.lsp.buf.implementation()<cr>", map_opts)
    keymap("n", "<leader>lgw", ":lua vim.lsp.buf.document_symbol()<cr>", map_opts)
    keymap("n", "<leader>ls", ":Telescope lsp_dynamic_workspace_symbols<cr>", map_opts)
    keymap("n", "<leader>lr", ":Telescope lsp_references<cr>", map_opts)
    keymap("n", "<leader>lgt", ":lua vim.lsp.buf.type_definition()<cr>", map_opts)
    keymap("n", "<leader>lh", ":lua vim.lsp.buf.hover()<cr>", map_opts)
    keymap("n", "<leader>lsh", ":lua vim.lsp.buf.signature_help()<cr>", map_opts)
    keymap("n", "<leader>lca", ":lua vim.lsp.buf.code_action()<CR>", map_opts)
    keymap("n", "<leader>lrn", ":lua vim.lsp.buf.rename()<cr>", map_opts)
    keymap("i", "<C-s>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", map_opts)
end

-- Register a handler that will be called for all installed servers.
-- Alternatively, you may also register handlers on specific server instances instead (see example below).
lsp_installer.on_server_ready(
    function(server)
        local opts = {}

        -- (optional) Customize the options passed to the server
        -- if server.name == "tsserver" then
        --     opts.root_dir = function() ... end
        -- end

        -- This setup() function is exactly the same as lspconfig's setup function.
        -- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
        server:setup(opts)

        setLspKeymaps()
    end
)

require "lsp_signature".setup(
    {
        floating_window = false,
        handler_opts = {
            border = "none" -- double, rounded, single, shadow, none
        }
    }
)
