hi clear

if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "mellow"

if has("nvim")
  lua package.loaded["mellow"] = nil
  lua require("mellow").colorscheme()
  finish
endif

" ============================================================================
" Vim fallback implementation
" ============================================================================

" Palette --------------------------------------------------------------------

let s:transparent = get(g:, "mellow_transparent", 0)

let s:c = {
\ "bg":            "#161617",
\ "fg":            "#c9c7cd",
\ "bg_dark":       "#131314",
\
\ "black":         "#27272a",
\ "red":           "#f5a191",
\ "green":         "#90b99f",
\ "yellow":        "#e6b99d",
\ "blue":          "#aca1cf",
\ "magenta":       "#e29eca",
\ "cyan":          "#ea83a5",
\ "white":         "#c1c0d4",
\
\ "bright_black":  "#353539",
\ "bright_red":    "#ffae9f",
\ "bright_green":  "#9dc6ac",
\ "bright_yellow": "#f0c5a9",
\ "bright_blue":   "#b9aeda",
\ "bright_magenta":"#ecaad6",
\ "bright_cyan":   "#f591b2",
\ "bright_white":  "#cac9dd",
\
\ "gray00":        "#18181a",
\ "gray01":        "#1b1b1d",
\ "gray02":        "#2a2a2d",
\ "gray03":        "#3e3e43",
\ "gray04":        "#57575f",
\ "gray05":        "#757581",
\ "gray06":        "#9998a8",
\ "gray07":        "#c1c0d4",
\ }

" Helpers --------------------------------------------------------------------

function! s:hi(group, fg, bg, attr) abort
  let l:cmd = ["hi", a:group]

  if !empty(a:fg)
    call add(l:cmd, "guifg=" . a:fg)
  endif

  if !empty(a:bg)
    call add(l:cmd, "guibg=" . a:bg)
  endif

  if !empty(a:attr)
    call add(l:cmd, "gui=" . a:attr)
    call add(l:cmd, "cterm=" . a:attr)
  endif

  execute join(l:cmd, " ")
endfunction

function! s:bg(color) abort
  if s:transparent
    return "NONE"
  endif
  return a:color
endfunction

" Terminal colors ------------------------------------------------------------

if has("terminal") || exists("+termguicolors")
  let g:terminal_color_0  = s:c.black
  let g:terminal_color_1  = s:c.red
  let g:terminal_color_2  = s:c.green
  let g:terminal_color_3  = s:c.yellow
  let g:terminal_color_4  = s:c.blue
  let g:terminal_color_5  = s:c.magenta
  let g:terminal_color_6  = s:c.cyan
  let g:terminal_color_7  = s:c.white
  let g:terminal_color_8  = s:c.bright_black
  let g:terminal_color_9  = s:c.bright_red
  let g:terminal_color_10 = s:c.bright_green
  let g:terminal_color_11 = s:c.bright_yellow
  let g:terminal_color_12 = s:c.bright_blue
  let g:terminal_color_13 = s:c.bright_magenta
  let g:terminal_color_14 = s:c.bright_cyan
  let g:terminal_color_15 = s:c.bright_white
endif

" Editor UI ------------------------------------------------------------------

call s:hi("Normal",       s:c.fg,      s:bg(s:c.bg),        "")
call s:hi("NormalNC",     s:c.fg,      s:bg(s:c.bg_dark),   "")
call s:hi("CursorLine",   "",          s:c.gray01,          "")
call s:hi("ColorColumn",  "",          s:c.gray01,          "")
call s:hi("LineNr",       s:c.gray04,  "",                  "")
call s:hi("CursorLineNr", s:c.gray06,  "",                  "")
call s:hi("VertSplit",    s:c.gray02,  "",                  "")
call s:hi("WinSeparator", s:c.gray02,  "",                  "")
call s:hi("Visual",       "",          s:c.gray02,          "")
call s:hi("Search",       s:c.bright_yellow, s:c.black,     "")
call s:hi("IncSearch",    s:c.black,   s:c.yellow,          "bold")
call s:hi("MatchParen",   s:c.yellow,  "",                  "underline")
call s:hi("StatusLine",   s:c.white,   s:c.gray02,          "")
call s:hi("StatusLineNC", s:c.gray05,  s:c.gray02,          "")
call s:hi("Pmenu",        s:c.white,   s:c.black,           "")
call s:hi("PmenuSel",     s:c.bright_white, s:c.gray03,     "bold")
call s:hi("FoldColumn",   s:c.gray05,  s:bg(s:c.bg),        "")
call s:hi("SignColumn",   s:c.gray05,  s:bg(s:c.bg),        "")
call s:hi("NonText",      s:c.gray05,  "",                  "")
call s:hi("EndOfBuffer",  s:c.gray02,  "",                  "")
call s:hi("Title",        s:c.green,   "",                  "bold")
call s:hi("ErrorMsg",     s:c.red,     "",                  "bold")
call s:hi("WarningMsg",   s:c.yellow,  "",                  "")
call s:hi("MoreMsg",      s:c.bright_magenta, "",           "bold")
call s:hi("Question",     s:c.blue,    "",                  "bold")

" Syntax ---------------------------------------------------------------------

call s:hi("Comment",      s:c.gray05,  "",                  "italic")
call s:hi("Constant",     s:c.cyan,    "",                  "")
call s:hi("String",       s:c.green,   "",                  "")
call s:hi("Character",    s:c.green,   "",                  "")
call s:hi("Number",       s:c.magenta, "",                  "")
call s:hi("Boolean",      s:c.yellow,  "",                  "")
call s:hi("Float",        s:c.magenta, "",                  "")

call s:hi("Identifier",   s:c.fg,      "",                  "")
call s:hi("Function",     s:c.white,   "",                  "")

call s:hi("Statement",    s:c.white,   "",                  "")
call s:hi("Conditional",  s:c.blue,    "",                  "")
call s:hi("Repeat",       s:c.blue,    "",                  "")
call s:hi("Label",        s:c.blue,    "",                  "")
call s:hi("Operator",     s:c.yellow,  "",                  "")
call s:hi("Keyword",      s:c.blue,    "",                  "")
call s:hi("Exception",    s:c.blue,    "",                  "")

call s:hi("PreProc",      s:c.cyan,    "",                  "")
call s:hi("Include",      s:c.blue,    "",                  "")
call s:hi("Define",       s:c.cyan,    "",                  "")
call s:hi("Macro",        s:c.cyan,    "",                  "")
call s:hi("PreCondit",    s:c.cyan,    "",                  "")

call s:hi("Type",         s:c.bright_blue, "",              "")
call s:hi("StorageClass", s:c.yellow,  "",                  "")
call s:hi("Structure",    s:c.yellow,  "",                  "")
call s:hi("Typedef",      s:c.yellow,  "",                  "")

call s:hi("Special",      s:c.blue,    "",                  "")
call s:hi("SpecialChar",  s:c.yellow,  "",                  "")
call s:hi("Tag",          s:c.yellow,  "",                  "")
call s:hi("Delimiter",    s:c.gray06,  "",                  "")
call s:hi("SpecialComment", s:c.gray05,"",                  "")
call s:hi("Debug",        s:c.yellow,  "",                  "")

call s:hi("Underlined",   s:c.blue,    "",                  "underline")
call s:hi("Ignore",       s:c.gray04,  "",                  "")
call s:hi("Error",        s:c.red,     "",                  "bold")
call s:hi("Todo",         s:c.yellow,  "",                  "bold")

" Diff -----------------------------------------------------------------------

call s:hi("DiffAdd",      s:c.black,   s:c.green,           "")
call s:hi("DiffChange",   s:c.yellow,  "",                  "underline")
call s:hi("DiffDelete",   s:c.black,   s:c.red,             "")
call s:hi("DiffText",     s:c.black,   s:c.yellow,          "bold")

" Spell ----------------------------------------------------------------------

call s:hi("SpellBad",     s:c.red,     "",                  "underline")
call s:hi("SpellCap",     s:c.yellow,  "",                  "underline")
call s:hi("SpellLocal",   s:c.blue,    "",                  "underline")
call s:hi("SpellRare",    s:c.magenta, "",                  "underline")

" HTML -----------------------------------------------------------------------

call s:hi("htmlTag",      s:c.gray06,  "",                  "")
call s:hi("htmlEndTag",   s:c.gray06,  "",                  "")
call s:hi("htmlTagName",  s:c.cyan,    "",                  "")
call s:hi("htmlArg",      s:c.bright_blue, "",              "italic")

" Markdown -------------------------------------------------------------------

call s:hi("markdownHeadingDelimiter", s:c.gray05, "", "")
call s:hi("markdownCode",             s:c.yellow, "", "")
call s:hi("markdownCodeBlock",        s:c.yellow, "", "")
call s:hi("markdownLinkText",         s:c.blue,   "", "italic")
call s:hi("markdownUrl",              s:c.green,  "", "underline")
call s:hi("markdownBold",             s:c.fg,     "", "bold")
call s:hi("markdownItalic",           s:c.fg,     "", "italic")

" Basic plugin compatibility -------------------------------------------------

call s:hi("GitSignsAdd",    s:c.green,  "", "")
call s:hi("GitSignsChange", s:c.yellow, "", "")
call s:hi("GitSignsDelete", s:c.red,    "", "")

call s:hi("DiagnosticError", s:c.red,    "", "")
call s:hi("DiagnosticWarn",  s:c.yellow, "", "")
call s:hi("DiagnosticInfo",  s:c.blue,   "", "")
call s:hi("DiagnosticHint",  s:c.cyan,   "", "")
