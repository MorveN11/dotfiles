set -gx PNPM_HOME "/home/morven/.local/share/pnpm"
if not contains -- $PNPM_HOME $PATH
    set -gx PATH $PNPM_HOME $PATH
end
