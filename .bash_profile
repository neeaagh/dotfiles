#  ---------------------------------------------------------------------------
#  Joe Giancaspro BASH Profile
#  ---------------------------------------------------------------------------

# load the dotfiles
for file in ~/.{aliases,colors,exports}; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

#   Prompt that includes user, present dir, git branch
#   ------------------------------------------------------------

		print_before_prompt() {
      printf "\n$txtltblu%s: $txtylwgrn%s %s \n$txtrst" "$USER" "$PWD" "$(git_status)"
		}

    git_status() {
      local git_status="$(git status 2> /dev/null)"
      local branch_matcher="On branch ([^${IFS}]*)"
      local icon=""
      local color=$txtrst

      if [[ $git_status =~ "Changes not staged" ]]; then
        color=$txtred
        icon=$x_mark
      elif [[ $git_status =~ "Changes to be committed" ]]; then
        color=$txtylw
      elif [[ $git_status =~ "working directory clean" ]]; then
        color=$txtgrn
        icon=$checkmark
      elif [[ $git_status =~ "Untracked files" ]]; then
        color=$txtcyn
      fi
      if [[ $git_status =~ $branch_matcher ]]; then
        local branch=${BASH_REMATCH[1]}
        printf "$color[$branch$icon]$txtrst"
      fi
    }

    PROMPT_COMMAND=print_before_prompt
    PS1="->"

#   -----------------------------
#   ENVIRONMENT VARIABLES
#   -----------------------------

		export PATH=/Users/joe/bin:/Applications/Postgres.app/Contents/Versions/9.3/bin:/Users/joe/.cargo/bin:$PATH
   
# load git promt script
source ~/.git-prompt.sh

# ensure rbenv is loaded
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# NVM
source $(brew --prefix nvm)/nvm.sh

# Free up C-s
stty -ixon
