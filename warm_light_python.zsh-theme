# Warm Light Python Theme
# Based on the warm light Python color scheme

# Colors
local reset='%f'
local black='%F{3C3F4A}'
local red='%F{C44A5B}'
local green='%F{4DAA6B}'
local yellow='%F{DCA72E}'
local blue='%F{609F8E}'
local magenta='%F{9558A3}'
local cyan='%F{8794A1}'
local white='%F{F8F0E8}'


local current_dir='%F{cyan}%~%f'
local git_branch='%F{green}$(git_prompt_info)%f'
local git_status='%F{yellow}$(custom_git_prompt_status)%f'

ZSH_THEME_GIT_PROMPT_PREFIX="("
ZSH_THEME_GIT_PROMPT_SUFFIX=")"
ZSH_THEME_GIT_PROMPT_DIRTY=""
ZSH_THEME_GIT_PROMPT_CLEAN=""

function custom_git_prompt_status() {
  local staged_files=$(git diff --staged --name-only 2>/dev/null | wc -l | tr -d ' ')
  local unstaged_files=$(git diff --name-only 2>/dev/null | wc -l | tr -d ' ')
  local untracked_files=$(git ls-files --others --exclude-standard 2>/dev/null | wc -l | tr -d ' ')
  local conflicted_files=$(git ls-files --unmerged 2>/dev/null | wc -l | tr -d ' ')

  local git_status=""
  if [ $staged_files -gt 0 ]; then
    git_status+="${blue}● ${reset}"
  fi
  if [ $unstaged_files -gt 0 ]; then
    git_status+="${red}✚ ${reset}"
  fi
  if [ $untracked_files -gt 0 ]; then
    git_status+="${green}… ${reset}"
  fi
  if [ $conflicted_files -gt 0 ]; then
    git_status+="${yellow}*conflict* ${reset}"
  fi

  echo $git_status
}

PROMPT="${git_branch}
${current_dir} ${git_status}${white}$ ${reset}"
