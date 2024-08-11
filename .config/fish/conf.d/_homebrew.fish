set -gx HOMEBREW_PREFIX "/home/linuxbrew/.linuxbrew"
set -gx HOMEBREW_CELLAR "/home/linuxbrew/.linuxbrew/Cellar"
set -gx HOMEBREW_REPOSITORY "/home/linuxbrew/.linuxbrew/Homebrew"
fish_add_path -gP "/home/linuxbrew/.linuxbrew/bin" "/home/linuxbrew/.linuxbrew/sbin"
set -q MANPATH; and set MANPATH[1] ":$(string trim --left --chars=":" $MANPATH[1])"
! set -q INFOPATH; and set INFOPATH ''
set -gx INFOPATH "/home/linuxbrew/.linuxbrew/share/info" $INFOPATH
