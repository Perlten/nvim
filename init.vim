syntax on

set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.config/nvim/undodir
set undofile
set incsearch
set mouse=a
set colorcolumn=80
set clipboard=unnamedplus
set so=999
set relativenumber
set rnu
highlight ColorColumn ctermbg=0 guibg=lightgray

call plug#begin('~/.config/nvim/plugged') 
Plug 'mbbill/undotree'
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
Plug 'puremourning/vimspector'
Plug 'sbdchd/neoformat'
Plug 'jiangmiao/auto-pairs'
Plug 'morhetz/gruvbox'
Plug 'preservim/nerdtree'
Plug 'nvim-lua/plenary.nvim'
Plug 'ThePrimeagen/harpoon'
Plug 'github/copilot.vim'
Plug 'tpope/vim-commentary'
Plug 'mhinz/vim-startify'
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-fugitive'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'szw/vim-maximizer'
Plug 'francoiscabrol/ranger.vim'
Plug 'rbgrouleff/bclose.vim'
Plug 'tpope/vim-surround'
call plug#end()

:luafile ~/.config/nvim/lua/_cmp.lua
:luafile ~/.config/nvim/lua/_lsp.lua
:luafile ~/.config/nvim/lua/_treesitter.lua
:luafile ~/.config/nvim/lua/_lualine.lua

set completeopt=menu,menuone,noselect
let g:completion_enable_snippet = 'vim-vsnip'

autocmd vimenter * ++nested colorscheme gruvbox
set cursorline
set cursorlineopt=number
autocmd ColorScheme * highlight CursorLineNr cterm=bold term=bold gui=bold

let mapleader = " " 

set updatetime=100

inoremap ii <Esc>
tnoremap ii <C-\><C-n>

nnoremap <TAB> >>
nnoremap <S-TAB> <<
vnoremap <TAB> >gv
vnoremap <S-TAB> <gv

nnoremap <leader>m :MaximizerToggle<CR>

nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>q :q<CR>

nnoremap <leader>tq :tabclose<CR>

nnoremap <leader>wsv :vsplit<CR>
nnoremap <leader>wsh :split<CR>
nnoremap <leader>wl :vertical resize +10<CR>
nnoremap <leader>wh :vertical resize -10<CR>
nnoremap <leader>wj :resize -5<CR>
nnoremap <leader>wk :resize +5<CR>

nnoremap <leader>f :Neoformat<CR>
nnoremap <leader>ww :w<CR>
nnoremap <leader>wa :wa<CR>
nnoremap <leader>wq :wq<CR>
nnoremap <leader>wqa :wqa<CR>

nnoremap <leader>u :UndotreeToggle<CR>
nnoremap <leader>n :NERDTreeToggle<CR>

nnoremap <leader>sv :source ~/.config/nvim/init.vim<CR>

nnoremap <leader>dd :call vimspector#Launch()<CR>
nnoremap <leader>db :call vimspector#ToggleBreakpoint()<CR>
nnoremap <leader>dj :call vimspector#StepOver()<CR>
nnoremap <leader>dl :call vimspector#StepInto()<CR>
nnoremap <leader>dh :call vimspector#StepOut()<CR>
nnoremap <leader>dx :call vimspector#RunToCursor()<CR>
nnoremap <leader>dc :call vimspector#Continue()<CR>
nnoremap <leader>dr :call vimspector#Restart()<CR>
nnoremap <leader>ds :call vimspector#Stop()<CR>
nnoremap <leader>dcb :call vimspector#ClearBreakpoints()<CR>
" harpoon
nnoremap <leader>hh :lua require("harpoon.ui").toggle_quick_menu()<CR>
nnoremap <leader>hm :lua require("harpoon.mark").add_file()<CR>

nnoremap <silent> <leader>o :<C-u>call append(line("."),   repeat([""], v:count1))<CR>
nnoremap <silent> <leader>O :<C-u>call append(line(".")-1, repeat([""], v:count1))<CR>

let i = 1
while i <= 9
    execute 'nnoremap <leader>h' . i . ' :lua require("harpoon.ui").nav_file('.i .')<CR>'
    let i = i + 1
endwhile

"move line up and down 
nnoremap <A-S-j> :m .+1<CR>==
nnoremap <A-S-k> :m .-2<CR>==
inoremap <A-S-j> <Esc>:m .+1<CR>==gi
inoremap <A-S-k> <Esc>:m .-2<CR>==gi
vnoremap <A-S-j> :m '>+1<CR>gv=gv
vnoremap <A-S-k> :m '<-2<CR>gv=gv
"move in insert mode with alt
inoremap <A-h> <C-o>h
inoremap <A-j> <C-o>j
inoremap <A-k> <C-o>k
inoremap <A-l> <C-o>l

let i = 1
while i <= 9
    execute 'nnoremap <Leader>' . i . ' :' . i . 'wincmd w<CR>'
    let i = i + 1
endwhile

nnoremap <leader>gaa :Git add --all<CR>
nnoremap <leader>ga :Git add
nnoremap <leader>gc :Git commit<CR>
nnoremap <leader>gp :Git push
nnoremap <leader>gl :Git log<CR>
nnoremap <leader>gb :Git blame<CR>
nnoremap <leader>gs :Telescope git_status<CR> 

" Telescope
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>fs <cmd>Telescope lsp_dynamic_workspace_symbols<cr>
nnoremap <leader>fk <cmd>Telescope keymaps<cr>
nnoremap <leader>fif <cmd>Telescope current_buffer_fuzzy_find<cr>
nnoremap <leader>fc <cmd>Telescope commands<cr>
" Ranger    
let g:ranger_map_keys = 0
nnoremap <leader>e :RangerWorkingDirectory<CR>
" Termianl 
nnoremap <leader>ter :term<CR>
" Go to start and end of line
nnoremap <c-l> $
nnoremap <c-h> 0
vnoremap <c-l> $
vnoremap <c-h> 0
inoremap <c-a-l> $
inoremap <c-a-h> 0





