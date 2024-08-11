eval "$(fzf --fish)"

set -gx FZF_DEFAULT_COMMAND "fd --hidden --strip-cwd-prefix --exclude .git"
set -gx FZF_CTRL_T_COMMAND $FZF_DEFAULT_COMMAND
set -gx FZF_ALT_C_COMMAND "fd --type=d --hidden --strip-cwd-prefix --exclude .git"

function _fzf_compgen_path
    fd --hidden --exclude .git . $argv[1]
end

function _fzf_compgen_dir
    fd --type=d --hidden --exclude .git . $argv[1]
end

set -x FZF_DEFAULT_OPTS "--color=fg:#dcd7ba,bg:#1F1F28,hl:#ffa066,fg+:#dcd7ba,bg+:#5c6370,hl+:#ffa066,info:#7fb4ca,prompt:#7aa89f,pointer:#7aa89f,marker:#7aa89f,spinner:#7aa89f,header:#7aa89f"
set -x FZF_CTRL_T_OPTS "--preview 'bat -n --color=always --line-range :500 {}'"
set -x FZF_ALT_C_OPTS "--preview 'exa --tree --color=always {} | head -200'"

function _fzf_comprun
    set command $argv[1]
    set -e argv[1]
    switch "$command"
        case cd
            fzf --preview 'exa --tree --color=always {} | head -200' $argv
        case export
            fzf --preview "eval 'echo '{}" $argv
        case ssh
            fzf --preview 'dig {}' $argv
        case '*'
            fzf --preview "bat -n --color=always --line-range :500 {}" $argv
    end
end
