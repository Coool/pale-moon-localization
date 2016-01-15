# pale-moon-localization
### Language packs for Pale Moon

This repository holds all of the langage pack files for the Pale Moon web browser.
Pale Moon can be found at http://www.palemoon.org/

This repository serves as the master version control repository for the language packs that are available for the browser.

If you want to contribute, please keep the following guidelines in mind:
* All language code directories (e.g. [en-US]) should contain *only* the files that should go into the language pack XPIs. If you have other files (e.g. reference files) that should be contained in this repo, please create a new directory that starts with the language code but has an extension .extra, e.g. [en-US.extra]
* We went from Babelzilla as a piecemeal translation system to transifex, but currently do not have a working translation system or portal. You should preferably edit files as-is with your favorite localization software and submit the target files to this repository as pull requests.
* The browser name "Pale Moon" should always remain **untranslated**, in 2-word capitalized form.
* Other proper names (e.g. Moonchild Productions, Pale Moon Sync) should remain untranslated as well.
* Please always translate from the US-English language, which is the original source language. Do not use an already-translated other language as your source language, to prevent degradation of the translations due to limits in exactly matching vocabulary in different languages. You can, of course use closely-related languages as a reference.
* Please keep the tone of your translations neutral and professional. If you have a choice between formal and informal expressive form in your language, use the formal form.
* Please mind the length of your translations. Many of these strings will be used in limited spaces in the browser's user interface.
* Before you create a submission or pull request, please test your translations by loading the language pack into the browser and verifying correctness.

