#  ---------------------------------------------------------------------------
#  Joe Giancaspro BASH Profile
#  ---------------------------------------------------------------------------

# load the dotfiles
for file in ~/.{aliases,colors}; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

#   -------------------------------
#   Color Variables
#   -------------------------------

		txtblk='\e[0;30m' # Black - Regular
		txtred='\e[0;31m' # Red
		txtgrn='\e[0;32m' # Green
		txtylw='\e[0;33m' # Yellow
    txtylwgrn='\e[40;38;5;82m' # yellow green
		txtblu='\e[0;34m' # Blue
		txtltblu='\e[30;38;5;33m' # Light Blue
		txtpur='\e[0;35m' # Purple
		txtcyn='\e[0;36m' # Cyan
		txtwht='\e[0;37m' # White

		bldblk='\e[1;30m' # Black - Bold
		bldred='\e[1;31m' # Red
		bldgrn='\e[1;32m' # Green
		bldylw='\e[1;33m' # Yellow
		bldblu='\e[1;34m' # Blue
		bldpur='\e[1;35m' # Purple
		bldcyn='\e[1;36m' # Cyan
		bldwht='\e[1;37m' # White

		unkblk='\e[4;30m' # Black - Underline
		undred='\e[4;31m' # Red
		undgrn='\e[4;32m' # Green
		undylw='\e[4;33m' # Yellow
		undblu='\e[4;34m' # Blue
		undpur='\e[4;35m' # Purple
		undcyn='\e[4;36m' # Cyan
		undwht='\e[4;37m' # White

		bakblk='\e[40m'   # Black - Background
		bakred='\e[41m'   # Red
		badgrn='\e[42m'   # Green
		bakylw='\e[43m'   # Yellow
		bakblu='\e[44m'   # Blue
		bakpur='\e[45m'   # Purple
		bakcyn='\e[46m'   # Cyan
		bakwht='\e[47m'   # White

		txtrst='\e[0m'    # Text Reset

    checkmark='\xe2\x9c\x94'
    x_mark='\xe2\x9c\x95'

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

		export RACK_ENV='development'
		export BULLET_STATUS='false'
    export RMP_STATUS='true'
		export PGHOST=localhost

		export PATH=/Users/joe/bin:/Applications/Postgres.app/Contents/Versions/9.3/bin:/Users/joe/.cargo/bin:$PATH
   
# load git promt script
source ~/.git-prompt.sh

# ensure rbenv is loaded
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# NVM
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh

# Free up C-s
stty -ixon
