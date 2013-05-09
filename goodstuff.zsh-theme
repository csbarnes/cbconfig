PROMPT='
┌┤%{$fg[cyan]%}%m: %{$fg[yellow]%}$(get_pwd)%{$reset_color%}├$(put_spacing)┐%{$reset_color%}
└$(git_prompt_info)%{$reset_color%}► '

RPROMPT='[%{$fg[yellow]%}%D{%a, %d %b}%{$reset_color%}]─[%{$fg[yellow]%}%*%{$reset_color%}]┘'

function get_pwd()
{
	echo "${PWD/$HOME/~}"
}

function put_spacing()
{
	
	local termwidth
	(( termwidth = ${COLUMNS} - 7 - ${#HOST} - ${#$(get_pwd)}))
	
	local spacing=""
	for i in {1..$termwidth}; do
	    spacing="${spacing}─"
	done
	echo $spacing
}

function git_prompt_info() {
   ref=$(git symbolic-ref HEAD 2> /dev/null) || return
   echo "$(parse_git_dirty)$ZSH_THEME_GIT_PROMPT_PREFIX$(current_branch)$ZSH_THEME_GIT_PROMPT_SUFFIX"
}

ZSH_THEME_GIT_PROMPT_PREFIX="[git:"
ZSH_THEME_GIT_PROMPT_SUFFIX="]%{$reset_color%}─"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}+"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[green]%}"
