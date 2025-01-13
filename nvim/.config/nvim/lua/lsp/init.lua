local util = require'lspconfig'.util;
require'lspconfig'.sourcekit.setup{
  root_dir = function(fname)
    return util.root_pattern('SignSticker.xcworkspace', 'Package.swift', '.git')(fname)
  end;
}
require'lspconfig'.gopls.setup{}
require'lspconfig'.pyright.setup{}
require'lspconfig'.bashls.setup{}
require'lspconfig'.eslint.setup{}
require'lspconfig'.ts_ls.setup{}
require'lspconfig'.jsonls.setup {
    commands = {
      Format = {
        function()
          vim.lsp.buf.range_formatting({},{0,0},{vim.fn.line("$"),0})
        end
      }
    }
}

