""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Sections
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins
" => General
" => Interface
"
" => Language Specific
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if ! filereadable(expand('~/.config/nvim/autoload/plug.vim'))
  echo "Downloading junegunn/vim-plug to manage plugins..."
  silent !mkdir -p ~/.config/nvim/autoload/
  silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ~/.config/nvim/autoload/plug.vim
  autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.config/nvim/plugged')
  " Themes
  " Plug 'morhetz/gruvbox'
  " Plug 'sainnhe/gruvbox-material'
  Plug 'arcticicestudio/nord-vim'
  Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
  Plug 'ryanoasis/vim-devicons'
  Plug 'Yggdroot/indentLine'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  " Plug 'itchyny/lightline.vim'
  Plug 'bling/vim-bufferline'

  " NeoVim Nevigation
  Plug 'scrooloose/nerdtree'
  Plug 'scrooloose/nerdcommenter'
  Plug 'ctrlpvim/ctrlp.vim'

  " Coding
  Plug 'neoclide/coc.nvim', {'branch': 'release'}

    " Javascript specific
    Plug 'yuezk/vim-js'
    Plug 'othree/javascript-libraries-syntax.vim'

    " Javascript React
    Plug 'MaxMEllon/vim-jsx-pretty'

    " Typescript
    Plug 'HerringtonDarkholme/yats.vim'

    " JSON
    Plug 'elzr/vim-json'

call plug#end()
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Disable Swap File and Backup File
set noswapfile
set nobackup
set nowritebackup

" Set NeoVim to remember 500 lines
set history=500

" Map Leader
let mapleader = ","

" Define a new command :W for sudo saves the file
command W w !sudo tee % > /dev/null

" Splitting
set splitbelow
set splitright

" autoread
set autoread

" Watcher
function! Autoread(timer)
  silent checktime %
endfunction!
let timer = timer_start(100, 'Autoread', {'repeat': -1})

" Hide Buffers instead of Closing Them
set hidden

" Use Spaces instead of Tabs
set expandtab

" Enable Smarttab
set smarttab

" Set the tab to 4 spaces
set shiftwidth=2
set tabstop=2

" Auto indent, Smart indent, and auto wrap line
set autoindent
set smartindent
set wrap
set cindent

set list listchars=eol:¬,tab:▸\ ,trail:.,

" Ignore casing when searching
set ignorecase
set incsearch

" Use Unix as the standard file type
set ffs=unix,dos,mac

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Splitting Key Mappings
nnoremap sh <C-W>h
nnoremap sj <C-W>j
nnoremap sk <C-W>k
nnoremap sl <C-W>l
nnoremap s= <C-W>=
nnoremap sH <C-W>H
nnoremap sJ <C-W>J
nnoremap sK <C-W>K
nnoremap sL <C-W>L
nnoremap so <C-W>L
nnoremap s> <C-W>>
nnoremap s< <C-W><
nnoremap s+ <C-W>+
nnoremap s- <C-W>-

" Redo Key Mapping
nnoremap U <C-r>

" Fast Saving Key Mapping
nnoremap <leader>w :w!<cr>

" Pressing ,sp for enable and disable spell checking
map <silent> <expr> <leader>sp &spell ? ':set nospell<CR>':':set spell spelllang=en_us<CR>'

" Pressing ,se for enable and disable highlight search
map <silent> <expr> <leader>se &hlsearch ? ':set nohlsearch<CR>':':set hlsearch<CR>'

" Tab Nevigation
nnoremap <silent> th :tabprevious<CR>
nnoremap <silent> tl :tabnext<CR>

" Trigger Completion
inoremap <silent><expr> <C-Space> coc#refresh()

" Auto make directory if it does not exist
function s:MkNonExDir(file, buf)
    if empty(getbufvar(a:buf, '&buftype')) && a:file!~#'\v^\w+\:\/'
        let dir=fnamemodify(a:file, ':h')
        if !isdirectory(dir)
            call mkdir(dir, 'p')
        endif
    endif
endfunction
augroup BWCCreateDir
    autocmd!
    autocmd BufWritePre * :call s:MkNonExDir(expand('<afile>'), +expand('<abuf>'))
augroup END
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Left 10 lines at the end
set so=10

" Enable wildmenu for command completion
set wildmenu
set wildmode=longest:full,full

" Enable Counter
set ruler

" Enable the number column
set number relativenumber

" Show unfinished command
set showcmd

" Set the command prompt to the bottom line
set cmdheight=1
"
" Folding
set foldmethod=syntax
"set foldcolumn=1
set foldlevelstart=99

" Enable syntax highlighting
syntax on
syntax enable

" Enable spell checking highlight
" let g:gruvbox_guisp_fallback='bg'

" Enable 256 colors palette in Gnome Terminal
if $COLORTERM == 'gnome-terminal'
    set t_Co=256
endif


" Enable Dark Mode
set background=dark

" Set Gruvbox High Contrast Mode
" let g:gruvbox_contrast_dark = 'soft'

" let g:gruvbox_material_background = 'hard'

" Use Truecolorscheme
set termguicolors

let g:nord_cursor_line_number_background=1


" Enable Color Scheme
" colorscheme gruvbox
colorscheme nord

" indentLine colors
let g:indentLine_color_gui = '#4c566a'
" let g:indentLine_bgcolor_gui = '#FF5F00'

" Disable Background for Transparency
"autocmd VimEnter * 
" highlight NonText ctermbg=NONE guibg=NONE
highlight Normal ctermbg=NONE guibg=NONE
highlight LineNr ctermbg=NONE guibg=NONE
highlight SignColumn ctermbg=NONE guibg=NONE

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin Specific
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree
  " NERDTree Key Mappings
  nmap sn :NERDTreeToggle<CR>

  " NERDCommenter Key Mapping
  vmap ## <plug>NERDCommenterToggle
  nmap ## <plug>NERDCommenterToggle

  " Exit NeoVim if the only window is NerdTree
  autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endifA

  " sync open file with NERDTree
    " Check if NERDTree is open or active
    function! IsNERDTreeOpen()
      return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
    endfunction

    " Call NERDTreeFind iff NERDTree is active, current window contains a modifiable
    " file, and we're not in vimdiff
    function! SyncTree()
      if &modifiable && IsNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
      ¦ NERDTreeFind
      ¦ wincmd p
      endif
    endfunction

    " Highlight currently open buffer in NERDTree
    autocmd BufEnter * call SyncTree()


" NERDCommenter
  " Add spaces after comment delimiters by default
  let g:NERDSpaceDelims = 1

  " Use compact syntax for prettified multi-line comments
  let g:NERDCompactSexyComs = 1

  " Align line-wise comment delimiters flush left instead of following code indentation
  let g:NERDDefaultAlign = 'left'

" Airline
  " Use Powerline Fonts
  let g:airline_powerline_fonts = 1

  " Theme
  let g:airline_theme = 'nord'

  " Extensions
    " Tabline
    let g:airline#extensions#tabline#enabled = 1
    let g:airline#extensions#tabline#formatter = 'default'
    let g:airline#extensions#tabline#buffer_nr_show = 1

" lightline
  " get rid of -- INSERT --
  " set noshowmode

  " set showtabline=2
  " set laststatus=2
  " set guioptions-=e

  " let g:lightline = {
  "   \ 'colorscheme': 'wombat',
  "   \ 'separator': {    
  "   \    'left': '', 'right': '',
  "   \   },
  "   \ 'subseparator': {
  "   \    'left': '', 'right': '',
  "   \   },
  "   \ }

" Ignore
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

" Disable JSON conceal (Qoutes would not be hidden)
let g:vim_json_syntax_conceal = 0

" CtrlP Auto cache
function! SetupCtrlP()
  if exists("g:loaded_ctrlp") && g:loaded_ctrlp
    augroup CtrlPExtension
      autocmd!
      autocmd FocusGained  * CtrlPClearCache
      autocmd BufWritePost * CtrlPClearCache
    augroup END
  endif
endfunction
if has("autocmd")
  autocmd VimEnter * :call SetupCtrlP()
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Language Specific
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Javascript
let javaScript_fold=1

let g:vim_jsx_pretty_colorful_config=1




" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <C-d> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <C-d> <Plug>(coc-range-select)
xmap <silent> <C-d> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-tsserver',
  \ 'coc-eslint', 
  \ 'coc-prettier', 
  \ 'coc-json', 
  \ ]
