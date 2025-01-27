local ok_lsp, lsp = pcall(require, "lspconfig")
local ok_cmp, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
local ok_installer, lsp_installer = pcall(require, "nvim-lsp-installer")
local ok_lspconfig, lsp_config = pcall(require, "lspconfig")
local ok_rusttools, rust_tools = pcall(require, "rust-tools")

local servers = {
    "html", "cssls", "cssmodules_ls", "emmet_ls", "eslint", "jsonls",
    "phpactor", "sqlls", "tsserver", "yamlls", "marksman", "denols"
}

if ok_installer then lsp_installer.setup({ ensure_installed = servers }) end

if ok_cmp and ok_lsp and ok_lspconfig then
    local capabilities = cmp_nvim_lsp.default_capabilities(vim.lsp.protocol
    .make_client_capabilities())

    local on_attach = function()
        vim.keymap.set("n", "K", vim.lsp.buf.hover)
        vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition)
        vim.keymap.set("n", "<leader>gt", vim.lsp.buf.type_definition)
        vim.keymap.set("n", "<leader>gi", vim.lsp.buf.implementation)
        vim.keymap.set("n", "<leader>ge", vim.diagnostic.open_float)
        vim.keymap.set("n", "<leader>dj", vim.diagnostic.goto_next)
        vim.keymap.set("n", "<leader>dk", vim.diagnostic.goto_prev)
        vim.keymap.set("n", "<leader>dl", ":Telescope diagnostics<CR>")
        vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename)
        vim.keymap.set("n", "<leader>F",
        ":lua vim.lsp.buf.format({ async = true })<CR>")
    end

    for _, server in pairs(servers) do
        -- USE RUST TOOLS FOR RUST
        if server == "rust_analyzer" then
            if ok_rusttools then
                rust_tools.setup({ tools = { on_initialized = on_attach } })
            else
                lsp["rust_analyzer"].setup({
                    capabilities = capabilities,
                    on_attach = on_attach
                })
            end
        else
            lsp[server].setup({
                capabilities = capabilities,
                on_attach = function(client)
                    on_attach()
                    if server == "ts_ls" then
                        client.server_capabilities.documentFormattingProvider =
                        false
                        client.server_capabilities
                        .documentRangeFormattingProvider = false
                    end
                end
            })
        end
    end
    lsp.denols.setup {
        on_attach = on_attach,
        root_dir = lsp.util.root_pattern("deno.json", "deno.jsonc"),
    }
    lsp.tsserver.setup {
        on_attach = on_attach,
        root_dir = lsp.util.root_pattern("package.json"),
        single_file_support = false
    }
end

