. $(brew --prefix)/etc/environment
export all_proxy="$(cat $(brew --prefix)/etc/proxy)"
launchctl setenv all_proxy "$all_proxy"
export JAVA_HOME
launchctl setenv JAVA_HOME "$JAVA_HOME"
export SSL_CERT_FILE
launchctl setenv SSL_CERT_FILE "$SSL_CERT_FILE"
#export all_proxy=""
