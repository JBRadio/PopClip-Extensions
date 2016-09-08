# PopClip Extensions

Here, I will try to post extensions that I've created and perhaps link to some noteworthy ones outside of the [PopClip Extensions](http://pilotmoon.com/popclip/extensions/) page.


# HTML Notepad.popclipext

If you open a new tab and execute the following in the address bar, you can make the current HTML document editable (basically we are using the Data :

data:text/html, &lt;html contenteditable&gt;

Also:

data:text/html,&lt;textarea style='font-size: 1.5em; width: 100%; height: 100%; border: none; outline: none;' placeholder='Type here' autofocus /&gt;

Others have made additional features like syntax highlighting, etc. This PopClip extension only uses the very basic of features (see the textarea example above).

##Benefits:

* Repurpose an application you are already using, the browser, to be a simple notetaking application.
* Save extension/add-on bar space for more functional items.
* Works with PopClip!

## Known Issue(s)

### Firefox & NoScript and/or blocking Data: in Address Bar
This extension may not work properly in Firefox if "NoScript" is active and no user interaction has been performed. This is due to NoScript blocking Data URI execution. You will likely see this message:

javascript: and data: URIs typed or pasted in the address bar are disabled to prevent social engineering attacks.
Developers can enable them for testing purposes by toggling the "noscript.allowURLBarJS" preference.

I assure you, there are no attaacks here. See the above lines to see what gets posted to the address bar.

##Credits:

I am not the original person who found out this trick however the code is standard and should work in most, if not all, browsers. I first found it on Coderwall.com.

Links:

* ["One line browser notepad" from Coderwall.com](https://coderwall.com/p/lhsrcq/one-line-browser-notepad)
* [Data URIs explained](https://www.nczonline.net/blog/2009/10/27/data-uris-explained/)