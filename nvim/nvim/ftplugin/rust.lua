
require("lspconfig").rust_analyzer.setup({
  capabilities = require('user.lsp').make_client_capabilities(),
})
