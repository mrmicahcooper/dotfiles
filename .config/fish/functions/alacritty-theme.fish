function alacritty-theme --description "Pick a colorscheme"
    set -l color (ls -1 ~/.config/alacritty/themes/ | fzf)

    cp ~/.config/alacritty/themes/$color \
       ~/.config/alacritty/current-theme.yml

    echo $color
end
