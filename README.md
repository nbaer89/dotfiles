Bootstrap
Debian / Ubuntu / WSL

Install chezmoi:

sh -c "$(curl -fsLS get.chezmoi.io)"

Initialize:

chezmoi init --apply git@github.com:nbaer89/dotfiles.git
Updating

Pull latest configuration:

chezmoi update

Preview changes:

chezmoi diff

Apply changes:

chezmoi apply
