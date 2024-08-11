if status is-interactive && test -f ~/.config/fish/custom/git_fzf.fish
    source ~/.config/fish/custom/git_fzf.fish
    git_fzf_key_bindings
end
