#  ---------------------------------------------------------------------------
#  Joe Giancaspro BASH Profile
#  ---------------------------------------------------------------------------

# prioritize ~/bin's in PATH
export PATH=$HOME/bin:$PATH

# load the dotfiles
# ~/.path contains PATH extensions and is purposely not committed.
# ~/.extra contains any other settings not intended for commit.
for file in ~/.{path,aliases,colors,bash_prompt,exports,extra}; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;


# ensure rbenv is loaded
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# Free up C-s
stty -ixon
