# First, create your repo in your Github account.
# This newly created repo must be empty. This script
# file will initialize your empty repo with a README.md.

GIT_CMD=git
GIT_BRN=main
GIT_RPO=Auto-Committer

# Put your git credentials here. Change it based on you
# Git account.

GIT_USR=engrron30
GIT_EML=ronaldtorresrosete30@gmail.com

echo "# $GIT_RPO" >> README.md
$GIT_CMD init
$GIT_CMD add README.md
$GIT_CMD commit -m "first commit"
$GIT_CMD branch -M $GIT_BRN
$GIT_CMD remote add origin git@github.com:$GIT_USR/$GIT_RPO
$GIT_CMD push -u origin $GIT_BRN
