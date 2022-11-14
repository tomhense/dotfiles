// Override 0403 to enable binary checks not in safe browsing lists
user_pref("browser.safebrowsing.downloads.remote.enabled", true);

// Override 0801 to enable searching from url bar
user_pref("keyword.enabled", true);

// Override 1601 to use default cross origin referers setting
user_pref("network.http.referer.XOriginPolicy", 0);

// Override 2022 to enable drm
//user_pref("media.eme.enabled", true);

// Override 4520 to enable WebGL
user_pref("webgl.disabled", false);

// Override 4501 to disable Resist Fingerprinting feature
//user_pref("privacy.resistFingerprinting", false);

// Override 4504 to disable letterboxing
user_pref("privacy.resistFingerprinting.letterboxing", false);

// Override 5009 to disable open with option in download dialog
user_pref("browser.download.forbid_open_with", true);

// Override 5010 to disable url bar suggetions
user_pref("browser.urlbar.suggest.topsites", false);

// Override to enable session restore
user_pref("browser.startup.page", 3);  // 0102
user_pref("browser.privatebrowsing.autostart", false);  // 0110 required if you had it set as true
user_pref("browser.sessionstore.privacy_level", 0);  // 1003 optional to restore cookies/formdata
user_pref("privacy.clearOnShutdown.history", false);  // 2811

// Enable hardware acceleration
//user_pref("media.ffmpeg.vaapi.enabled", true);

// Customize where new tabs are located in the tab bar
user_pref("browser.tabs.insertAfterCurrent", true);  // Open Related Tabs Next to Current, Others at the End of the Bar (default is false)
user_pref("browser.tabs.insertRelatedAfterCurrent", true);  // Open All Tabs Next to Current (default is true)

// Allow userChrome/userContent
user_pref("toolkit.legacyUserProfileCustomizations.stylesheets", true);

// Disable chrome animations
user_pref("ui.prefersReducedMotion", 1);

// Enable "Find As You Type"
user_pref("accessibility.typeaheadfind", true); 

// Disable autocopy default [LINUX]
user_pref("clipboard.autocopy", false);

// Remove annoying firefox home content
user_pref("browser.newtabpage.activity-stream.feeds.section.topstories", false); // Recommended by Pocket
user_pref("browser.newtabpage.activity-stream.section.highlights.includePocket", false);

// HTML5 media autoplay settings
// [NOTE] You can set exceptions under site permissions
// 0=Allow all, 1=Block non-muted media (default), 5=Block all
user_pref("media.autoplay.default", 0);

// Override to disable autoplay if you interacted with the site
// 0=sticky (default), 1=transient, 2=user
user_pref("media.autoplay.blocking_policy", 2);

// Customize backspace behavior
// 0=previous page, 1=scroll up, 2=do nothing
user_pref("browser.backspace_action", 2); 

// disable Ctrl-Q quit shortcut [LINUX] [MAC]
user_pref("browser.quitShortcut.disabled", true); 

// disable default browser check on startup
user_pref("browser.shell.checkDefaultBrowser", false); 

// keep the window open after closing the last tab
//user_pref("browser.tabs.closeWindowWithLastTab", false);

// open bookmarks in a new tab
user_pref("browser.tabs.loadBookmarksInTabs", true);

user_pref("browser.urlbar.decodeURLsOnCopy", true); // see bugzilla 1320061

// middle-click enabling auto-scrolling [DEFAULT: false on Linux]
user_pref("general.autoScroll", true); 

// disable alt key toggling the menu bar [RESTART]
user_pref("ui.key.menuAccessKey", 0);

// view "page/selection source" in a new window
user_pref("view_source.tab", false); 

// Disable Pocket Account
user_pref("extensions.pocket.enabled", false); 

// enforced extension signing (Nightly/ESR)
user_pref("xpinstall.signatures.required", false); 

// Disable native gtk window titlebar
user_pref("browser.tabs.inTitlebar", 1);

// High dpi settings
//user_pref("layout.css.devPixelsPerPx", 1.0);

// Don't allow webpages to use their own fonts
user_pref("browser.display.use_document_fonts", 1.0);

