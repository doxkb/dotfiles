set wrap
filetype off

let mapleader = ","

au BufRead,BufNewFile *.txt set syntax=cs
au BufRead,BufNewFile *.cshtml set syntax=html

set foldmethod=syntax
set incsearch
set background=dark
set tabstop=4
set shiftwidth=4
set smartcase
set number
set wildmenu
set shortmess=aAIst
set nowritebackup
set ruler
set showcmd
"set cursorline
set foldcolumn=1
set undofile
set undodir=~/vimundo/
set nobackup
set backspace=indent,eol,start
set cmdheight=2
set hidden
set relativenumber
set splitbelow
set splitright

"session settings
set ssop-=options    " do not store global and local values in a session
"set ssop-=folds      " do not store folds

"Showmatch significantly slows down omnicomplete
"when the first match contains parentheses.
set noshowmatch

set noerrorbells visualbell t_vb=
autocmd GUIEnter * set vb t_vb=

"don't autoselect first item in omnicomplete, show if only one item (for
"preview)
"remove preview if you don't want to see any documentation whatsoever. (it
"slows things down a lot)
set completeopt=longest,menuone
set completeopt-=preview


set updatetime=500
execute pathogen#infect()

set background=dark
colorscheme solarized

syntax on
filetype plugin indent on

if !exists(":DiffOrig")
	  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
	  	\ | wincmd p | diffthis
  endif

"Remove trailing white space
autocmd BufWritePre * :%s/\s\+$//e

" http://vim.wikia.com/wiki/Keep_folds_closed_while_inserting_text
autocmd InsertEnter * if !exists('w:last_fdm') | let w:last_fdm=&foldmethod | setlocal foldmethod=manual | endif
autocmd InsertLeave,WinLeave * if exists('w:last_fdm') | let &l:foldmethod=w:last_fdm | unlet w:last_fdm | endif

"Ajust the quickfix list to min 2 lines max 10 lines.
"http://vim.wikia.com/wiki/Automatically_fitting_a_quickfix_window_height
au FileType qf call AdjustWindowHeight(2, 10)
function! AdjustWindowHeight(minheight, maxheight)
 exe max([min([line("$"), a:maxheight]), a:minheight]) . "wincmd _"
endfunction

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
" Also don't do it when the mark is in the first line, that is the default
" position when opening a file.
autocmd BufReadPost *
 	\ if line("'\"") > 1 && line("'\"") <= line("$") |
 	\   exe "normal! g`\"" |
	\ endif


" ctrlp settings
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

"=============== AirLine Settings ===============
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
set laststatus=2
set noshowmode
let g:airline_theme='solarized'
"=============== AirLine Settings ===============

nmap <C-n> :bp<cr>
nmap <C-m> :bn<cr>

vnoremap <C-C> "+y
vnoremap <BS> d

"Center cursor in screen after movement
nmap n nzz
nmap N Nzz
nmap { {zz
nmap } }zz

"CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

"=============== NerdCommenter Mappings ===============
noremap <C-E><C-C> :call NERDComment(0,"comment")<C-m>
noremap <C-E><C-U> :call NERDComment(0,"uncomment")<C-m>
""=============== NerdCommenter Mappings ===============

""=============== TagBar / NERDTree Mappings ===============
nmap <C-t> :NERDTreeToggle<CR>
nmap <F8> :TagbarToggle<CR>
"=============== TagBar / NERDTree Mappings ===============

"=============== QFEnter Mappings ===============
"For similar behaviour to ctrlp
"let g:qfenter_vopen_map = ['<C-v>']
"let g:qfenter_hopen_map = ['<C-CR>', '<C-s>', '<C-x>']
"let g:qfenter_topen_map = ['<C-t>']
"=============== QFEnter Mappings ===============

"=============== Easymotion Mappings ===============
nmap <C-h> <plug>(easymotion-linebackward)
nmap <C-j> <plug>(easymotion-j)
nmap <C-k> <Plug>(easymotion-k)
nmap <C-l> <plug>(easymotion-lineforward)
map s <Plug>(easymotion-s2)
map t <Plug>(easymotion-t)
map f <Plug>(easymotion-f)
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
map  n <Plug>(easymotion-next)zz
map  N <Plug>(easymotion-prev)zz
"=============== Easymotion Mappings ===============

"=============== NeoComplete Mappings ===============
inoremap <silent> <cr> <c-r>=<sid>my_cr_function()<cr>
function! s:my_cr_function()
  return neocomplete#close_popup() . "\<cr>"
    " for no inserting <cr> key.
    "return pumvisible() ? neocomplete#close_popup() : "\<cr>"
endfunction
inoremap <expr><tab>  pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <expr><bs> neocomplete#smart_close_popup()."\<c-h>"
"=============== NeoComplete Mappings ===============


"=============== Easymotion Settings ===============
let g:EasyMotion_do_mapping = 0 " Disable default mappings
let g:EasyMotion_smartcase = 1
"=============== Easymotion Settings ===============

"=============== NeoComplete Settings ===============
let g:acp_enableatstartup = 0  " disable autocomplpop.
let g:neocomplete#enable_at_startup = 1 " use neocomplete.
let g:neocomplete#enable_smart_case = 1 " use smartcase.
let g:neocomplete#sources#syntax#min_keyword_length = 3 " set minimum syntax keyword length.
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
	\ 'default' : '',
	\ 'vimshell' : $home.'/.vimshell_hist',
	\ 'scheme' : $home.'/.gosh_completions'
		\ }

" define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" enable omni completion.
autocmd filetype css setlocal omnifunc=csscomplete#completecss
autocmd filetype html,markdown setlocal omnifunc=htmlcomplete#completetags
autocmd filetype javascript setlocal omnifunc=javascriptcomplete#completejs
autocmd filetype python setlocal omnifunc=pythoncomplete#complete
autocmd filetype xml setlocal omnifunc=xmlcomplete#completetags
autocmd filetype cs setlocal omnifunc=omnisharp#complete

" enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
 let g:neocomplete#sources#omni#input_patterns = {}
endif

" for perlomni.vim setting.
let g:neocomplete#sources#omni#input_patterns.cs = '.*[^=\);]'
"=============== NeoComplete Settings ===============


