konsole-autodarkmode() {
	# When using konsole, activate auto theme script
	if [ "$KONSOLE_DBUS_WINDOW" ]; then
		if [ "$(detect-darkmode)" = 'light' ]; then
			konsole-theme -s KonsoleLight
		else
			konsole-theme -s KonsoleDark
		fi
	fi
}

konsole-autodarkmode

