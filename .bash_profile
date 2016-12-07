#  ---------------------------------------------------------------------------
#  Joe Giancaspro BASH Profile
#  ---------------------------------------------------------------------------

# load the dotfiles
for file in ~/.{aliases,colors,bash_prompt,exports}; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

export PATH=/Users/joe/bin:/Applications/Postgres.app/Contents/Versions/9.3/bin:/Users/joe/.cargo/bin:$PATH

# load git promt script
source ~/.git-prompt.sh

# ensure rbenv is loaded
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# NVM
source $(brew --prefix nvm)/nvm.sh

# Free up C-s
stty -ixon
