#!/usr/bin/sh
#  __     ______   ______     __   __     ______     __  __     __   __
# /\ \   /\__  _\ /\  ___\   /\ \-.\ \   /\  ___\   /\_\_\_\   /\ "-.\ \
# \ \ \  \/_/\ \/ \ \___  \  \ \ \-.  \  \ \  __\   \/_/\_\/_  \ \ \-.  \
#  \ \_\    \ \_\  \/\_____\  \ \_\\"\_\  \ \_____\   /\_\/\_\  \ \_\\"\_\
#   \/_/     \/_/   \/_____/   \/_/ \/_/   \/_____/   \/_/\/_/   \/_/ \/_/
#
# Twitter : https://twitter.com/itsnexn
# Github : https://github.com/Itsnexn
# License : MIT

# Vars
RED="\033[1;31m"
YELLOW="\033[1;33m"
GREEN="\033[1;32m"
NOCOLOR="\033[0m"

# CFG
cfg(){
while true; do
    printf "\n${YELLOW}Install config? ([y]es / [n]o / [r]emove)${NOCOLOR}";
    read -n 1 ans;
    case $ans in
        y|Y)
            printf "${YELLOW}\nCloning the git repo :)\n${NOCOLOR}";
            git clone https://github.com/Itsnexn/Dotfiles.git /tmp/ItsnexnDots
            [[ -d "$HOME/.config" ]] && \
            printf "${RED}\nBackup the old config directory!${NOCOLOR}" && \
                cp "$HOME/.config" $HOME/.config_bak;
            printf "${RED}\nIF YOU WANT YOU TO RESTORE YOUR CONFIG, DONT REMOVE $(printenv HOME)/.config_bak DIRECTORY!\n${NOCOLOR}";
            
            # mv new config to $HOME
            printf "${YELLOW}\nMoving Files\n${NOCOLOR}";
            cd /tmp/ItsnexnDots;
            printf "${GREEN}\nDone!\n\n${NOCOLOR}";
            break;;
        n|N)
            break;;
        r|R)
            rm -rf "$HOME/.config" && mv "$HOME/.config_bak" "$HOME/.config";;
        *)
            printf "${RED}\nI do not understand!\n${NOCOLOR}";;
    esac
done
}


yay(){
while true; do
    printf "${YELLOW}\nInstall Yay and BlackArch repo? (y/n)${NOCOLOR}";
    read -n 1 ans;
    case $ans in
        y|Y)
            printf "${YELLOW}\nStarting to Download\n${NOCOLOR}";
            if ! command -v git &> /dev/null
            then
                printf "${RED}\nYou dont have git install utilities or install git manully"
                break
            else 
                cd /opt
                sudo git clone https://aur.archlinux.org/yay.git && \
                    chown $USER:$USER /opt/yay && \
                    makepkg -si && \
                cd /tmp
                wget https://blackarch.org/strap.sh
                echo 46f035c31d758c077cce8f16cf9381e8def937bb strap.sh | sha1sum -c && \
                    chmod +x strap.sh && \
                    sudo ./strap.sh && \
                    sudo pacman -Syu
                    printf "${GREEN}\nDone!\n\n${NOCOLOR}";
            fi
            break;;
        n|N)
            break;;
        *)
            printf "${RED}\nI do not understand!\n${NOCOLOR}";;
    esac
done
}


# base-devel
devel(){
while true; do
    printf "${YELLOW}\nInstall Basic dev tools (y/n)${NOCOLOR}";
    read -n 1 ans;
    case $ans in
        y|Y)
            printf "${YELLOW}\nStarting to Download\n${NOCOLOR}";
            sudo pacman -S autoconf binutils bison fakeroot file findutils flex gawk gcc \
                gettext grep groff gzip libtool m4 make patch pkgconf sed texinfo which
            printf "${GREEN}\nDone!\n\n${NOCOLOR}";
            break;;
        n|N)
            break;;
        *)
            printf "${RED}\nI do not understand!\n${NOCOLOR}";;
    esac
done
}


# utils
shell(){
while true; do
    printf "${YELLOW}\nInstall terminal utilities? (y/n)${NOCOLOR}";
    read -n 1 ans;
    case $ans in
        y|Y)
            printf "${YELLOW}\nStarting to Download\n${NOCOLOR}";
            sudo pacman -S git nvim exa tmux pulsemixer xkb-switch-git xkblayout-state-git \
                ranger curl wget openvpn htop bashtop cmatrix starship python3 python2 \
                nodejs apache
            printf "${GREEN}\nDone!\n\n${NOCOLOR}";
            break;;
        n|N)
            break;;
        *)
            printf "${RED}\nI do not understand!\n${NOCOLOR}";;
    esac
done
}


wm(){
while true; do
    printf "${YELLOW}\nInstall WindowManager tools (y/n)${NOCOLOR}";
    read -n 1 ans;
    case $ans in
        y|Y)
            printf "${YELLOW}\nStarting to install pakages...\n${NOCOLOR}";
            sudo pacman -S picom-jonaburg-git blueman-tray bluez bluez-utils nitrogen \
               dunst network-manager-applet Nautilus lxappearance rofi rofi-emoji ueberzug
            printf "${GREEN}\nDone!\n\n${NOCOLOR}";
            break;;
        n|N)
            break;;
        *)
            printf "${RED}\nI do not understand!\n${NOCOLOR}";;
    esac
done
}


h4x() {
while true; do
    printf "${YELLOW}\nInstall H4x tools (y/n)${NOCOLOR}";
    read -n 1 ans;
    case $ans in
        y|Y)
            printf "${YELLOW}\nStarting to install pakages...\n${NOCOLOR}";
            yay -S aircrack-ng android-sdk androidpincrack android-apktool \
                armitage arp-scan autopwn autosint autosploit backcookie backdoor-apk \
                binwalk blindsql bluescan brute-force btcrack cheat-sh cook crabstick \
                enum4linux ctf-party dalfox dirbuster dirb dnsenum dorknet enum4linux-ng \
                evilpdf exploit-db ffuf ffuf-scripts firefox-security-toolkit ftp-fuzz \
                ftp-scanner gdbgui git-dump hackrf hash-buster hash-identifier hashcat \
                hashcat-utils hashfind hate-crack hopper http-fuzz hulk hydra john \
                johnny jwt-tool l0l lfi-autopwn lfi-exploiter lfi-scanner \
                linux-exploit-suggester.sh list-urls lulzbuster malware-check-tool \
                netmap nikto opendoor packit pwcrack pwncat-caleb pwned pwntools \
                raccoon radare2 rarcrack rdp-sec-check rtfm rustscan search1337 \
                seclists set shellcode-compiler shellcode-factory subfinder sublist3r \
                tell-me-your-secrets tor tor-browser-en webshells wfuzz wifi-autopwner \
                wifibroot wifiphisher wifite wifite2 wifijammer wireshark-cli wireshark-qt \
                wordlistctl wpforce wordpresscan wpscan xorbruteforcer xss-freak \
                zaproxy zsteg steghide stegseek stegsolve sqlmap strace ltrace \
                gdb proxychains-ng stegcracker spooftooph jq fern-wifi-cracker \
                ettercap bsd-games burpsuite
            printf "${GREEN}\nDone!\n\n${NOCOLOR}";
            break;;
        n|N)
            break;;
        *)
            printf "${RED}\nI do not understand!\n${NOCOLOR}";;
    esac
done
}


mainMenu() {
printf "${YELLOW}\n
1) Install config
2) Install Yay aur helper and blackarch repo
3) Install terminal tools
4) Install window manager utilities
5) install h4x tools
q) EXIT

=> ${NOCOLOR}"
}


banner() {
# Banner
printf "${RED}
  __     ______   ______     __   __     ______     __  __     __   __
 /\ \   /\__  _\ /\  ___\   /\ \-.\ \   /\  ___\   /\_\_\_\   /\ \"-.\ \\
 \ \ \  \/_/\ \/ \ \___  \  \ \ \-.  \  \ \  __\   \/_/\_\/_  \ \ \-.  \\
  \ \_\    \ \_\  \/\_____\  \ \_ \\\\\"\_\  \ \_____\   /\_\/\_\  \ \_\\\\\" \_\\
   \/_/     \/_/   \/_____/   \/_/ \/_/   \/_____/   \/_/\/_/   \/_/ \/_/
${NOCOLOR}\n"
}


banner;

printf "${RED}Please excute this script with normal user!${NOCOLOR}"
sleep 2

while true; do
    while true; do
        mainMenu;
        read ans;
        case $ans in
            1)
                cfg;
                break;;
            2)
                yay;
                break;;
            3)
                shell;
                break;;
            4)
                wm;
                break;;
            5)
                h4x;
                break;;
            6)
                echo "TEST";
                break;;
            clear)
                clear;
                break;;
            q)
                printf "${RED}\n\tG00d By3 <3\n${NOCOLOR}"
                exit;; 
            *)
                printf "${RED}\nI do not understand!\n${NOCOLOR}";;
        esac
    done
done

