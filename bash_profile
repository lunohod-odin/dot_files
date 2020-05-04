export CLICOLOR=1
export LSCOLORS=Exfxcxdxbxegedabagacad

alias dev='cd <CHROMIUM SRC>'

alias njc='ninja -j 35 -C out/Default chrome'
alias njb='ninja -j 35 -C out/Default browser_tests'
alias nji='ninja -j 35 -C out/Default interactive_ui_tests'
alias njcu='ninja -j 35 -C out/Default components_unittests'
alias njall='ninja -j 35 -C out/Default chrome browser_tests interactive_ui_tests components_unittests unit_tests'
alias gsgn='gclient sync && gn gen out/Default'
alias gsfgn='gclient sync -f && gn gen out/Default'
alias gp='git pull --rebase origin master'
alias gfr='git fetch && git reset --hard origin/master'

gda() {
    git diff "$1"
    read -p "Add file?" yn
    case $yn in
        [Yy]* ) git add "$1"
    esac
}

ryb() {
    out/Default/Chromium.app/Contents/MacOS/Chromium "$1"
}

rit() {
    out/Default/interactive_ui_tests --gtest_filter="$1" $2
}

rbt() {
    out/Default/browser_tests --gtest_filter="$1" $2
}

rcut() {
    out/Default/components_unittests --gtest_filter="$1" $2
}

alias klcr='killall -KILL chrome_crashpad_handler'

grp() {
    grep --include="$2" -re "$1" .
}

eval "$(direnv hook bash)"

