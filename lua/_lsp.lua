local lsp_installer = require("nvim-lsp-installer")

-- Register a handler that will be called for all installed servers.
-- Alternatively, you may also register handlers on specific server instances instead (see example below).
lsp_installer.on_server_ready(function(server)
    local opts = {}

    -- (optional) Customize the options passed to the server
    -- if server.name == "tsserver" then
    --     opts.root_dir = function() ... end
    -- end

    -- This setup() function is exactly the same as lspconfig's setup function.
    -- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
    server:setup(opts)
end)
local keymap = vim.api.nvim_set_keymap

local opts = { noremap=true, silent=true }
local function nkeymap(key, map)
    keymap('n', key, map, opts)
end


nkeymap('<leader>af',  ':lua vim.diagnostic.open_float()<CR>')
nkeymap('<leader>agd', ':lua vim.lsp.buf.definition()<cr>')
nkeymap('<leader>agD', ':lua vim.lsp.buf.declaration()<cr>')
nkeymap('<leader>agi', ':lua vim.lsp.buf.implementation()<cr>')
nkeymap('<leader>agw', ':lua vim.lsp.buf.document_symbol()<cr>')
nkeymap('<leader>as', ':Telescope lsp_dynamic_workspace_symbols<cr>')
nkeymap('<leader>ar', ':Telescope lsp_references<cr>')
nkeymap('<leader>agt', ':lua vim.lsp.buf.type_definition()<cr>')
nkeymap('<leader>ah', ':lua vim.lsp.buf.hover()<cr>')
nkeymap('<leader>ash', ':lua vim.lsp.buf.signature_help()<cr>')
nkeymap('<leader>ac', ':lua vim.lsp.buf.code_action()<cr>')
nkeymap('<leader>arn', ':lua vim.lsp.buf.rename()<cr>')
keymap('i', '<C-s>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
