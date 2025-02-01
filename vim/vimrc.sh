
"Ps = 0  -> blinking block.
"Ps = 1  -> blinking block (default).
"Ps = 2  -> steady block.
"Ps = 3  -> blinking underline.
"Ps = 4  -> steady underline.
"Ps = 5  -> blinking bar (xterm).
"Ps = 6  -> steady bar (xterm).
" Set cursor to a steady bar in insert mode
" Set cursor to a steady block in insert mode

:set guicursor=a:ver25-Cursor

"E4filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required

Plugin 'VundleVim/Vundle.vim'

Plugin 'powerline/powerline'

Plugin 'ryanoasis/vim-devicons'

Plugin 'preservim/nerdtree'

Plugin 'scrooloose/syntastic'

Plugin 'msanders/snipmate.vim'

Plugin 'junegunn/fzf'

Plugin 'jiangmiao/auto-pairs'

Plugin 'garbas/vim-snipmate'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
" filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
nnoremap <C-n> :NERDTree<CR>

" Define the leader key as Space
let mapleader = "\<Space>"


"  taken from github

" for compiling 
nnoremap <F8> :!gcc -o  %:r.out % -std=c++14<Enter>
nnoremap <F9> :!./%:r.out
nnoremap <F5> :!python3 %<Enter>

" nerd tree

let NERDTreeIgnore=['.DS_Store']
let NERDTreeShowBookmarks=0         "show bookmarks on startup
let NERDTreeHighlightCursorline=1   "Highlight the selected entry in the tree
let NERDTreeShowLineNumbers=0
let NERDTreeMinimalUI=1
"snipmate
"autocmd FileType cpp set complete_in_comment cmn
"autoload snipMate ./snippets/snippets.vim

map <C-t> :NERDTreeToggle<CR> " T for tree
" Opening nerd tree when opening a folder
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
" Close vim if only nerdtree is open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"navigate back
nnoremap <silent> <C-b> :bp<CR>

"vertical split
nnoremap <C-b> : vsplit
nnoremap <C-h> : split


" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

"colorscheme dracula
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
set encoding=UTF-8
set fillchars+=stl:\ ,stlnc:\

" power line 
set encoding=utf8
set termencoding=utf8
set guifont=Droid\ Sans\ Mono\ for\ Powerline:h14
let g:Powerline_symbols='unicode'
set t_Co=256
set laststatus=2
set noshowmode
set fillchars+=stl:\ ,stlnc:\

" set cmds
set hidden
set ignorecase
set wildmenu
set smartcase
set laststatus=2
set hlsearch
set incsearch
set cindent

"mouse reporting
set mouse=a
" fuzy search
nnoremap <silent> <C-f> :FZF<CR>

" syntactic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

syntax enable
set autoindent expandtab tabstop=4 shiftwidth=4
set number
set relativenumber
"set autoindent
 
filetype indent on
syntax on
set autoindent

" Map F9 to compile and run C++ code
nnoremap <F2> :w<CR>:!g++ % -o %< && chmod +x %< && ./%<<CR>

"Map F3 to compile and run js code
nnoremap <F3> :w<CR>:!node %<CR>

" Map Ctrl-w :term to open a terminal window in a split without closing Vim
nnoremap <C-w>: :split<CR>:term ++close ++hidden<CR>:startinsert<CR>

"python compilation 
nnoremap <F8> :w<CR>:!python3 %<CR>

" Keymap for commenting/uncommenting selected code blocks
vnoremap <silent> <Leader>c :<C-/>call CommentVisual()<CR>
vnoremap <silent> <Leader>u :<C-\>call UncommentVisual()<CR>

" Function to comment selected code blocks
function! CommentVisual()
    let comment_char = '//'
    execute ":'<,'>s/^/" . comment_char . "/e"
endfunction

" Function to uncomment selected code blocks
function! UncommentVisual()
    let comment_char = '//'
    execute ":'<,'>s/^" . comment_char . "//e"
endfunction

" Function to toggle comments based on file type
function! ToggleComment()
    let l:filetype = &filetype
    if l:filetype == 'cpp' || l:filetype == 'c' || l:filetype == 'java'
        let l:comment = '// '
    elseif l:filetype == 'python'
        let l:comment = '# '
    elseif l:filetype == 'sh'
        let l:comment = '# '
    " Add more file types and their corresponding comment strings as needed
    else
        let l:comment = '" '
    endif

    " Toggle comments for selected lines
    execute ":'<,'>s#^\\s*\\zs#".l:comment."#"
endfunction

" Map the function to a key combination
vnoremap <silent> <Leader>c :<C-U>call ToggleComment()<CR>


" Vim-Plug Configuration
call plug#begin('~/.vim/plugged')
Plug 'junegunn/vim-plug'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'ycm-core/YouCompleteMe', { 'do': './install.py --clangd-completer --all' }


"Plug 'SirVer/ultisnips'

" Add other plugins here

"Plugin 'honza/vim-snippets'

call plug#end()

" Additional configurations
" autocmd VimEnter * silent! source $MYVIMRC | PlugInstall --sync | source $MYVIMRC

" Keymap to insert the C++ competitive programming template with F1
nnoremap <F1> :r /Users/ashwin.2k3/Documents/cpp_template.snippet<CR>

" Enable YCM with semantic completion
"let g:ycm_semantic_triggers = {
"      \ 'c,cpp,objc,objcpp,python': ['re!\w{2}'],
"      \ 'java': ['re!\w{2}'],
"      \ }
"
"" Key mapping to trigger autocomplete
"nnoremap <leader>j :YcmCompleter GoToDefinition<CR>
"
"
"
"" Enable coc.nvim for supported filetypes
"autocmd FileType typescript,json,yaml,html,css,lua,javascript,lua call coc#activate()
"
"" Key mappings for coc.nvim
"nmap <silent> gd <Plug>(coc-definition)
"nmap <silent> gy <Plug>(coc-type-definition)
"nmap <silent> gi <Plug>(coc-implementation)
"nmap <silent> gr <Plug>(coc-references)


"ADDING LSP FOR 
"
""
"" Install coc.nvim (Conquer of Completion)
"" You can use your preferred plugin manager such as vim-plug, Vundle, or Dein.vim
"" For vim-plug:
"Plug 'neoclide/coc.nvim', {'branch': 'release'}


""Initialize coc.nvim
"let g:coc_global_extensions = [
"      \ 'coc-tsserver',    " TypeScript and JavaScript
"      \ 'coc-html',        " HTML
"      \ 'coc-css',         " CSS
"      \ 'coc-json',        " JSON
"      \ 'coc-python',      " Python
"      \ 'coc-java',        " Java
"      \ 'coc-vimlsp',      " VimL
"      \ 'coc-yaml',        " YAML
"      \ 'coc-eslint',      " ESLint for JavaScript and TypeScript
"      \ 'coc-prettier',    " Prettier formatter
"      \ 'coc-clangd'       " C/C++
"      \ ]
"
"" Key mappings for coc.nvim
"nmap <silent> gd <Plug>(coc-definition)
"nmap <silent> gy <Plug>(coc-type-definition)
"nmap <silent> gi <Plug>(coc-implementation)
"nmap <silent> gr <Plug>(coc-references)
"nmap <leader>rn <Plug>(coc-rename)
"nmap <leader>ca <Plug>(coc-codeaction)
"
"" Enable auto completion and snippets
"set completeopt=menuone,noinsert,noselect
"
"" Use Tab for trigger completion with characters ahead and navigate.
"" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
"inoremap <silent><expr> <TAB>
"      \ pumvisible() ? "\<C-n>" :
"      \ <SID>check_back_space() ? "\<TAB>" :
"      \ coc#refresh()
"
"inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
"
"function! s:check_back_space() abort
"  let col = col('.') - 1
"  return !col || getline('.')[col - 1]  =~# '\s'
"endfunction
"
"" Use <c-space> to trigger completion.
"inoremap <silent><expr> <c-space> coc#refresh()
"
"" Show diagnostics and code actions on hover
"autocmd CursorHold * silent call CocActionAsync('showSignatureHelp')
"
"" Highlight the symbol and its references when holding the cursor.
"autocmd CursorHold * silent call CocActionAsync('highlight')
"
"" GoTo code navigation.
"autocmd FileType javascript nnoremap <buffer> <c-]> :call CocAction('doHover')<CR>
"autocmd FileType typescript nnoremap <buffer> <c-]> :call CocAction('jumpDefinition')<CR>
"
"" Format code on save
"autocmd BufWritePre * call CocAction('format')
"
"" Highlight coc active line
"autocmd CursorHold * silent call CocActionAsync('highlight')
"
"" Remap keys for gotos
"nmap <silent> gd <Plug>(coc-definition)
"nmap <silent> gy <Plug>(coc-type-definition)
"nmap <silent> gi <Plug>(coc-implementation)
"nmap <silent> gr <Plug>(coc-references)




"let g:UltiSnipsExpandTrigger="<tab>"
"let g:UltiSnipsJumpForwardTrigger="<tab>"
"let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
"let g:UltiSnipsSnippetDirectories=["cpp.snippets"]

"let g:UltiSnipsSnippetsDir="~/.vim/UltiSnips/cpp.snippets"
"let g:UltiSnipsDebug=1
filetype plugin on

