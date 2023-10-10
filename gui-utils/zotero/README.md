# Zotero Setup

## Unleash Zotero 6 by WebDAV(TeraCLOUD) & plugins

### WebDAV setup

1. Create an acount in [TeraCLOUD](https://teracloud.jp/en/), a japen WebDAV provider.
2. In [My Page](https://teracloud.jp/en/modules/mypage/usage/), find the **Get more capacity** section -> "Enter friends Introduce code" -> Enter `3VCYW`, to get extra free 5 GB storage.
3. In [My Page](https://teracloud.jp/en/modules/mypage/usage/), find the **Apps Connection** section -> check "Turn on Apps Connection" -> write down for later use:
   - WebDAV Connection URL
   - Connection ID
   - Apps Password
4. In Zotero -> `Edit` -> `Perferences` -> `Sync` -> `Settings` -> `File Syncing`
   - check and select `Sync attachement files in My Library using WubDAV`
   - fill in the **URL** with **WebDAV Connection URL**
   - fill in the **Username** with **Connection ID**
   - fill in the **Password** with **Apps Password**
5. click `Verify Server` to see if that works.
6. **un**check "Sync attachment files in group libraries using Zetoro storage".
   > 💡 WebDAV storage is currently for Personal use only, group libraries is only available via Zotero stortage.
7. In Zotero -> `Edit` -> `Perferences` -> `Advanced` -> `Files and Folders`
   - In `Linked Attachment Base Directory`, make sure the "Base directory" is empty.
   - In `Data Directory Location`, leave as default.
8. For iOS & iPadOS users, open the app -> `Settings` -> `Account` -> `FILE SYNCING`
   - change the "Sync attachment files in My Library using" **WebDAV** -> fill the info -> click `Verify Server`

### Plugins

- For Zotero 6, use these plugins:
  1. [zotero-better-bibtex](https://github.com/retorquere/zotero-better-bibtex/releases/)
  2. [scite-zotero-plugin](https://github.com/scitedotai/scite-zotero-plugin)
  3. [Zotero DOI Manager](https://github.com/bwiernik/zotero-shortdoi)
  4. (Optional) [Zotero Storage Scanner](https://github.com/retorquere/zotero-storage-scanner/releases/)
  5. (Optional) [Zotero Scholar Citations](https://github.com/beloglazov/zotero-scholar-citations/raw/master/builds/zotero-scholar-citations-1.9.3-fx.xpi)

---

## Below section is for Zotero 5 and non-WebDAV users

<strike>## Unleash Zotero by plugins & Cloud Storage

- Watch the [full tutorial](https://www.researchgate.net/publication/325828616_Tutorial_The_Best_Reference_Manager_Setup_Zotero_ZotFile_Cloud_Storage) by [Stephen Chignell](https://www.researchgate.net/profile/Stephen-Chignell).
- Noted: the **engines.json** he provided was invalid, use this [engines.json](https://github.com/bwiernik/zotero-tools/blob/master/engines.json) by [bwiernik](https://github.com/bwiernik) instead.
- Noted: the **FireTray** plugin seems to be outdated and doesn't work on _Win10 21H2 19044.1526_. Correct me if I'm wrong.
- Plugin repo release:
  1. [ZotFile](https://github.com/jlegewie/zotfile/releases/)
  2. [Zutilo](https://github.com/wshanks/Zutilo/releases)
  3. [Zotero Scholar Citations](https://github.com/beloglazov/zotero-scholar-citations/raw/master/builds/zotero-scholar-citations-1.9.3-fx.xpi)
  4. [Zotero Storage Scanner](https://github.com/retorquere/zotero-storage-scanner/releases/)
  5. [zotero-mdnotes](https://github.com/argenos/zotero-mdnotes/releases/)
  6. [zotero-better-bibtex](https://github.com/retorquere/zotero-better-bibtex/releases/)</strike>
