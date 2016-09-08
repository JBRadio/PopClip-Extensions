(*
This script may not work in FireFox if "NoScript" is active and without user interaction:

javascript: and data: URIs typed or pasted in the address bar are disabled to prevent social engineering attacks.
Developers can enable them for testing purposes by toggling the "noscript.allowURLBarJS" preference.


Found/Modified some code by Daring Fireball
http://daringfireball.net/2009/01/applescripts_targetting_safari_or_webkit

1.) Get the active browser or default browser or fall back to Safari
2.) Activate the browser in case it is not
3.) Open a new tab
4.) Create unique URL to make tabbed document editable (appears to be standard browser code)
5.) Paste {popclip text}

*)

set _browserList to {"Google Chrome", "Chrome", "Mozilla Firefox", "Firefox", "Safari"}
set _browser to ""
set _popClipText to "{popclip text}"

--if _popClipText then
# 1.) Get the browser (active browser then default browser then fall back to Safari)
set _browser to GetCurrentApp()
if _browser is not in _browserList then
	set _browser to GetDefaultWebBrowser()
	if _browser is not in _browserList then
		set _browser to "Safari"
	end if
end if

# 2.) Activate the browser in case it is not currently
tell application _browser
	activate
	
	tell application "System Events"
		# 3.) Open a new tab in browser
		keystroke "t" using command down -- opens new tab with cursor in addressbar
		
		# 4.) Update newtab URL to make tab editable
		-- Use clipboard to speed up URL write to Address bar --
		set oldClipboard to the clipboard
		set the clipboard to "data:text/html,<textarea style='font-size: 1.5em; width: 100%; height: 100%; border: none; outline: none;' placeholder='Type here' autofocus />"
		delay 0.1
		keystroke "v" using command down -- Clipboard paste
		delay 1 -- Wait for paste from clipboard
		keystroke return
		delay 0.5 -- Need some time after enter for cursor to appear for input
		
		# 5.) Paste {popclip text}
		keystroke "{popclip text}"
		set the clipboard to oldClipboard
		
	end tell
end tell
--end if


-- Subroutines --

on GetCurrentApp()
	tell application "System Events" to get name of first process whose frontmost is true
end GetCurrentApp

on GetDefaultWebBrowser()
	-- First line of _scpt is a workaround for Snow Leopard issues
	-- with 32-bit Mac:: Carbon modules
	set _scpt to "export VERSIONER_PERL_PREFER_32_BIT=yes; " & "perl -MMac::InternetConfig -le " & "'print +(GetICHelper \"http\")[1]'"
	return do shell script _scpt
end GetDefaultWebBrowser