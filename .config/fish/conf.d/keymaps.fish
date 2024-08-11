fish_vi_key_bindings
set -gx fish_cursor_default block
set -gx fish_cursor_insert line
set -gx fish_cursor_replace_one underscore
set -gx fish_cursor_replace underscore
set -gx fish_cursor_external line
set -gx fish_cursor_visual block
set fish_vi_force_cursor 1

bind --mode default dw _delete_word_backward
bind --mode default \cl _end_of_line
bind --mode default \ch _beginning_of_line
bind --mode insert \cc _switch_to_default_mode
bind --mode default \cc _switch_to_insert_mode
