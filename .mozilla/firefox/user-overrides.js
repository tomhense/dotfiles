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
user_pref("privacy.resistFingerprinting", false);

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
user_pref("media.ffmpeg.vaapi.enabled", true);

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

// Workaround to stop unneeded window repaints on wayland (I think this is fixed now?)
//user_pref("widget.wayland.vsync.enabled", false);

// Enable switching tabs by scrolling in the tabbar (like in chrome)
user_pref("toolkit.tabbox.switchByScrolling", true);

// Enable IPv6 DNS support
user_pref("network.dns.disableIPv6", false);

// Fight system font fingerprinting
user_pref("font.system.whitelist", "Noto Color Emoji,Noto Fangsong KSS Rotated,Noto Fangsong KSS Vertical,Noto Kufi Arabic,Noto Looped Thai,Noto Mono,Noto Music,Noto Naskh Arabic,Noto Naskh Arabic UI,Noto Nastaliq Urdu,Noto Rashi Hebrew,Noto Sans,Noto Sans Adlam,Noto Sans Adlam Unjoined,Noto Sans Anatolian Hieroglyphs,Noto Sans Arabic,Noto Sans Arabic UI,Noto Sans Armenian,Noto Sans Avestan,Noto Sans Balinese,Noto Sans Bamum,Noto Sans Bassa Vah,Noto Sans Batak,Noto Sans Bengali,Noto Sans Bengali UI,Noto Sans Bhaiksuki,Noto Sans Brahmi,Noto Sans Buginese,Noto Sans Buhid,Noto Sans Canadian Aboriginal,Noto Sans Carian,Noto Sans Caucasian Albanian,Noto Sans Chakma,Noto Sans Cham,Noto Sans Cherokee,Noto Sans Chorasmian,Noto Sans Coptic,Noto Sans Cuneiform,Noto Sans Cypriot,Noto Sans Cypro Minoan,Noto Sans Deseret,Noto Sans Devanagari,Noto Sans Devanagari UI,Noto Sans Duployan,Noto Sans Egyptian Hieroglyphs,Noto Sans Elbasan,Noto Sans Elymaic,Noto Sans Ethiopic,Noto Sans Georgian,Noto Sans Glagolitic,Noto Sans Gothic,Noto Sans Grantha,Noto Sans Gujarati,Noto Sans Gujarati UI,Noto Sans Gunjala Gondi,Noto Sans Gurmukhi,Noto Sans Gurmukhi UI,Noto Sans Hanifi Rohingya,Noto Sans Hanunoo,Noto Sans Hatran,Noto Sans Hebrew,Noto Sans Imperial Aramaic,Noto Sans Indic Siyaq Numbers,Noto Sans Inscriptional Pahlavi,Noto Sans Inscriptional Parthian,Noto Sans Javanese,Noto Sans Kaithi,Noto Sans Kannada,Noto Sans Kannada UI,Noto Sans Kayah Li,Noto Sans Kharoshthi,Noto Sans Khmer,Noto Sans Khojki,Noto Sans Khudawadi,Noto Sans Lao,Noto Sans Lao Looped,Noto Sans Lepcha,Noto Sans Limbu,Noto Sans Linear A,Noto Sans Linear B,Noto Sans Lisu,Noto Sans Lycian,Noto Sans Lydian,Noto Sans Mahajani,Noto Sans Malayalam,Noto Sans Malayalam UI,Noto Sans Mandaic,Noto Sans Manichaean,Noto Sans Marchen,Noto Sans Masaram Gondi,Noto Sans Math,Noto Sans Mayan Numerals,Noto Sans Medefaidrin,Noto Sans Meetei Mayek,Noto Sans Mende Kikakui,Noto Sans Meroitic,Noto Sans Miao,Noto Sans Modi,Noto Sans Mongolian,Noto Sans Mono,Noto Sans Mro,Noto Sans Multani,Noto Sans Myanmar,Noto Sans Nabataean,Noto Sans Nag Mundari,Noto Sans Nandinagari,Noto Sans Newa,Noto Sans New Tai Lue,Noto Sans NKo,Noto Sans Nushu,Noto Sans Ogham,Noto Sans Ol Chiki,Noto Sans Old Hungarian,Noto Sans Old Italic,Noto Sans Old North Arabian,Noto Sans Old Permic,Noto Sans Old Persian,Noto Sans Old Sogdian,Noto Sans Old South Arabian,Noto Sans Old Turkic,Noto Sans Oriya,Noto Sans Osage,Noto Sans Osmanya,Noto Sans Pahawh Hmong,Noto Sans Palmyrene,Noto Sans Pau Cin Hau,Noto Sans Phags\-Pa,Noto Sans Phoenician,Noto Sans Psalter Pahlavi,Noto Sans Rejang,Noto Sans Runic,Noto Sans Samaritan,Noto Sans Saurashtra,Noto Sans Sharada,Noto Sans Shavian,Noto Sans Siddham,Noto Sans SignWriting,Noto Sans Sinhala,Noto Sans Sinhala UI,Noto Sans Sogdian,Noto Sans Sora Sompeng,Noto Sans Soyombo,Noto Sans Sundanese,Noto Sans Syloti Nagri,Noto Sans Symbols,Noto Sans Symbols 2,Noto Sans Syriac,Noto Sans Syriac Eastern,Noto Sans Syriac Western,Noto Sans Tagalog,Noto Sans Tagbanwa,Noto Sans Tai Le,Noto Sans Tai Tham,Noto Sans Tai Viet,Noto Sans Takri,Noto Sans Tamil,Noto Sans Tamil Supplement,Noto Sans Tamil UI,Noto Sans Tangsa,Noto Sans Telugu,Noto Sans Telugu UI,Noto Sans Test,Noto Sans Thaana,Noto Sans Thai,Noto Sans Thai Looped,Noto Sans Tifinagh,Noto Sans Tifinagh Adrar,Noto Sans Tifinagh Agraw Imazighen,Noto Sans Tifinagh Ahaggar,Noto Sans Tifinagh Air,Noto Sans Tifinagh APT,Noto Sans Tifinagh Azawagh,Noto Sans Tifinagh Ghat,Noto Sans Tifinagh Hawad,Noto Sans Tifinagh Rhissa Ixa,Noto Sans Tifinagh SIL,Noto Sans Tifinagh Tawellemmet,Noto Sans Tirhuta,Noto Sans Ugaritic,Noto Sans Vai,Noto Sans Vithkuqi,Noto Sans Wancho,Noto Sans Warang Citi,Noto Sans Yi,Noto Sans Zanabazar Square,Noto Serif,Noto Serif Ahom,Noto Serif Armenian,Noto Serif Balinese,Noto Serif Bengali,Noto Serif Devanagari,Noto Serif Display,Noto Serif Dives Akuru,Noto Serif Dogra,Noto Serif Ethiopic,Noto Serif Georgian,Noto Serif Grantha,Noto Serif Gujarati,Noto Serif Gurmukhi,Noto Serif Hebrew,Noto Serif Kannada,Noto Serif Khitan Small Script,Noto Serif Khmer,Noto Serif Khojki,Noto Serif Lao,Noto Serif Makasar,Noto Serif Malayalam,Noto Serif Myanmar,Noto Serif NP Hmong,Noto Serif Old Uyghur,Noto Serif Oriya,Noto Serif Ottoman Siyaq,Noto Serif Sinhala,Noto Serif Tamil,Noto Serif Tangut,Noto Serif Telugu,Noto Serif Test,Noto Serif Thai,Noto Serif Tibetan,Noto Serif Toto,Noto Serif Vithkuqi,Noto Serif Yezidi,Noto Traditional Nushu");

