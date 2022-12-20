lua require('plugins')
lua require('setup-explorer')
lua require('setup-lsp')
lua require('setup-telescope')
lua require('setup-treesitter')
lua require('setup')

""" settings
""" ----------------------------------------------------------------- 
let g:python3_host_prog = expand('/usr/bin/python3')
let g:netrw_browsex_viewer= "xdg-open"

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
colorscheme rose-pine

set showbreak=↪\
set listchars=tab:▶\ ,extends:›,precedes:‹,nbsp:•,trail:•,eol:$

function! s:statusline_expr()
	let modified = "%{&modified ? '💾' : !&modifiable ? '🔒' : ''}"
	let readonly  = "%{&readonly ? ' 🔎' : ''}"
	let filetype  = "%{len(&filetype) ? &filetype.' ' : ''}"
	let encoding = "%{&fenc == '' ? &enc : &fenc}"
	let path = "%{pathshorten(expand('%f'),3)}"
	let gitbranch = "%{get(b:,'gitsigns_head','')}"
	let pos = '[%l,%c]'
	let separator = '%='
	return modified.readonly.path.gitbranch.separator.' '.filetype.' '.encoding.' '.pos.' '
endfunction

let &statusline = winwidth(0)>80 ? s:statusline_expr() : '%t'
hi StatusLine ctermbg=0 guibg=Black
set laststatus=2 

""" maps
""" ----------------------------------------------------------------- 

noremap <F5> :so ~/.config/nvim/init.vim<CR>

noremap <leader>q :q<CR>
noremap <leader>Q :qa!<CR>

noremap <leader>d :Bdelete<CR>
noremap <leader>D :bufdo :Bdelete<CR>

nnoremap <leader>w :w<CR>
nnoremap <leader>wq :wq<CR>
vnoremap <leader>w :w<CR>
vnoremap <leader>wq :wq<CR>

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

"" call git fugitive interactive git
nnoremap <leader>gs <cmd>Git<cr>
nnoremap <leader>gw <cmd>Gw<cr>
nnoremap <leader>gb <cmd>Gitsigns toggle_current_line_blame<cr>

""" * selects current word and stay there and send it to default copy area
nnoremap * *N

""" select word under cursor and make it ready to be replaced in that file
noremap <F2> yviw*N:%s///g<left><left>

noremap <A-F> :normal gg=Gg;<cr>
vnoremap <A-F> :normal gg=Gg;<cr>


