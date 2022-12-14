lua require('plugins')
lua require('setup')

""" settings
""" ----------------------------------------------------------------- 
let g:python3_host_prog = expand('/usr/bin/python3')

set relativenumber

""" folding
set foldcolumn=1
set foldmethod=syntax
set nofoldenable	

""" window splits
set splitbelow
set splitright

""" allow switching from changed buffers
set hidden

""" no autobackups at all
set nobackup
set noswapfile
set nowritebackup

""" use leader w to toggle this value
set nowrap

""" tab will add the size of 2 spaces
set tabstop=2
set shiftwidth=2

""" theme
""" ----------------------------------------------------------------- 

set background=dark
colorscheme tokyonight-night

set showbreak=↪\
set listchars=tab:▶\ ,extends:›,precedes:‹,nbsp:•,trail:•,eol:$

function! s:statusline_expr()
	let mod = "%{&modified ? '[+] ' : !&modifiable ? '[x] ' : ''}"
	let ro  = "%{&readonly ? '[RO] ' : ''}"
	let ft  = "%{len(&filetype) ? &filetype : ''}:%{len(&syntax) ? &syntax : ''} "
	let fug = "%{exists('g:loaded_fugitive') ? fugitive#statusline() : ''}"
	let pos = '%(%l,%c%) %P'
	let enc = '%{&fenc == "" ? &enc : &fenc}%{(exists("+bomb") && &bomb) ? ",bomb" : ""}'
	let path = "%{@%}"
	let grepper = '%{grepper#statusline()}'
	" let gitsign = '%{get(b:,'gitsigns_status','')}
	let sep = '%='
	return mod.path.' %<'.ro.fug.sep.' ('.grepper.') '.ft.' | '.pos.' | '.enc
endfunction

let &statusline = winwidth(0)>80 ? s:statusline_expr() : '%t'

""" maps
""" ----------------------------------------------------------------- 

noremap <F5> :so ~/.config/nvim/init.vim<CR>

noremap <leader>q :q<CR>
noremap <leader>Q :q!<CR>

noremap <leader>d :Bdelete<CR>
noremap <leader>D :bufdo :Bdelete<CR>

nnoremap <leader>w :w<CR>
vnoremap <leader>w :w<CR>

noremap <leader>cd :lcd %:p:h<cr>

""" to the end/start of the line
noremap E g_
noremap B ^

""" changes the current location to file's path directory
noremap <leader>cd :lcd %:p:h<CR>

""" toggle
noremap <leader>l :set list!<CR>
noremap <leader>h :set nohlsearch!<CR>
noremap <leader>; :set wrap!<CR>

""" fold 
noremap <A-}><space> za

""" buffer nav
noremap [b :bprev<CR>
noremap ]b :bnext<CR>

""" jump to previous/next editted place
noremap ]j g,
noremap [j g;

""" Format the file and stay in the same line
nnoremap <A-F> gg=G''

""" Alt Shift up/down duplicate
noremap <A-K> yyP
noremap <A-J> yyp
vnoremap <A-K> yP
vnoremap <A-J> yp

""" start replace prompt
nnoremap <leader>r :%s///gc<left><left><left><left>
vnoremap <leader>r :s///gc<left><left><left><left>

""" https://bluz71.github.io/2017/05/15/vim-tips-tricks.html
""" smart move inside multiline
nnoremap <expr> j v:count ? (v:count > 5 ? "m'" . v:count : '') . 'j' : 'gj'
nnoremap <expr> k v:count ? (v:count > 5 ? "m'" . v:count : '') . 'k' : 'gk'

""" "copy selection on visual mode and start searching
""" "on the page for more results
vnoremap // y/<C-R>"<CR>

""" Open project file prompt
noremap <C-p> :GFiles<CR>
noremap <C-P> :Files<CR>
noremap <C-b> :Buffers<CR>
noremap - :NvimTreeToggle<CR>
vnoremap - :NvimTreeToggle<CR>

""" Grepping 
noremap <leader>g :Grepper<CR>
let g:grepper = { 'next_tool': '<leader>n' }

""" * selects current word and stay there and send it to default copy area
nnoremap * *N

""" select word under cursor and make it ready to be replaced in that file
noremap <F2> yviw*N:%s///g<left><left>
