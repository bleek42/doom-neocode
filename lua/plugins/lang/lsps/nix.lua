local M = {}
function M.setup(capabilities, on_attach)
    require("lspconfig").nil_ls.setup({
        capabilities = capabilities,
        on_attach = on_attach,
    })
end

return M
