if MySys() == 'linux'
    "Fast reloading of the .vimrc
    nno <silent> <leader>es :so ~/.vimrc<cr>
    "Fast editing of .vimrc
    nno <silent> <leader>ee :call SwitchToBuf("~/.vimrc")<cr>
    "When .vimrc is edited, reload it
    au! bufwritepost .vimrc so ~/.vimrc
    au FileType python nno <buffer> <F12> :!python %
    au FileType ruby   nno <buffer> <F12> :!ruby %
    au FileType tex    nno <buffer> <F12> :!pdflatex %
    au FileType sh     nno <buffer> <F12> :!bash %
    au BufNewFile,BufRead .Xresources nno <buffer> <F12> :!xrdb %<cr>
    au FileType tmux   nno <buffer> <F12> :!tmux source %<cr>
    au FileType coffee   nno <buffer> <F12> :CoffeeCompile<cr>
    "set guifont=Arial\ monospaced\ for\ SAP\ 14
    set guifont=Arial\ monospaced\ for\ SAP\ for\ Powerline\ 14
    set gfw=文泉驿等宽微米黑\ 14
    nno <S-F1> :w !sudo tee %
    let g:template_path = $HOME . "/.vim/skel"
    set notimeout          " 映射时不检查超时
    set ttimeout           " 终端键码检查超时
    set timeoutlen=360     " 超时为 100 毫秒
    "set ttimeoutlen=10

    "hi Search ctermbg=12 ctermfg=6
    "set langmenu=zh_CN.UTF-8
    "source $VIMRUNTIME/delmenu.vim
    "source $VIMRUNTIME/menu.vim
    "language messages zh_CN.utf-8
    if match($TERM, "screen")!=-1
	set term=xterm
    en
    set t_Co=256
elseif MySys() == 'windows'
    set diffexpr=MyDiff()
    so $VIMRUNTIME/mswin.vim
    behave mswin
    " use C-A to add numbers
    nunmap <C-A>
    iunmap <C-Tab>
    " Disable alt menu
    set winaltkeys=no

    "Fast reloading of the _vimrc
    nno <silent> <leader>es :so $vim/_vimrc<cr>
    "Fast editing of _vimrc with different PC
    if hostname() == "BERT-PC"
	nno <silent> <leader>ee :call SwitchToBuf("C:/Program Files (x86)/Vim/_vimrc")<cr>
    el
	nno <silent> <leader>ee :call SwitchToBuf("c:/Program Files/Vim/_vimrc")<cr>
    en
    "When _vimrc is edited, reload it
    au! bufwritepost _vimrc so $vim/_vimrc

    au FileType python     nno <buffer> <F12> :!python.exe %
    au FileType tex        nno <buffer> <F12> :!pdflatex.exe %
    au FileType ruby       nno <buffer> <F12> :!C:\RailsInstaller\Ruby1.9.3\bin\ruby.exe %
    au FileType autohotkey nno <buffer> <F12> :w<Enter><Esc>:mksession! lastsession.vim<Enter>
    "set pretty fonts for coding
    set guifont=Arial_monospaced_for_SAP:h14:cANSI
    set gfw=Yahei_Mono:h14:cGB2312

    " IMPORTANT: win32 users will need to have 'shellslash' set so that latex
    " can be called correctly.
    set shellslash
    set enc=utf-8
    "language messages zh_CN.GBK
    language message zh_CN.UTF-8
en

