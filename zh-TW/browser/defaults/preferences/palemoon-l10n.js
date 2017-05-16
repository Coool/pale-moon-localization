

pref("general.useragent.locale", "zh-TW");

// overwrite zh-CN defaults with zh-TW ones in win32 Firefox. (see bug 603549)
// noted that below setting should change accordingly if setting in intl/all.js changes.
pref("font.name.serif.zh-CN", "Times New Roman");
pref("font.name.sans-serif.zh-CN", "Arial");
pref("font.name.monospace.zh-CN", "細明體");  // MingLiU
pref("font.name-list.serif.zh-CN", "新細明體,PMingLiu,細明體,MingLiU");
pref("font.name-list.sans-serif.zh-CN", "新細明體,PMingLiU,細明體,MingLiU");
pref("font.name-list.monospace.zh-CN", "MingLiU,細明體");
