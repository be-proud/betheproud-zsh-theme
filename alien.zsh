#!/usr/bin/env zsh

THEME_ROOT=${0:A:h}

source "${THEME_ROOT}/modules/init.zsh"

source "${THEME_ROOT}/libs/promptlib/activate"
source "${THEME_ROOT}/libs/zsh-async/async.zsh"
source "${THEME_ROOT}/libs/zsh-256color/zsh-256color.plugin.zsh"

source "${THEME_ROOT}/modules/theme.zsh"
source "${THEME_ROOT}/modules/sections.zsh"
source "${THEME_ROOT}/modules/prompt.zsh"
source "${THEME_ROOT}/modules/system.zsh"
source "${THEME_ROOT}/modules/git.zsh"
source "${THEME_ROOT}/modules/hg.zsh"
source "${THEME_ROOT}/modules/svn.zsh"
source "${THEME_ROOT}/modules/async.zsh"
source "${THEME_ROOT}/modules/python.zsh"

function precmd(){
  autoload -U add-zsh-hook
  setopt prompt_subst
  alien_load_theme

  RPROMPT=''
  if [[ ${PROMPT} == "" ]] || [[ ${ALIEN_KEEP_PROMPT} != 1 ]]; then
    PROMPT=$(alien_prompt_render)
  fi
  alien_async_prompt
}
