# dotfiles

- [WSL2](https://docs.microsoft.com/en-us/windows/wsl/install-manual)

run in powershell as administer

```
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
wsl --set-default-version 2
```

- [Arch WSL](https://github.com/yuk7/ArchWSL/releases)

```
pacman-key --init
pacman-key --populate
```

- [Nerd Font](https://github.com/ryanoasis/nerd-fonts/releases)
