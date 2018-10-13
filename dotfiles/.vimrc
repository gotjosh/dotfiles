if $VIM_PLUGINS != 'NO'
  runtime! autoload/pathogen.vim
  if exists('g:loaded_pathogen')
    execute pathogen#infect('~/.vimbundles/{}', '~/.vim/bundle/{}')
  endif
endif

set nocompatible " No vi compability
set history=1000 " More history; default: 20
set showmatch    " Show matching of: () [] {}

syntax on
filetype plugin indent on

set visualbell

set wildmenu
set wildmode=list:longest,full
setlocal spell

" Abbreviations
iabbrev todo     # TODO: (gotjosh)
iabbrev fixme    # FIXME: (gotjosh),
iabbrev bpry     require 'pry'; binding.pry;

" Allow undos to be persisted
if has('persistent_undo')
  set undofile
  set undodir^=~/.vim/tmp//,~/Library/Vim/undo
endif"

" Enable TAB indent and SHIFT-TAB unindent
vnoremap <silent> <TAB> >gv
vnoremap <silent> <S-TAB> <gv

set rtp+=/usr/local/opt/fzf


" Remap ctrl + p to FZF
nnoremap <silent> <C-p> :FZF<CR>

" Remap ; to open the list of buffers with FZF
nnoremap <silent> ; :Buffers<CR>

" Let ack.vim know to use ag instead of ack
let g:ackprg = 'ag --vimgrep'


set noswapfile
set ruler
set autowrite
set incsearch " search as you type

if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
endif

" vim-tests mappings
nnoremap <silent> <Leader>t :TestFile<CR>
nnoremap <silent> <Leader>s :TestNearest<CR>
nnoremap <silent> <Leader>l :TestLast<CR>
nnoremap <silent> <Leader>a :TestSuite<CR>
nnoremap <silent> <leader>gt :TestVisit<CR>

" send test command to iterm
let test#strategy = "iterm"
let g:rspec_runner = "os_x_iterm2"

" Open new split panes to right and bottom, which feels more natural
set splitright
set splitbelow

" Tab completion
" will insert tab at beginning of line,
" will use completion if not at beginning
set wildmode=list:longest,list:full
function! InsertTabWrapper()
  let col = col('.') - 1
  if !col || getline('.')[col - 1] !~ '\k'
    return "\<tab>"
  else
    return "\<c-p>"
  endif
endfunction
inoremap <Tab> <c-r>=InsertTabWrapper()<cr>
inoremap <S-Tab> <c-n>

" Softtabs, 2 spaces
set tabstop=2 " tabs are 2 spaces
set shiftwidth=2 " Even if there are tabs, preview as 2 spaces
set shiftround
set expandtab " tabs are spaces
set list " Highlight trailings
set listchars=tab:>-,trail:.,extends:>,precedes:<
set nohlsearch

set shell=/bin/bash

" Rename current file, thanks Gary Bernhardt via Ben Orenstein
function! RenameFile()
  let old_name = expand('%')
  let new_name = input('New file name: ', expand('%'), 'file')
  if new_name != '' && new_name != old_name
    exec ':saveas ' . new_name
    exec ':silent !rm ' . old_name
    redraw!
  endif
endfunction
map <leader>r :call RenameFile()<cr>

" Numbers
set number
set numberwidth=5

" Display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·

" Word wrap ruby comments to 85 characters
autocmd FileType ruby                   setlocal comments=:#\  tw=85

set hidden

set guifont=Monaco:h18
set guioptions-=T guioptions-=e guioptions-=L guioptions-=r
set shell=bash
colorscheme base16-tomorrow

augroup vimrc
  autocmd!
  autocmd GuiEnter * set columns=120 lines=70 number
augroup END

" Projections
"
if !exists('g:rails_gem_projections')
  let g:rails_gem_projections = {}
endif

" airline
"
let g:airline_enable_branch     = 1

" nerdtree-tabs
"

let g:nerdtree_tabs_open_on_gui_startup = 0
let g:nerdtree_tabs_autofind            = 0


" custom
"
highlight OverLength ctermbg=red ctermfg=black guibg=#592929
match OverLength /\%91v.\+/

" ale Syntax Highlighting
"
let g:ale_sign_column_always = 1
let g:ale_sign_error = '❌'
let g:ale_sign_warning = '❓'
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_lint_delay = 0 " Lint immediately
let g:ale_set_highlights = 0

highlight clear ALEErrorSign
highlight clear ALEWarningSign

call extend(g:rails_gem_projections, {
      \ "active_model_serializers": {
      \   "app/serializers/*_serializer.rb": {
      \     "command": "serializer",
      \     "template": "class {camelcase|capitalize|colons}Serializer < ActiveModel::Serializer\nend",
      \     "affinity": "model"}},
      \ "rspec": {
      \    "spec/support/*.rb": {
      \      "command": "support"}},
      \ "cucumber": {
      \   "features/*.feature": {
      \     "command": "feature",
      \     "template": "Feature: {capitalize|blank}"},
      \   "features/support/*.rb": {
      \     "command": "support"},
      \   "features/support/env.rb": {
      \     "command": "support"},
      \   "features/step_definitions/*_steps.rb": {
      \     "command": "steps"}},
      \ "factory_girl": {
      \   "spec/factories/*.rb": {
      \     "command": "factory",
      \     "alternate": "app/models/{}.rb",
      \     "related": "db/schema.rb#{pluralize}",
      \     "test": "spec/models/{}_spec.rb",
      \     "template": "FactoryGirl.define do\n  factory :{} do\n  end\nend",
      \     "affinity": "model"},
      \   "spec/factories.rb": {
      \      "command": "factory"},
      \   "test/factories.rb": {
      \      "command": "factory"}}
      \ }, 'keep')

set wildignore+=.git/**,public/assets/**,vendor/**,log/**,tmp/**,Cellar/**,app/assets/images/**,_site/**,home/.vim/bundle/**,pkg/**,**/.gitkeep,**/.DS_Store,**/*.netrw*,node_modules/*

