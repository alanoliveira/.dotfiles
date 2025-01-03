return {
  s("fc", fmt([[
    ⸨
    {q}
    ┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄
    {a}
    ⟪{main_tag}{tags}⟫
    ⸩

    ]], {
    main_tag = f(function() return vim.fn.expand("%:p:h:t") end),
    tags = i(3),
    q = i(1),
    a = i(2),
  })
  ),
}
