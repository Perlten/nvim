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
set backspace=indent,eol,start
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
Plug 'puremourning/vimspector'
Plug 'sbdchd/neoformat'
Plug 'jiangmiao/auto-pairs'
Plug 'morhetz/gruvbox'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' } 
Plug 'EdenEast/nightfox.nvim'
Plug 'joshdick/onedark.vim'
Plug 'nvim-lua/plenary.nvim'
Plug 'ThePrimeagen/harpoon'
Plug 'github/copilot.vim'
Plug 'tpope/vim-commentary'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'szw/vim-maximizer'
Plug 'francoiscabrol/ranger.vim'
Plug 'rbgrouleff/bclose.vim'
Plug 'tpope/vim-surround'
Plug 'L3MON4D3/LuaSnip'    
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'ray-x/lsp_signature.nvim'
Plug 'goolord/alpha-nvim'
Plug 'mogelbrod/vim-jsonpath'
Plug 'tpope/vim-abolish' 

"Gradle
Plug 'mfussenegger/nvim-jdtls'
Plug 'aloussase/gradle.nvim'
call plug#end()

:luafile ~/.config/nvim/lua/_lsp.lua
:luafile ~/.config/nvim/lua/_treesitter.lua
:luafile ~/.config/nvim/lua/_lualine.lua
:luafile ~/.config/nvim/lua/_telescope.lua
:luafile ~/.config/nvim/lua/_cmp.lua
:luafile ~/.config/nvim/lua/_alpha.lua
    :luafile ~/.config/nvim/lua/_keybindings.lua

set completeopt=menu,menuone,noselect

colorscheme gruvbox 
autocmd vimenter * ++nested colorscheme gruvbox

autocmd VimEnter * Copilot disable

set cursorline
set cursorlineopt=number
autocmd ColorScheme * highlight CursorLineNr cterm=bold term=bold gui=bold

let mapleader = " " 

set updatetime=100

" Movement
nnoremap <c-j> 10j
nnoremap <c-k> 10k

vnoremap <c-j> 10j
vnoremap <c-k> 10k

nnoremap <a-l> $
nnoremap <a-h> 0
vnoremap <a-l> $
vnoremap <a-h> 0

nnoremap <c-l> w
nnoremap <c-h> b
vnoremap <c-l> w
vnoremap <c-h> b
" Escape
noremap <a-s> <Nop>
map <a-s> <Esc>
inoremap <a-s> <Esc>
tnoremap <a-s> <C-\><C-n>
cnoremap <a-s> <C-C> 
" Indent
nnoremap <TAB> >>
nnoremap <S-TAB> <<
vnoremap <TAB> >gv
vnoremap <S-TAB> <gv
" Random
nnoremap <leader>m :MaximizerToggle<CR>
nnoremap <leader>sc :noh<CR>
nnoremap <leader>pwd :!pwd <CR>
nnoremap <leader>cp :let @+ = expand("%") <CR>
nnoremap <leader>cfp :let @+ = expand("%:p")<CR>
" removes always cut 
nnoremap x "_x
nnoremap d "_d
nnoremap D "_D
vnoremap d "_d
nnoremap c "_c
imap <C-BS> :! echo test

nnoremap <leader>q :q<CR>

nnoremap <leader>tq :tabclose<CR>

nnoremap <leader>wsv :vsplit<CR>
nnoremap <leader>wsh :split<CR>
nnoremap <leader>wl :vertical resize +10<CR>
nnoremap <leader>wh :vertical resize -10<CR>
nnoremap <leader>wj :resize -5<CR>
nnoremap <leader>wk :resize +5<CR>

nnoremap <leader>fdn :Neoformat<CR>
nnoremap <leader>ww :w<CR>
nnoremap <leader>wa :wa<CR>
nnoremap <leader>wq :wq<CR>
nnoremap <leader>wqa :wqa<CR>

nnoremap <leader>u :UndotreeToggle<CR>

nnoremap <leader>sv :source ~/.config/nvim/init.vim<CR>

" Vimspector
nnoremap <leader>dd :call vimspector#Launch()<CR>
nnoremap <leader>db :call vimspector#ToggleBreakpoint()<CR>
nnoremap <leader>dcb :call vimspector#ToggleBreakpoint({ 'condition': '' })<left><left><left><left>
nnoremap <leader>dj :call vimspector#StepOver()<CR>
nnoremap <leader>dl :call vimspector#StepInto()<CR>
nnoremap <leader>dh :call vimspector#StepOut()<CR>
nnoremap <leader>dx :call vimspector#RunToCursor()<CR>
nnoremap <leader>dc :call vimspector#Continue()<CR>
nnoremap <leader>dr :call vimspector#Restart()<CR>
nnoremap <leader>ds :call vimspector#Stop()<CR>
nnoremap <leader>dq :VimspectorReset<CR>
nnoremap <leader>dccb :call vimspector#ClearBreakpoints()<CR>
nmap <Leader>di <Plug>VimspectorBalloonEval
xmap <Leader>di <Plug>VimspectorBalloonEval

let g:vimspector_sign_priority = {
            \ 'vimspectorBP':         200, 
            \ 'vimspectorBPCond':     200, 
            \ 'vimspectorBPLog':      200,
            \ 'vimspectorBPDisabled': 200
            \ }

" harpoon
nnoremap <leader>hh :lua require("harpoon.ui").toggle_quick_menu()<CR>
nnoremap <leader>hm :lua require("harpoon.mark").add_file()<CR>

let i = 1
while i <= 9
    execute 'nnoremap <leader>h' . i . ' :lua require("harpoon.ui").nav_file('.i .')<CR>'
    let i = i + 1
endwhile

nnoremap <silent> <leader>o :<C-u>call append(line("."),   repeat([""], v:count1))<CR>
nnoremap <silent> <leader>O :<C-u>call append(line(".")-1, repeat([""], v:count1))<CR>

"move line up and down 
nnoremap <A-S-j> :m .+1<CR>==
nnoremap <A-S-k> :m .-2<CR>==
inoremap <A-S-j> <Esc>:m .+1<CR>==gi
inoremap <A-S-k> <Esc>:m .-2<CR>==gi
vnoremap <A-S-j> :m '>+1<CR>gv=gv
vnoremap <A-S-k> :m '<-2<CR>gv=gv
"move in insert mode with alt
inoremap <A-h> <left>
inoremap <A-j> <down>
inoremap <A-k> <up>
inoremap <A-l> <right>

let i = 1
while i <= 9
    execute 'nnoremap <Leader>' . i . ' :' . i . 'wincmd w<CR>'
    let i = i + 1
endwhile
nnoremap <leader><tab> <c-w><c-p> 

" Git
nnoremap <leader>gaa :Git add --all<CR>
nnoremap <leader>ga :Git add
nnoremap <leader>gc :Git commit<CR>
nnoremap <leader>gp :Git push
nnoremap <leader>gl :Git log<CR>
nnoremap <leader>gb :Git blame<CR>
nnoremap <leader>gs :Telescope git_status<CR> 
nmap <leader>ghp <Plug>(GitGutterPreviewHunk)
" Telescope
nnoremap <leader>ff <cmd>Telescope find_files find_command=rg,--hidden,--files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>fws <cmd>Telescope lsp_dynamic_workspace_symbols<cr>
nnoremap <leader>fk <cmd>Telescope keymaps<cr>
nnoremap <leader>fif <cmd>Telescope current_buffer_fuzzy_find<cr>
nnoremap <leader>fds <cmd>Telescope lsp_document_symbols<cr>
nnoremap <leader>fc <cmd>Telescope commands<cr>
" Ranger    
let g:ranger_map_keys = 0
nnoremap <leader>ee :RangerWorkingDirectory<CR>
nnoremap <leader>ec :RangerCurrentFile<CR>
let g:ranger_command_override = 'ranger --cmd "set show_hidden=true"'
" Termianl 
nnoremap <leader>ter :term<CR>

" Inserts
" let g:AutoPairsShortcutToggle = False
inoremap <A-p> ()<Left> 
inoremap <A-c> {}<Left> 

" Cargo
nnoremap <leader>cr :! cargo run <CR>
nnoremap <leader>cb :! cargo build <CR>
