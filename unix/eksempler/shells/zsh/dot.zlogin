#-----------------------------------------------------------------------------
# Zsh start up sequence:
#
# 1) /etc/zshenv   (login + interactive + other)
# 2)   ~/.zshenv   (login + interactive + other)
# 3) /etc/zprofile (login)
# 4)   ~/.zprofile (login)
# 5) /etc/zshrc    (login + interactive)
# 6)   ~/.zshrc    (login + interactive)
# 7) /etc/zlogin   (login)
# 8)   ~/.zlogin   (login)
#
# This file: ~/.zlogin (8)
#
#-----------------------------------------------------------------------------
#--  Set window title:

titel ${HOST}

#-----------------------------------------------------------------------------
#--  Keep an eye on people:

watch=(1 alstrom  any \
         berntsen any \
         bhansen  any \
         fenger   any \
         hoeyer   any \
         jenseniu any \
         kjldgrd  any \
         levinsen any \
         norrelyk any \
         nilsson  any \
         nygard   any \
         okkels   any \
         rachid   any \
         schroder any \
         villaume any \
         zaccarin any )

#-----------------------------------------------------------------------------
#--  Earlier logins:

last sparre | head -n 5

#-----------------------------------------------------------------------------
#--  Activate the "Compose" key:

if [ -r "${HOME}/.xmodmaprc" ]; then
   xmodmap ${HOME}/.xmodmaprc
fi

#-----------------------------------------------------------------------------
