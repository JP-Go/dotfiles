#!/usr/bin/env python3

from shutil import move, which
import shlex
from termcolor import cprint
from subprocess import Popen, PIPE
from sys import stderr
from pathlib import Path

KNOWN_PMS_CMDS = {
        'dnf': {'i': 'install','r':'check-update'},
        'pacman' : {'i': '-S','r':'-Syy'},
        'apt' : {'i': 'install','r':'update'},
        }

def log_error(message:str):
    cprint("[ERROR]:",color="red",attrs=["bold"],end=" ",file=stderr)
    cprint(message,color='white',attrs=['bold'],file=stderr)

def interpolate_pm(pm: str, package:'str' ,install_cmd_table: dict[str,dict[str,str]] = KNOWN_PMS_CMDS):
    return f"sudo {pm} {install_cmd_table[pm]['i']} {package}"

if __name__ == "__main__":
    pm = input("Which package manager i'm using (executable name)? ")
    cprint('Refreshing package manager repos', color='green')
    refresh_stats = Popen(shlex.split(f"sudo {pm} {KNOWN_PMS_CMDS[pm]['r']}")).wait()
    if not refresh_stats == 0:
        log_error("Could not refresh package manager repo. Stopping")
        exit(1)

    if not which('git'):
        log_error("Git not installed")
        exit(1)
    cprint('Getting neovim setup', color='green')

    try:
        Path('~/.config/nvim').expanduser().mkdir()
    except FileExistsError:
        cprint('Directory already exists. Skipping making it', color='yellow')

    cprint('Getting alacritty terminal emulator', color='green')
    get_alacritty = Popen(shlex.split(interpolate_pm(pm,'alacritty'))).wait()
    if get_alacritty != 0:
        log_error('Could not install alacritty')

    cprint('Getting nvim setup', color='green')
    get_nvim = Popen(['git','clone','https://www.github.com/JP-Go/nvim',Path('~/.config/nvim').expanduser().absolute()]).wait()
    install_nvim = Popen(shlex.split(interpolate_pm(pm,'neovim'))).wait()
    if not get_nvim or not install_nvim:
        log_error("Could not setup nvim correctly")

    cprint('Getting volta.sh setup', color='green')
    volta_script = Popen(['curl','https://get.volta.sh'],stdout=PIPE)
    get_volta = Popen(['bash','-s','--'],stdin=volta_script.stdout)
    volta_script.wait()
    volta_status = get_volta.wait()
    cprint(f'Downloading rofi with {pm} package manager', color='green')
    get_rofi = Popen(shlex.split(interpolate_pm(pm,'rofi'))).wait()
    if get_rofi != 0:
        log_error('Could not get rofi')

    extra_packages = input('What other packages I want to install (space separated)')
    get_extra_packages = Popen(interpolate_pm(pm,extra_packages)).wait()
    if get_extra_packages != 0:
        log_error('Could not get extra packages')

    cprint('Downloading node and pnpm')
    if volta_status != 0:
        log_error("Could not get volta")
    else:
        Popen(['volta','install','node','pnpm']).wait()

    cprint('Downloading nerd font',color='green')
    fonts_path = Path('~/.local/share/fonts/').expanduser().absolute()
    fonts_path.mkdir(exist_ok=True)
    nerd_font = Popen(shlex.split('wget https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip')).wait()
    if nerd_font != 0:
        log_error("Could not download font")
    else:
        Path('JetBrainsMono').mkdir()
        Popen(shlex.split('unzip -d JetBrainsMono JetBrainsMono.zip')).wait()
        move('JetBrainsMono', fonts_path)

    cprint('Linking paths',color='green')
    link_packages = Popen(['bash','./link.sh']).wait()
