local actions = require "fzf-lua.actions"
require'fzf-lua'.setup {
  global_resume      = true,
  global_resume_query = true,
  winopts = {
    height           = 0.85,
    width            = 0.80,
    row              = 0.35,
    col              = 0.50,
    border           = { '╭', '─', '╮', '│', '╯', '─', '╰', '│' },
    fullscreen       = false,
    hl = {
      normal         = 'Normal',
      border         = 'Normal',
      cursor         = 'Cursor',
      cursorline     = 'CursorLine',
      search         = 'Search',
    },
    preview = {
      border         = 'border',
      wrap           = 'nowrap',
      hidden         = 'nohidden',
      vertical       = 'down:45%',
      horizontal     = 'right:60%',
      layout         = 'flex',
      flip_columns   = 120,
      title          = true,
      scrollbar      = 'float',
      scrolloff      = '-2',
      scrollchars    = {'', '' },
      delay          = 100,
      winopts = {
        number            = true,
        relativenumber    = false,
        cursorline        = true,
        cursorlineopt     = 'both',
        cursorcolumn      = false,
        signcolumn        = 'no',
        list              = false,
        foldenable        = false,
        foldmethod        = 'manual',
    },
  },
  on_create = function()
  end,
},
keymap = {
  builtin = {
  },
  fzf = {
    ["ctrl-z"]      = "abort",
    ["ctrl-u"]      = "unix-line-discard",
    ["ctrl-f"]      = "half-page-down",
    ["ctrl-b"]      = "half-page-up",
    ["ctrl-a"]      = "beginning-of-line",
    ["ctrl-e"]      = "end-of-line",
    ["alt-a"]       = "toggle-all",
    ["f3"]          = "toggle-preview-wrap",
    ["f4"]          = "toggle-preview",
    ["shift-down"]  = "preview-page-down",
    ["shift-up"]    = "preview-page-up",
  },
},
actions = {
  files = {
    ["default"]     = actions.file_edit_or_qf,
    ["ctrl-s"]      = actions.file_split,
    ["ctrl-v"]      = actions.file_vsplit,
    ["ctrl-t"]      = actions.file_tabedit,
    ["alt-q"]       = actions.file_sel_to_qf,
  },
  buffers = {
    ["default"]     = actions.buf_edit,
    ["ctrl-s"]      = actions.buf_split,
    ["ctrl-v"]      = actions.buf_vsplit,
    ["ctrl-t"]      = actions.buf_tabedit,
  }
},
fzf_opts = {
  ['--ansi']        = '',
  ['--prompt']      = '> ',
  ['--info']        = 'inline',
  ['--height']      = '100%',
  ['--layout']      = 'reverse',
  ['--border']      = 'none',
},
previewers = {
  cat = {
    cmd             = "cat",
    args            = "--number",
  },
  bat = {
    cmd             = "bat",
    args            = "--style=numbers,changes --color always",
    theme           = 'Coldark-Dark',
    config          = nil,
  },
  head = {
    cmd             = "head",
    args            = nil,
  },
  git_diff = {
    cmd_deleted     = "git diff --color HEAD --",
    cmd_modified    = "git diff --color HEAD",
    cmd_untracked   = "git diff --color --no-index /dev/null",
  },
  man = {
    cmd             = "man -c %s | col -bx",
  },
  builtin = {
    syntax          = true,
    syntax_limit_l  = 0,
    syntax_limit_b  = 1024*1024,
    limit_b         = 1024*1024*10,
    extensions      = {
      ["png"]       = { "viu", "-b" },
      ["jpg"]       = { "ueberzug" },
    },
    ueberzug_scaler = "cover",
  },
},
files = {
  prompt            = 'Files: ',
  multiprocess      = true,
  git_icons         = true,
  file_icons        = true,
  color_icons       = true,
  find_opts         = [[-type f -not -path '*/\.git/*' -printf '%P\n']],
  rg_opts           = "--color=never --files --hidden --follow -g '!.git'",
  fd_opts           = "--color=never --type f --hidden --follow --exclude .git",
  actions = {
    ["default"]     = actions.file_edit,
    ["ctrl-y"]      = function(selected) print(selected[1]) end,
  }
},
git = {
  files = {
    prompt          = 'GitFiles: ',
    cmd             = 'git ls-files --exclude-standard',
    multiprocess    = true,
    git_icons       = true,
    file_icons      = true,
    color_icons     = true,
  },
  status = {
    prompt          = 'GitStatus: ',
    cmd             = "git status -s",
    previewer       = "git_diff",
    file_icons      = true,
    git_icons       = true,
    color_icons     = true,
    actions = {
      ["right"]   = { actions.git_unstage, actions.resume },
      ["left"]    = { actions.git_stage, actions.resume },
    },
  },
  commits = {
    prompt          = 'Commits: ',
    cmd             = "git log --pretty=oneline --abbrev-commit --color",
    preview         = "git show --pretty='%Cred%H%n%Cblue%an%n%Cgreen%s' --color {1}",
    actions = {
      ["default"] = actions.git_checkout,
    },
  },
  bcommits = {
    prompt          = 'BCommits: ',
    cmd             = "git log --pretty=oneline --abbrev-commit --color",
    preview         = "git show --pretty='%Cred%H%n%Cblue%an%n%Cgreen%s' --color {1}",
    actions = {
      ["default"] = actions.git_buf_edit,
      ["ctrl-s"]  = actions.git_buf_split,
      ["ctrl-v"]  = actions.git_buf_vsplit,
      ["ctrl-t"]  = actions.git_buf_tabedit,
    },
  },
  branches = {
    prompt          = 'Branches: ',
    cmd             = "git branch --all --color",
    preview         = "git log --graph --pretty=oneline --abbrev-commit --color {1}",
    actions = {
      ["default"] = actions.git_switch,
    },
  },
  stash = {
    prompt          = 'Stash: ',
    cmd             = "git --no-pager stash list",
    preview         = "git --no-pager stash show --patch --color {1}",
    actions = {
      ["default"]   = actions.git_stash_apply,
      ["ctrl-x"]    = { actions.git_stash_drop, actions.resume },
    },
    fzf_opts = {
      ["--no-multi"]  = '',
      ['--delimiter'] = "'[:]'",
    },
  },
  icons = {
    ["M"]           = { icon = "M", color = "yellow" },
    ["D"]           = { icon = "D", color = "red" },
    ["A"]           = { icon = "A", color = "green" },
    ["R"]           = { icon = "R", color = "yellow" },
    ["C"]           = { icon = "C", color = "yellow" },
    ["T"]           = { icon = "T", color = "magenta" },
    ["?"]           = { icon = "?", color = "magenta" },
  },
},
grep = {
  prompt            = 'Rg: ',
  input_prompt      = 'Grep For: ',
  multiprocess      = true,
  git_icons         = true,
  file_icons        = true,
  color_icons       = true,
  grep_opts         = "--binary-files=without-match --line-number --recursive --color=auto --perl-regexp",
  rg_opts           = "--column --line-number --no-heading --color=always --smart-case --max-columns=512",
  rg_glob           = false,
  glob_flag         = "--iglob",
  glob_separator    = "%s%-%-",
    actions = {
      ["ctrl-g"]      = { actions.grep_lgrep }
    },
    no_header             = false,
    no_header_i           = false,
  },
  args = {
    prompt            = 'Args: ',
    files_only        = true,
    actions           = { ["ctrl-x"] = { actions.arg_del, actions.resume } }
  },
  oldfiles = {
    prompt            = 'History: ',
    cwd_only          = false,
    stat_file         = true,
    include_current_session = false,
  },
  buffers = {
    prompt            = 'Buffers: ',
    file_icons        = true,
    color_icons       = true,
    sort_lastused     = true,
    actions = {
      ["ctrl-x"]      = { actions.buf_del, actions.resume },
    }
  },
  tabs = {
    prompt            = 'Tabs: ',
    tab_title         = "Tab",
    tab_marker        = "<<",
    file_icons        = true,
    color_icons       = true,
    actions = {
      ["default"]     = actions.buf_switch,
      ["ctrl-x"]      = { actions.buf_del, actions.resume },
    },
    fzf_opts = {
      ['--delimiter'] = "'[\\):]'",
      ["--with-nth"]  = '2..',
    },
  },
  lines = {
    previewer         = "builtin",
    prompt            = 'Lines: ',
    show_unlisted     = false,
    no_term_buffers   = true,
    fzf_opts = {
      ['--delimiter'] = "'[\\]:]'",
      ["--nth"]       = '2..',
      ["--tiebreak"]  = 'index',
    },
    actions = {
      ["default"]     = { actions.buf_edit_or_qf },
      ["alt-q"]       = { actions.buf_sel_to_qf }
    },
  },
  blines = {
    previewer         = "builtin",
    prompt            = 'BLines: ',
    show_unlisted     = true,
    no_term_buffers   = false,
    fzf_opts = {
      ['--delimiter'] = "'[\\]:]'",
      ["--with-nth"]  = '2..',
      ["--tiebreak"]  = 'index',
    },
    actions = {
      ["default"]     = { actions.buf_edit_or_qf },
      ["alt-q"]       = { actions.buf_sel_to_qf }
    },
  },
  tags = {
    prompt                = 'Tags: ',
    ctags_file            = "tags",
    multiprocess          = true,
    file_icons            = true,
    git_icons             = true,
    color_icons           = true,
    rg_opts               = "--no-heading --color=always --smart-case",
    grep_opts             = "--color=auto --perl-regexp",
    actions = {
      ["ctrl-g"]          = { actions.grep_lgrep }
    },
    no_header             = false,
    no_header_i           = false,
  },
  btags = {
    prompt                = 'BTags: ',
    ctags_file            = "tags",
    multiprocess          = true,
    file_icons            = true,
    git_icons             = true,
    color_icons           = true,
    rg_opts               = "--no-heading --color=always",
    grep_opts             = "--color=auto --perl-regexp",
    fzf_opts = {
      ['--delimiter']     = "'[\\]:]'",
      ["--with-nth"]      = '2..',
      ["--tiebreak"]      = 'index',
    },
  },
  colorschemes = {
    prompt            = 'Colorschemes: ',
    live_preview      = true,
    actions           = { ["default"] = actions.colorscheme, },
    winopts           = { height = 0.55, width = 0.30, },
    post_reset_cb     = function()
    end,
  },
  quickfix = {
    file_icons        = true,
    git_icons         = true,
  },
  lsp = {
    prompt_postfix    = '❯ ',
    cwd_only          = false,
    async_or_timeout  = 5000,
    file_icons        = true,
    git_icons         = false,
    lsp_icons         = true,
    ui_select         = true,
    symbol_style      = 1,
    symbol_hl_prefix  = "CmpItemKind",
    symbol_fmt        = function(s) return "["..s.."]" end,
    severity          = "hint",
    icons = {
      ["Error"]       = { icon = "", color = "red" },       -- error
      ["Warning"]     = { icon = "", color = "yellow" },    -- warning
      ["Information"] = { icon = "", color = "blue" },      -- info
      ["Hint"]        = { icon = "", color = "magenta" },   -- hint
    },
  },
  file_icon_padding = '',
  file_icon_colors = {
    ["lua"]   = "blue",
  },
}
