#!/bin/bash
. $HOME/.homesick/repos/dotfiles/bash/rc

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[ -f /home/ubuntu/n/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.bash ] && . /home/ubuntu/n/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.bash
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[ -f /home/ubuntu/n/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.bash ] && . /home/ubuntu/n/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.bash