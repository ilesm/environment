
To clone locally:

    mkdir ~/code
    cd ~/code
    git clone git@github.com:ilesm/environment.git

Install Salt:

  Mac OS:

    brew install salt

  Ubuntu:

    snap install salt

To configure `nvim`:

    mkdir ~/.config
    ln -s ~/code/environment/nvim ~/.config/nvim

To configure `tmux`:

    ln -s ~/code/environment/tmux/tmux.conf ~/.tmux.conf

`zsh`:

    ln -s ~/code/environment/zsh/zshrc ~/.zshrc
