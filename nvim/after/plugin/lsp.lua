local lsp = require('lsp-zero')

local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }

cmp.setup({
    mapping = cmp.mapping.preset.insert({
        ['<C-,>'] = cmp.mapping.select_prev_item(cmp_select),
        ['<C-.>'] = cmp.mapping.select_next_item(cmp_select),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
        ['<C-Space>'] = cmp.mapping.complete()
    }),
    preselect = 'item',
    completion = {
        completeopt = 'menu,menuone,noinsert'
    }
})

require('mason').setup({})
require('mason-lspconfig').setup({
    -- Replace the language servers listed here
    -- with the ones you want to install
    ensure_installed = {'lua_ls', 'clangd', 'pyright'},
    handlers = {
        function(server_name)
            require('lspconfig')[server_name].setup({})
        end,
    }
})

lsp.setup()

