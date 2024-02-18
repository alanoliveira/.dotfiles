return {
  "codethread/qmk.nvim",
  cond = function()
    return vim.loop.cwd():find("qmk_keymap") ~= nil
  end,
  config = function()
    local group = vim.api.nvim_create_augroup('MyQMK', {})

    vim.api.nvim_create_autocmd('BufEnter', {
      group = group,
      pattern = '*keychron_q4/keymap.c',
      callback = function()
        require('qmk').setup({
          name = 'LAYOUT_ansi_61',
          layout = {
            'x x x x x x x x x x x x x x',
            'x x x x x x x x x x x x x x',
            'x x x x x x x x x x x x ^xx',
            '^xx x x x x x x x x x x ^xx',
            'x x x xxxxxx^xxxxxx x x x x'
          },
        })
      end,
    })

    vim.api.nvim_create_autocmd('BufEnter', {
      group = group,
      pattern = '*corne_cherry_v3/keymap.c',
      callback = function()
        require('qmk').setup({
          name = 'LAYOUT_split_3x6_3',
          layout = {
            'x x x x x x _ _ _ x x x x x x',
            'x x x x x x _ _ _ x x x x x x',
            'x x x x x x _ _ _ x x x x x x',
            '_ _ _ _ x x x _ x x x _ _ _ _',
          },
        })
      end,
    })
  end
}
