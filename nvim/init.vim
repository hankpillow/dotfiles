lua require('plugins')

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

set showbreak=↪\
set listchars=tab:▶\ ,extends:›,precedes:‹,nbsp:•,trail:•,eol:$
set background=dark

""" depend on gitsigns.nvim intalled
set statusline+=%{get(b:,'gitsigns_status','')}
colorscheme tokyonight-night

""" maps
""" ----------------------------------------------------------------- 

noremap <F5> :so ~/.config/nvim/init.vim<cr>
noremap <leader>q :q<cr>
noremap <leader>Q :q!<cr>
noremap <leader>d :Bdelete<cr>
noremap <leader>D :bufdo :Bdelete<cr>
nnoremap <leader>s :w<cr>
vnoremap <leader>s :w<cr>

""" to the end/start of the line
noremap E g_
noremap B ^

""" changes the current location to file's path directory
noremap <leader>cd :lcd %:p:h<cr>

""" toggle showing invisible chars
noremap <leader>h :set list!<CR>
inoremap <leader>h <C-o>:set list!<CR>
cnoremap <leader>h <C-c>:set list!<CR>

""" fold 
noremap <A-}><space> za

""" buffer nav
noremap [b :bprev<cr>
noremap ]b :bnext<cr>

""" jump to previous/next editted place
noremap ]j g,
noremap [j g;

""" Alt + up/down to move the line above/below
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

""" Format the file and stay in the same line
nnoremap <A-F> gg=G''
vnoremap <A-F> =

""" Alt Shift up/down duplicate
noremap <A-K> yyP
noremap <A-J> yyp
vnoremap <A-K> yP
vnoremap <A-J> yp

""" toggle words
noremap <leader>w :set wrap!<cr>

nnoremap <leader>r :%s///gc<left><left><left><left>
vnoremap <leader>r :s///gc<left><left><left><left>


""" https://bluz71.github.io/2017/05/15/vim-tips-tricks.html
""" smart move inside multiline
nnoremap <expr> j v:count ? (v:count > 5 ? "m'" . v:count : '') . 'j' : 'gj'
nnoremap <expr> k v:count ? (v:count > 5 ? "m'" . v:count : '') . 'k' : 'gk'

""" "copy selection on visual mode and start searching
""" "on the page for more results
vnoremap // y/<C-R>"<CR>
