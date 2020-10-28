"------------------------------------------------
" normal setting
"------------------------------------------------
    syntax on
    set backspace=indent,eol,start
    "set runtimepath=~/.vim,~/tool/vim_local/share/vim/vimfiles,~/tool/vim_local/share/vim/vim82,~/tool/vim_local/share/vim/vimfiles/after,~/.vim/after
    set rtp+=/home/user/kiennt/tool/fzf-master/bin/fzf
    set rtp+=/home/user/kiennt/.vim/autoload/fzf
    set showcmd
    hi Folded ctermfg=235
    set nu
    "colorscheme darkblue
    "colorscheme torte
    colorscheme molokai
    colorscheme solarized8
    set laststatus=2
    set tabstop=2 "set tabstop=2
    "set expandtab!
    set expandtab
    set softtabstop=2
    "set shiftwidth=2
    set smarttab!
    set autoindent
    au BufRead,BufNewFile *.sv  set filetype=verilog
    au BufRead,BufNewFile *.sva set filetype=verilog
    au BufRead,BufNewFile *.svp set filetype=verilog
    au BufRead,BufNewFile *.S   set syntax=kien
    au BufRead,BufNewFile *.s   set syntax=kien
    set ignorecase
    set incsearch
    set hlsearch
    "set term=builtin_ansi

"------------------------------------------------
" store fold
"------------------------------------------------
    "autocmd InsertLeave,WinEnter * let &l:foldmethod=g:oldfoldmethod
    "autocmd InsertEnter,WinLeave * let g:oldfoldmethod=&l:foldmethod | setlocal foldmethod

    "augroup remember_folds
    "  autocmd!
    "  autocmd BufWinLeave * mkview
    "  autocmd BufWinEnter * silent! loadview
    "augroup END

    "Don't screw up folds when inserting text that might affect them, until
    "leaving insert mode. Foldmethod is local to the window. Protect against
    "screwing up folding when switching between windows.
    autocmd InsertEnter * if !exists('w:last_fdm') | let w:last_fdm=&foldmethod | setlocal foldmethod=manual | endif
    autocmd InsertLeave,WinLeave * if exists('w:last_fdm') | let &l:foldmethod=w:last_fdm | unlet w:last_fdm | endif

"------------------------------------------------
" noremap
"------------------------------------------------
     noremap a <NOP>
    "noremap c <NOP>
    "noremap h <NOP>
    "noremap j <NOP>
    "noremap k <NOP>
    "noremap l <NOP>
     noremap j k
     noremap k j
     noremap . <NOP>

    "noremap <C-b> <NOP>
    "noremap <C-f> <NOP>

    "noremap <C-d> :sh<cr>
     noremap <C-d> :set autochdir<cr>:sh<cr>
    "noremap <S-a> <S-a><ESC>

     nnoremap <F7> :syntax on<cr>
     nnoremap <F6> :syntax off<cr>:hi DiffChange ctermfg=NONE ctermbg=NONE<cr>
     nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR
    "nnoremap <F6> :hi TabLineSel ctermfg=Yellow ctermbg=DarkGreen<cr>
     nnoremap <F4> :set autochdir<cr>
     nnoremap <F3> :set nowrap<cr>
     nnoremap <F2> :set ro!<cr>
     nnoremap <F1> :set list!<cr>:set list?<cr>

     nnoremap <F9>  :set ts=2 sts=2 sw=2 expandtab<cr>
     nnoremap <F10> :set ts=4 sts=4 sw=4 expandtab<cr>
     nnoremap <F11> :set ts=8 sts=8 sw=8 expandtab<cr>

" ------------------------------------------------
" leader
" ------------------------------------------------
    let mapleader = "m"
    "let mapleader = ","
    nmap <leader>w :w<cr>
    nmap <leader>q :q<cr>
    nmap <leader>t :tabe 
    nmap <leader>; :
    nmap <leader>v :vs 
    nmap <leader>e <C-w>w
    "nmap <leader>f :call ToggleEssayMode()<cr>
    nmap <leader>f :diffthis<cr>
    nmap <leader>l :ls<cr>
    "nmap <leader>h :%s/<cr>
    nmap <leader>y yyp
    nmap <leader>1 1gt<cr>
    nmap <leader>2 2gt<cr>
    nmap <leader>3 3gt<cr>
    nmap <leader>4 4gt<cr>
    nmap <leader>5 5gt<cr>
    nmap <leader>6 6gt<cr>
    nmap <leader>7 7gt<cr>
    nmap <leader>8 8gt<cr>
    nmap <leader>9 9gt<cr>

    "disable highlight when search by using leader + cr(enter)
    map <silent> <leader><cr> :noh<cr>:diffoff<cr>zm:set nowrap<cr>

    " delete without yanking
    "vnoremap <leader>d "_di
    vnoremap <leader>/ <Esc>/\%V
    vnoremap <leader>h <Esc>:%s/\%V

    " Plugin Eesy motion
        "map <Leader> <Plug>(easymotion-prefix)
        map , <Plug>(easymotion-prefix)

    " Plugin NERDTree
        nmap <leader>n :NERDTreeToggle<cr>
        let NERDTreeMapMenu='\\'
        let g:nerdtree_tabs_synchronize_view = 0

    " Plugin FZF
        " Empty value to disable preview window altogether
        let g:fzf_preview_window = ''
        " Always enable preview window on the right with 60% width
        let g:fzf_preview_window = 'right:60%'

" ------------------------------------------------
" other
" ------------------------------------------------
    map <A-1> :tabNext 1<cr>
    map <A-2> :tabNext 2<cr>
    map <A-3> :tabNext 3<cr>
    map <A-4> :tabNext 4<cr>

    set guitablabel=%t
    "1,$s///g
    set ff=unix

    "search visually selected text
    vnoremap // y/<C-R>"<CR>
    vnoremap /h y/.*<C-R>"\&.*
    vnoremap ;/ y:%s/<C-R>"/

    "return to last edit position when opening files
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

    "disable swap files
    set noswapfile

    "mapping some autocorrects
    imap ;as ast_gs_: assert property(<left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left>
    imap ;es ) else wave.err_cnt++;
    imap ;di disable iff(~
    imap ;at @(
    set noro

    "set enc=utf-8
    set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
    set termencoding=utf-8
    set encoding=utf-8

    hi TabLineSel ctermfg=Yellow ctermbg=DarkGreen

    nmap <ScrollWheelUp> <nop>
    nmap <S-ScrollWheelUp> <nop>
    nmap <C-ScrollWheelUp> <nop>
    nmap <ScrollWheelDown> <nop>
    nmap <S-ScrollWheelDown> <nop>
    nmap <C-ScrollWheelDown> <nop>
    nmap <ScrollWheelLeft> <nop>
    nmap <S-ScrollWheelLeft> <nop>
    nmap <C-ScrollWheelLeft> <nop>
    nmap <ScrollWheelRight> <nop>
    nmap <S-ScrollWheelRight> <nop>
    nmap <C-ScrollWheelRight> <nop>

    set cursorline

    set list
    "set nolist
    "set listchars=tab:!·,trail:·
    "set listchars=tab:->,trail:·
    set listchars=tab:▒░,trail:▓

" ------------------------------------------------
" highlight
" ------------------------------------------------
    hi TabLine      ctermfg=Black  ctermbg=Green     cterm=NONE
    hi TabLineFill  ctermfg=Black  ctermbg=Green     cterm=NONE
    hi TabLineSel   ctermfg=White  ctermbg=DarkBlue  cterm=NONE

    "hi DiffAdd      ctermfg=NONE          ctermbg=Green
    "hi DiffChange   ctermfg=NONE          ctermbg=NONE
    "hi DiffDelete   ctermfg=LightBlue     ctermbg=Red
    "hi DiffText     ctermfg=Yellow        ctermbg=Red
    highlight DiffAdd    cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
    highlight DiffDelete cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
    highlight DiffChange cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
    highlight DiffText   cterm=bold ctermfg=10 ctermbg=88 gui=none guifg=bg guibg=Red

    if &diff
        syntax off
    endif

" ------------------------------------------------
" end
" ------------------------------------------------
" Rename tabs to show tab number.
" (Based on http://stackoverflow.com/questions/5927952/whats-implementation-of-vims-default-tabline-function)
if exists("+showtabline")
    function! MyTabLine()
        let s = ''
        let wn = ''
        let t = tabpagenr()
        let i = 1
        while i <= tabpagenr('$')
            let buflist = tabpagebuflist(i)
            let winnr = tabpagewinnr(i)
            let s .= '%' . i . 'T'
            let s .= (i == t ? '%1*' : '%2*')
            let s .= ' '
            let wn = tabpagewinnr(i,'$')

            let s .= '%#TabNum#'
            let s .= i
            " let s .= '%*'
            let s .= (i == t ? '%#TabLineSel#' : '%#TabLine#')
            let bufnr = buflist[winnr - 1]
            let file = bufname(bufnr)
            let buftype = getbufvar(bufnr, 'buftype')
            if buftype == 'nofile'
                if file =~ '\/.'
                    let file = substitute(file, '.*\/\ze.', '', '')
                endif
            else
                let file = fnamemodify(file, ':p:t')
            endif
            if file == ''
                let file = '[No Name]'
            endif
            let s .= ' ' . file . ' '
            let i = i + 1
        endwhile
        let s .= '%T%#TabLineFill#%='
        let s .= (tabpagenr('$') > 1 ? '%999XX' : 'X')
        return s
    endfunction
    set stal=2
    set tabline=%!MyTabLine()
    set showtabline=1
    highlight link TabNum Special
endif

funct! GallFunction(re)
  cexpr []
  execute 'silent! noautocmd bufdo vimgrepadd /' . a:re . '/j %'
  cw
endfunct

command! -nargs=1 Gall call GallFunction(<q-args>)
