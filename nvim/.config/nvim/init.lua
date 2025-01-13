vim.cmd('runtime myinit.vim')
require("config.lazy")
require('config/cmp')
 --require('config/refactoring')

 vim.cmd('runtime vimrc.d/lsp-config.vim')
