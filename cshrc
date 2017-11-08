# (t)csh configuration file

if ( -f /etc/csh.cshrc ) then
    source /etc/csh.cshrc
endif

if ( $?prompt ) then    # NOTE: only interactive shells set $prompt
  bindkey -e     # use emacs style line editing

  set addsuffix
  set autolist   = ambiguous
  set autorehash
  set complete
  set csubstnonl
  set echo_style = bsd
  set edit
  set globstar
  set histdup    = prev
  set history    = 1000
  set ignoreeof  = 0
  set nobeep
  set noclobber
  set rmstar
  set savehist   = (1000 merge)

  if ($?tcsh) then
    bindkey "^W"    backward-delete-word
    bindkey -k up   history-search-backward
    bindkey -k down history-search-forward
  endif

  # NOTE: designated $HOME/.usr/bin as location for personal executables
  set path = ($HOME/.usr/bin $path)

  # NOTE: system manpage location retrieved from /etc/manpaths
  # NOTE: designated $HOME/.usr/man as location for personal manpages
  setenv MANPATH $HOME/.usr/man:/usr/share/man:/usr/local/man

  # for colorized ls, mimic's Linux GNU ls colors
  # NOTE: softened blue and cyan in Terminal.app profile's ANSI colors
  #       and checked to use bright colors for bold
  setenv LSCOLORS ExGxBxDxCxHxDxxbxgExEx

  # prevent less from saving a history file in $HOME
  setenv LESSHISTFILE -

  # use less as the pager for man and make sure it shows the right status
  setenv MANPAGER 'less -M +Gg'

  # prompt settings
  # 
  # regular prompt is current directory + %
  # right prompt is vcs information (vcs)-[branch] defined by vcsinfo.sh
  alias precmd 'set vcsinfo=`vcsinfo.sh`'

  set promptchars = '%#'
  set prompt      = '%B[%~] %# %b'
  set prompt2     = '%B%R? %b'
  set prompt3     = '%{\033[1;31m%}CORRECT>%R (y|n|e|a)?%{\033[0m%} '
  set rprompt     = '%{\033[1;34m%}%$vcsinfo%{\033[0m%} ' # space is needed to
                                                          # prevent colorbleed
  # aliases - defined for Mac OS X
  alias cp         '/bin/cp -iR'
  alias mv         '/bin/mv -i'
  alias su         '/usr/bin/su -m'

  alias h          'history 25' # history is a builtin
  alias j          'jobs -l'    # jobs is a builtin

  alias l.         '/bin/ls -GFhd .*'
  alias ls         '/bin/ls -GFh'
  alias la         '/bin/ls -GFha'
  alias ll         '/bin/ls -GFhil'
  alias lla        '/bin/ls -GFhail'

  alias lanum      '/bin/ls -A \!:1 | wc -l'
  alias lsnum      '/bin/ls    \!:1 | wc -l'

  alias grep       '/usr/bin/grep  -n --color=auto'
  alias egrep      '/usr/bin/egrep -n --color=auto'
  alias fgrep      '/usr/bin/fgrep -n --color=auto'

  alias date       "/bin/date    '+%A %B %d, %Y    %I:%M:%S %p'"
  alias utc        "/bin/date -u '+%Y-%m-%d %H:%M:%S'"

  alias less       '/usr/bin/less -M'
  alias ping       '/sbin/ping -c5'
  alias quit       'exit'     # exit is a builtin

  alias awk        '/usr/bin/awk'
  alias sed        '/usr/bin/sed'

  # OS specific settings
  switch (`uname`)
    case Darwin:
      breaksw
    case FreeBSD:
      breaksw
  endsw
endif
