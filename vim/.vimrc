execute pathogen#infect()
:filetype plugin on
set nocompatible
set autoindent
set smartindent
set autoread "auto re-read changed file
set showcmd "show partial commands as you type them
set hidden "new buffers can be opened without old ones being saved
set backspace=indent
set shiftwidth=4
set tabstop=4
set binary

" automatic word wrapping
" ensure there is 't' in formatoptions:
":set fo?   " :set formatoptions?
":set fo+=t " :set formatoptions+=t
":set fo-=l " :set formatoptions-=l
":set tw=79 " :set textwidth=79
" to stop wrapping: :set tw=0
" to do a soft wrap: :set wrap linebreak nolist

autocmd FileType python set expandtab autoindent nosmartindent backspace=indent softtabstop=4
autocmd FileType javascript set shiftwidth=4
autocmd FileType javascript set tabstop=4

" disable automatic comment insertion
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" set list
set listchars=tab:»·,trail:·

" shift tabs using TAB or Shift+TAB
map <tab> >>
map <S-tab> <<
imap <S-tab> <C-d>

map <F1> :TagbarToggle<cr>
map <F2> :tabp<cr>
map <F3> :tabn<cr>
map <F4> :tabnew 

map <F5> :set nolist<cr>
map <F6> :set list<cr>
map <F7> :set noautoindent<cr>:set nosmartindent<cr>
map <F8> :set autoindent<cr>:set smartindent<cr>

map <silent> §1 :nohl<cr>:edit<cr>:match OverLength /\%80v.\+/<cr>
nnoremap gp `[v`]

" Perl
vmap () :s/^/#/gi<Enter>§1
vmap )( :s!^\(\s*\)#\=!\1!gi<Enter>§1

" C++ / JavaScript
vmap {} :s!^!\/\/!gi<Enter>§1
vmap }{ :s!^\(\s*\)\/\/\=!\1!gi<Enter>§1

" SQL
vmap <> :s!^\(\s*\)!\1-- !gi<Enter>§1
vmap >< :s!^\(\s*\)-- \=!\1!gi<Enter>§1

sy on

hi Search ctermbg=240
set hlsearch
hi MatchParen ctermbg=242 ctermfg=228
set t_Co=16
hi OverLength ctermbg=238
hi Visual ctermbg=242
match OverLength /\%80v.\+/

hi Comment    ctermfg=33
hi Statement  ctermfg=214
hi SpecialKey ctermfg=33
hi Search     ctermbg=darkblue ctermfg=yellow

set matchpairs+=<:>
set nobackup
set noswapfile
set ignorecase

" menu for reading files
set wildmenu
set wcm=<Tab>
menu Encoding.Read.CP1251   :e ++enc=cp1251<CR>
menu Encoding.Read.CP866    :e ++enc=cp866<CR>
menu Encoding.Read.KOI8-U   :e ++enc=koi8-u<CR>
menu Encoding.Read.UTF-8    :e ++enc=utf-8<CR>
map <F9> :emenu Encoding.Read.<TAB>

" menu for writing files (Ctrl-F9)
set wildmenu
set wcm=<Tab>
menu Encoding.Write.CP1251    :set fenc=cp1251<CR>
menu Encoding.Write.CP866     :set fenc=cp866<CR>
menu Encoding.Write.KOI8-U    :set fenc=koi8-u<CR>
menu Encoding.Write.UTF-8     :set fenc=utf-8<CR>
map <C-F9> :emenu Encoding.Write.<TAB>

:set enc=utf8

:let mapleader='§'
nnoremap <leader>o :!echo `git url`/blob/`git rev-parse --abbrev-ref HEAD`/%\#L<C-R>=line('.')<CR> \| xargs open<CR><CR>
