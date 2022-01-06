#!/usr/bin/sh
# ███╗   ██╗███████╗██╗  ██╗███╗   ██╗
# ████╗  ██║██╔════╝╚██╗██╔╝████╗  ██║
# ██╔██╗ ██║█████╗   ╚███╔╝ ██╔██╗ ██║
# ██║╚██╗██║██╔══╝   ██╔██╗ ██║╚██╗██║
# ██║ ╚████║███████╗██╔╝ ██╗██║ ╚████║
# ╚═╝  ╚═══╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═══╝
#
# Twitter : https://twitter.com/itsnexn
# Github  : https://github.com/Itsnexn
# Website : Itsnexn.me
#
# MIT License

# Vars
RED="\033[1;31m"
YELLOW="\033[1;33m"
GREEN="\033[1;32m"
RES="\033[0m"

export NEWT_COLORS="
    window=,black
    entry=white,gray
    border=red,black
    textbox=white,black
    button=green,gray
    shadow=,gray
    root=,blue
    checkbox=white,black
"

Pakages=(
    "python3"               # Python scripting language
    "python2"               # Older version of python (required by some scripts)
    "nodejs"                # Run time javascript
    "apache"                # Apache the webserver
    "jq"                    # CLI json parser
    "php"
    "mysql"
)

Cli=(
    "starship"              # Interactive prompt written in rust
    "nvim"                  # The editor
    "exa"                   # LS replacement
    "tmux"                  # Terminal split stuff
    "zsh"                   # The Z shell
    "ranger"                # TUI file manager
    "ueberzug"              # Image preview in terminal
    "pulsemixer"            # TUI mixer
    "blueman-tray"          # Bluetooth system tray icon
    "bluez"                 # Bluetooth
    "bluez-utils"           # bluetoothctl
)
Gui=(
    "picom-jonaburg-git"    # A lightweight compositor for X11
    "alsa-utils"            # Advanced Linux Sound Architecture
    "xkb-switch-git"        # Changing kbd layouts
    "nitrogen"              # Wallpaper changer
    "nautilus"              # File manager
    "lxappearance"          # style configuration tool
    "rofi"                  # Application menu
    "rofi-emoji"            # emoji script for rofi
)

Pwntools=(
    # General
    "exploit-db"            # Offensive security exploit database
    "openvpn"               # open VPN client
    "android-sdk"           # Android stuff like: adb, fastboot and ...
    "set"                   # Social engineering toolkit
    "tor"                   # The onion router
    "tor-browser-en"        # onion router browser
    "spooftooph"            # Bluetooth spoofing or cloning
    "seclists"              # List of security wordlists

    # Wireless
    "aircrack-ng"           # Wireless attack tools
    "wifite2"               # WEP and WPA attack tool

    # Network
    "enum4linux"            # enumerating windows and samba systems
    "enum4linux-ng"         # Next generation of enum4linux
    "nmap"                  # Network map
    "ettercap"              # sniffer/interceptor/logger
    "rustscan"              # Faster portscanner then nmap

    # Web
    "sqlmap"                # SQL injection automation tool
    "dirb"                  # Directory bruteforce
    "ffuf"                  # Web fuzzer in go
    "wfuzz"                 # Web fuzzer
    "hydra"                 # Logon cracker/bruteforcer
    "nikto"                 # Web server scanner
    "pwncat-caleb"          # Post exploitation platform
    "pwntools"              # Python Pwn library
    "sublist3r"             # Sub domain enumration tool
    "webshells"             # Web backdors
    "wireshark-cli"         # Network traffic and protocol analyzer/sniffer CLI
    "wireshark-qt"          # Network traffic and protocol analyzer/sniffer GUI
    "wpscan"                # Blackbox wordpress scanner
    "xss-freak"             # XSS automation tool in python
    "zaproxy"               # OWASP Zap proxy
    "burpsuite"

    # Stego
    "zsteg"                 # stego tool
    "steghide"              # Embed message in file
    "stegseek"              # Stego tool
    "stegsolve"             # Stego bruteforcer
    "stegcracker"           # Stego bruteforcer

    # Cracking
    "john"                  # John the ripper
    "johnny"                # Gui for john
    "hash-buster"           # online hash cracker scraper
    "hash-identifier"       # identify type of hash
    "hashcat"               # World's fastest password cracker
    "hate-crack"            # automating cracking methodologies using Hashcat

    # Binary
    "binwalk"               # search given file for embedded files
    "strace"                # Trace system calls and signals
    "ltrace"                # Tracks runtime library calls in dynamically linked programs
    "gdb"                   # GNU debugger
    "radare2"               # disasm, debug, analyze and manipulate binary files
)

function print(){
    printf "$GREEN>>>$RES $@\n"
}

function err(){
    printf "$RED>>>$RES $@\n"
}

function warn(){
    printf "$YELLOW>>>$RES $@\n"
}

if [[ $USER == "root" ]]; then
    err "Please run script with normal user!"
    exit 1
fi

if ! [ -x "$(command -v yay)" ]; then
    printf "$YELLOW>>>$RES You do not have yay installed. want to install it? [Y]es [N]o: "
    read -n 1 ans
    printf "\n"
    while true; do
    case $ans in
        y|Y)
            warn "Cloning the yay repo in /tmp/yay"
            git clone --quiet https://aur.archlinux.org/yay-git.git /tmp/yay || \
                err "Error while cloning the repo!" && exit 1
            cd /tmp/yay
            makepkg -si
            break;;
        n|N)
            err "Aborting"
            break;;
        *)
            err "Invalid option"
    esac
    done
fi

warn "Updating local Pakages database..."
sudo yay -Sy && print "DONE!" || err "UPDATE FAILED" && exit 1

value=(
    "Cli"       "Command line utils"     "off" 
    "Gui"       "Gui utils"              "off" 
    "Pakages"   "General tools"          "off"
    "Pwntools"  "CTF and security tools" "off"
)

Install=("$(whiptail --checklist "Choose item you want to install" 20 50 10 "${value[@]}" 3>&1 1>&2 2>&3 3>&- | xargs)")

for i in $Install; do
    eval "yay -S \${$i[@]}"
done
