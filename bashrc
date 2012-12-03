
PS1="\n\`if [ \$? = 0 ]; then echo \[\e[32m\]; else echo \[\e[31m\]-\$?-\\  ; fi\`\@ \u@\h:\w\[\e[0m\]\n\\$ "

function mdl {
  export DISPLAY=:0
}

function mdr {
  export DISPLAY=localhost:10.0
}
