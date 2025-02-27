local lvim_lsp = require('lvim.lsp')
local ts = require('typescript')

-- configure tsserver server manually.
vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "tsserver", "angularls" })

local common_on_attach = lvim_lsp.common_on_attach
local common_capabilities = lvim_lsp.common_capabilities()

lvim.lsp.on_attach_callback = function()
  if lvim.colorscheme == 'gruvbox' then
    -- change coloring of errors so I can actually read them with gruvbox
    vim.cmd(':hi DiagnosticError guifg=#de5b64 guibg=#1C1C1C')
    vim.cmd(':hi DiagnosticWarn guifg=DarkOrange ctermfg=DarkYellow')
    vim.cmd(':hi DiagnosticInfo guifg=Cyan ctermfg=Cyan')
    vim.cmd(':hi DiagnosticHint guifg=White ctermfg=White')
  end
end

require('lvim.lsp.manager').setup('angularls')

-- Typescript config using typescript.nvim
ts.setup({
  server = {
    root_dir = require('lspconfig.util').root_pattern('.git'),
    capabilities = common_capabilities,
    on_attach = common_on_attach,
  },
})

-- -- Keeping this here for reference
-- require("lvim.lsp.manager").setup("tsserver", {
--   root_dir = require('lspconfig.util').root_pattern('.git'),
--   on_attach = common_on_attach,
--   filetypes = { "typescript", "typescriptreact", "typescript.tsx", "javascript" },
--   cmd = {
--     "typescript-language-server",
--     "--stdio",
--   },
-- })

local formatters = require "lvim.lsp.null-ls.formatters"

formatters.setup({
  {
    command = "prettierd",
    filetypes = {
      "html",
      "scss",
      "typescript",
      "javascript",
      "typescriptreact"
    }
  },
})


local linters = require "lvim.lsp.null-ls.linters"
linters.setup({
  {
    command = "eslint",
    filetypes = { "javascript", "typescript", "typescriptreact" }
  },
})

vim.diagnostic.config({
  float = {
    max_width = 120,
    focusable = true
  }
})

lvim.autocommands = {
  {
    "BufReadPost",
    {
      pattern = { "*.erb", "*.eruby" },
      command = "set syntax=html",
    }
  },
}
