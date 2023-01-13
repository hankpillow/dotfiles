require('fidget').setup()

local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<leader><space>', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.diagnostic.config({ virtual_text = false })

vim.lsp.handlers["textDocument/publishDiagnostics"] =
vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
    underline = true,
    update_in_insert = false,
    -- virtual_text = { spacing = 4, prefix = "●" },
    severity_sort = true
})

local on_attach = function(client, bufnr)
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    local nmap = function(keys, func, desc)
        if desc then desc = 'LSP: ' .. desc end
        vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
    end

    local format_buffer = function()
        local withNull = {
            filter = function(client) return client.name == "null-ls" end
        }
        if vim.lsp.buf.format then
            vim.lsp.buf.format(withNull)
        elseif vim.lsp.buf.formatting then
            vim.lsp.buf.formatting(withNull)
        end
    end

    local telescope = require('telescope.builtin')

    -- nmap('<A-F>', format_buffer, '[G]oto [D]efinition')
    nmap('<C-.>', vim.lsp.buf.code_action, 'Code Action')
    nmap('<F12>', vim.lsp.buf.definition, '[G]oto [D]efinition')
    nmap('gi', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
    nmap('<C-h>', vim.lsp.buf.hover, '[H]over Documentation')
    nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')
    nmap('gr', telescope.lsp_references, '[G]oto [R]eferences')
    nmap('<leader>sy', telescope.lsp_document_symbols, '[D]ocument [S]ymbols')
    nmap("[d", vim.diagnostic.goto_prev, 'Next [d]iagnostic')
    nmap("]d", vim.diagnostic.goto_next, 'Prev [d]iagnostic')
end

-- nvim-cmp supports additional completion capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
local lsp_config = require("lspconfig")

lsp_config['tsserver'].setup {
    on_attach = on_attach,
    filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
    cmd = { "typescript-language-server", "--stdio" },
    capabilities = capabilities
}

lsp_config['sumneko_lua'].setup {
    capabilities = capabilities,
    on_attach = on_attach,
    settings = {
        Lua = {
            diagnostics = { globals = { 'vim' } },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = vim.api.nvim_get_runtime_file("", true),
                checkThirdParty = false
            }
        }
    }
}

lsp_config['angularls'].setup {
    on_attach = on_attach,
    capabilities = capabilities
}

lsp_config['bashls'].setup { on_attach = on_attach, capabilities = capabilities }

lsp_config['cssls'].setup { on_attach = on_attach, capabilities = capabilities }

lsp_config['dockerls'].setup {
    on_attach = on_attach,
    capabilities = capabilities
}

lsp_config['stylelint_lsp'].setup {
    on_attach = on_attach,
    capabilities = capabilities
}

lsp_config['eslint'].setup { on_attach = on_attach, capabilities = capabilities }

lsp_config['html'].setup { on_attach = on_attach, capabilities = capabilities }

lsp_config['marksman'].setup {
    on_attach = on_attach,
    capabilities = capabilities
}
