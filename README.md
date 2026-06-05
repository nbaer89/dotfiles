Bootstrap
Debian / Ubuntu / WSL

Install dependencies

```
sudo apt update && sudo apt install -y curl git
```

Install chezmoi:

```
sh -c "$(curl -fsLS get.chezmoi.io)"
```

Initialize:

```
chezmoi init --apply https://github.com/nbaer89/dotfiles.git
```

Updating

Pull latest configuration:

```
chezmoi update
```

Preview changes:

```
chezmoi diff
```

Apply changes:

```
chezmoi apply
```
