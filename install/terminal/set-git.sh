# Set common git aliases
git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.ci commit
git config --global alias.st status
git config --global pull.rebase true

git config --global core.editor nvim
git config --global core.pager less --quit-if-one-screen --no-init

git config --global rebase.autosquash true
git config --global rebase.updateRefs true

git config --global rerere.enabled 1

git config --global alias.up = pull --rebase --autostash
git config --global alias.df diff
git config --global alias.lg1 log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)'
git config --global alias.lg2 log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold green)(%ar)%C(reset)%C(bold yellow)%d%C(reset)%n''          %C(white)%s%C(reset) %C(dim white)- %an%C(reset)'
git config --global alias.lg !"git lg1"
git config --global alias.prune-locals !git branch --merged | grep -v \"\\*\" | xargs -n 1 git branch -d
git config --global alias.push-pull-request "!sh -c \"git push -u origin `git rev-parse --abbrev-ref HEAD` && hub pull-request $*\""
git config --global alias.gone ! git fetch -p && git for-each-ref --format '%(refname:short) %(upstream:track)' | awk '$2 == \"[gone]\" {print $1}' | xargs -r git branch -D

git config --global diff.noprefix true
git config --global push.default current
git config --global push.autoSetupRemote true
git config --global help.autoCorrect 1
git config --global init.defaultBranch main
