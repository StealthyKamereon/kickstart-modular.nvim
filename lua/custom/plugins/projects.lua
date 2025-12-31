return {
  'DrKJeff16/project.nvim',
  cmd = { -- Lazy-load by commands
    'Project',
    'ProjectAdd',
    'ProjectConfig',
    'ProjectDelete',
    'ProjectHistory',
    'ProjectRecents',
    'ProjectRoot',
    'ProjectSession',
  },
  dependencies = {
    { 'nvim-lua/plenary.nvim' },
    -- optional picker
    { 'nvim-telescope/telescope.nvim' },
    { 'ibhagwan/fzf-lua' },
  },
  lazy = false,
  init = function()
    require('project').setup {
      enable_autochdir = false,
      silent_chdir = true,
      patterns = {
        '.git',
      },
    }
    require('telescope').load_extension 'projects'
  end,
}
