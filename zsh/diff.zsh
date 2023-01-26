if which colordiff &> /dev/null; then
  alias diff='colordiff -u'
else
  alias diff='diff -u'
fi
