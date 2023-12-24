local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp_zero.default_keymaps({buffer = bufnr})
  -- vim.keymap.set("n", "<C-b>", function() vim.lsp.buf.definition() end, {buffer=bufnr, remap=false})
end)


require('mason').setup({})
require('mason-lspconfig').setup({
  -- Replace the language servers listed here 
  -- with the ones you want to install
  ensure_installed = {"pylsp"},
  handlers = {
    lsp_zero.default_setup,
    require('lspconfig').pylsp.setup({
	    settings = {
		    pylsp = {
			plugins = {
				pycodestyle = {
					enabled=false
				}
			}
		    }
	    }
    })
  },
})



