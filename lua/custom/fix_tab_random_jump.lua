-- This fixes a bug where leaving snipets without completing all the jumps with tab and pressing
-- tab later jumps you back into the snippet.
--
vim.api.nvim_create_autocmd('ModeChanged', {
  pattern = '*',
  callback = function()
    if
      ((vim.v.event.old_mode == 's' and vim.v.event.new_mode == 'n') or vim.v.event.old_mode == 'i')
      and require('luasnip').session.current_nodes[vim.api.nvim_get_current_buf()]
      and not require('luasnip').session.jump_active
    then
      require('luasnip').unlink_current()
    end
  end,
})
