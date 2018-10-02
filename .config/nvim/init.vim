"    _      _ __        _
"   (_)__  (_) /_ _  __(_)_ _
"  / / _ \/ / __/| |/ / /  ' \
" /_/_//_/_/\__(_)___/_/_/_/_/

source ~/.config/nvim/plugins.vim

" ================ General Config ====================

set number                          "Line numbers are good
set cursorline                      "Highlight the line the cursor is on
set colorcolumn=99                  "Highlight the character limit
set backspace=indent,eol,start      "Allow backspace in insert mode
set history=1000                    "Store lots of :cmdline history
set showcmd                         "Show incomplete cmds down the bottom
set gcr=a:blinkon0                  "Disable cursor blink
set visualbell                      "No sounds
set autoread                        "Reload files changed outside vim
set laststatus=2                    "Enabling statusline at all times
if &encoding != 'utf-8'
    set encoding=utf-8              "Necessary to show Unicode glyphs
endif
set spelllang=fr,en
set noshowmode                      "Don't show the mode(airline is handling this)
set mouse=a                         "Mouse in terminal
set clipboard+=unnamedplus          "use system clipboard by default
set inccommand=nosplit              "use incremental replace
set diffopt+=vertical               "prefer vertical diffs

"LaTeX configuration
let g:polyglot_disabled = ['latex']
set grepprg=grep\ -nH\ $*
let g:tex_flavor = "latex"
autocmd FileType tex setlocal wrap spell textwidth=99

if &t_Co > 2 || has("gui_running")
    "switch syntax highlighting on, when the terminal has colors
    syntax on
endif

" quick-scope
augroup qs_colors
  autocmd!
  autocmd ColorScheme * highlight QuickScopePrimary guifg='#afff5f' gui=underline ctermfg=155 cterm=underline
  autocmd ColorScheme * highlight QuickScopeSecondary guifg='#5fffff' gui=underline ctermfg=81 cterm=underline
augroup END
" Trigger a highlight in the appropriate direction when pressing these keys:
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

"Setting the colorscheme
if &t_Co >= 256 || has("gui_running")
    set termguicolors
    set background=dark
    colorscheme gruvbox
endif

" Lightline
let g:lightline = {
      \ 'colorscheme': 'gruvbox',
      \ }

" LanguageClient
let g:LanguageClient_serverCommands = {
    \ 'rust': ['rls'],
    \ 'javascript': ['javascript-typescript-stdio'],
    \ 'javascript.jsx': ['javascript-typescript-stdio'],
    \ 'python': ['pyls2'],
    \ }

" FZF
let g:fzf_colors =
            \ { 'fg':      ['fg', 'Normal'],
            \ 'bg':      ['bg', 'Normal'],
            \ 'hl':      ['fg', 'Comment'],
            \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
            \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
            \ 'hl+':     ['fg', 'Statement'],
            \ 'info':    ['fg', 'PreProc'],
            \ 'prompt':  ['fg', 'Conditional'],
            \ 'pointer': ['fg', 'Exception'],
            \ 'marker':  ['fg', 'Keyword'],
            \ 'spinner': ['fg', 'Label'],
            \ 'header':  ['fg', 'Comment'] }

" add Rg command for ripgrep
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

function! s:fzf_statusline()
  " Override statusline as you like
  highlight fzf1 ctermfg=161 ctermbg=251
  highlight fzf2 ctermfg=23 ctermbg=251
  highlight fzf3 ctermfg=237 ctermbg=251
  setlocal statusline=%#fzf1#\ >\ %#fzf2#fz%#fzf3#f
endfunction

autocmd! User FzfStatusLine call <SID>fzf_statusline()

" NeoTerm
let g:neoterm_automap_keys = '<Leader>t'
let g:neoterm_default_mod = 'vertical'

" ultisnips options
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" rainbow parens
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" This makes vim act like all other editors, buffers can
" exist in the background without being in a window.
set hidden

" ================ Keybindings ======================

source ~/.config/nvim/keybindings.vim

" ================ Search Settings  =================

set incsearch        "Find the next match as we type the search
set viminfo='100,f1  "Save up to 100 marks, enable capital marks

" ================ Turn Off Swap Files ==============
set noswapfile
set nobackup
set nowb

" ================ Persistent Undo ==================
" Keep undo history across sessions, by storing in file.
" Only works all the time.

silent !mkdir ~/.vim/backups > /dev/null 2>&1
set undodir=~/.vim/backups
set undofile

" ================ Indentation ======================

set autoindent
set smartindent
set smarttab

set shiftwidth=4
set tabstop=4
set noexpandtab

filetype plugin on
filetype indent on

" Display tabs and trailing spaces visually
set list listchars=trail:·,tab:┊\ ,extends:>,precedes:<,nbsp:·

set nowrap       "Don't wrap lines
set linebreak    "Wrap lines at convenient points

" ================ Folds ============================

set foldmethod=indent   "fold based on indent
set foldnestmax=3       "deepest fold is 3 levels
set nofoldenable        "dont fold by default

" ================ Completion =======================

source ~/.config/nvim/completion.vim

" ================ Scrolling ========================

set scrolloff=8         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1
