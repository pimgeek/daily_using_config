"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => 通用设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 设定 VIM 的命令行历史条数
set history=700

" 启用文件类型插件
filetype plugin on
filetype indent on

" 检测到外部文件改动时，自动读取最新的文件内容
set autoread

" 设定粘贴模式
set paste

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM 用户界面设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" 始终显示当光标的当前位置
set ruler

" 根据文件类型设置 tab 宽度
set shiftwidth=0

autocmd Filetype html setlocal tabstop=2 softtabstop=2 noexpandtab
autocmd Filetype css setlocal tabstop=2 softtabstop=2 noexpandtab
autocmd Filetype javascript setlocal tabstop=2 softtabstop=2 noexpandtab
autocmd Filetype python setlocal tabstop=4 softtabstop=4 noexpandtab

" 设定命令区域的高度
set cmdheight=2

" 让回退键（Backspace）正常工作
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" 搜索时忽略大小写
set ignorecase

" 高亮搜索结果
set hlsearch

" 搜索时使用增量搜索
set incsearch

" 当光标移动到括号位置时，自动显示其配对括号
set showmatch
" 匹配括号时，等待多长时间后闪烁（时间单位 = 1/10 秒）
set mat=2

" 出错时不要闪烁或发出警报声
set noerrorbells
set novisualbell
set t_vb=
set tm=500

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => 颜色与字体设定
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 启用语法高亮
syntax enable

colorscheme desert
set background=dark

" 设定默认的字符编码（utf8）
set encoding=utf8

" 设定默认文件格式为 UNIX
set ffs=unix,dos,mac

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => 文件处理，备份和回退操作设定
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 关闭备份功能
set nobackup
set nowb
set noswapfile

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => 光标移动设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 把自动折行的代码行看作两行，便于在较长的代码行内上下移动
map j gj
map k gk

" 在不同的窗口之间移动时，用 Ctrl+h/j/k/l 代替 Ctrl+W h/j/k/l
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => 第三方插件设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 为 plug.vim 插件管理器指定插件目录
" - 如果使用 Neovim: ~/.local/share/nvim/plugged
" - 别使用 Vim 的保留目录，比如 'plugin'，使用 'plugged' 即可
call plug#begin('~/.vim/plugged')

" 指定插件名称时，一定要使用 ' 单引号！

Plug 'wesQ3/vim-windowswap'		" 用于在 vim 中对已经打开的窗口交换位置
Plug 'vim-syntastic/syntastic'		" 用于各种代码的语法检查
Plug 'mattn/emmet-vim'			" 用于加速 html 代码开发

" 初始化 plug.vim 插件系统
call plug#end()

" 设置 syntastic 插件的默认选项
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 2
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_css_checkers = ['csslint']
let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_python_checkers = ['pyflakes']
