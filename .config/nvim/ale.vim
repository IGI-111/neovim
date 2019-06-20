let g:ale_fix_on_save = 1
let g:ale_completion_enabled = 0
call ale#Set('rust_cargo_use_clippy', 1)

nnoremap <silent> K :ALEHover<CR>
nnoremap <silent> gd :ALEGoToDefinition<CR>
nnoremap <silent> <F2> :ALEFindReferences<CR>
nnoremap <F3> :ALEFix<CR>

let g:ale_linters = {'rust': ['rls', 'cargo']}
let g:ale_fixers = {
\ 'typescript': ['prettier', 'eslint'],
\ 'javascript': ['prettier', 'eslint'],
\ 'rust': ['rustfmt']
\}
