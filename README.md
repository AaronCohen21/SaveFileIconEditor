[![Steam Downloads](https://img.shields.io/steam/downloads/2521782304?color=blue&logo=Steam&style=flat-square)](https://steamcommunity.com/sharedfiles/filedetails/?id=2521782304)

# DOWNLOAD

To install the mod, go to the mod's official steam page [here](https://steamcommunity.com/sharedfiles/filedetails/?id=2521782304), and subscribe to it to have it automatically be installed to your game upon next launch. You can also clone this project directly into your mods folder.

# Use Any Save File Icon You Want!

This mod allows you to switch between any save file icons you want, without limiting what's displayed based on your progress. It even allows you to go back to previous icons if you've progressed further along in the game (ex. you're on mega satan but you want it to show blue baby). This way you aren't limited to just using what the game gives you, but instead, you can make it more personalized.

# How Do I Use It?

1. Initially after installing the mod, you'll know that its working if all three save file icons are overridden to show the default basement icon.

2. After you see that the mod is working, I highly recommend disabling all mods other than This One, and Mod Config Menu (see disclaimer for why)

3. Now that you've disabled all of your other mods, you're going to need to enable the editor. To do this, exit your game, and go to your game's settings and open the properties panel. Now enter `--luadebug` into your ***Launch Options***. This is necessary to give the editor the permissions needed to edit the mod's animation files (again, see the disclaimer).

4. You can now re-open your game. To edit your icons, start a new run and press "L" to open Mod Config Menu, and navigate to the "Save File Icons" category. Here you will find the editor.

5. Once you have made your changes, press the "Save Changes" button and restart the game to see your changes take place.

6. When you are happy with your changes, exit your game again, and remove `--luadebug` from your ***Launch Options***. Now you can re-open your game, and re-enable all of your other mods. Removing `--luadebug` only disables the editor, but the changes you have made to your icons will stay unless you disable this mod. (see why it is important to disable `--luadebug` in the disclaimer)

# Disclaimer

`--luadebug` allows Lua from The Binding of Isaac many more permissions than it normally has, including reading/writing to any part of your hard drive! If you decide to use this mod and enable `--luadebug`, please be cautious as I cannot be responsible for any malicious mods out there that might take advantage of this. Once you are finished editing your save file icons, I highly recommend removing `--luadebug` from your ***Launch Options***. This will disable the editor only, but your changes will still be visible.

# When I Try To Save My Changes I Get An Error

Don’t worry! This is a common problem that can happen if you have a separate hard drive for all of your steam games, or if your mods folder is stored somewhere unusual. Whatever the case, to fix this all you need to do is open the "main.lua" file for this mod, and insert the following code in the position indicated to you by the file (this should be somewhere around line 31).

```
system = "custom"
filePath = "FULL PATH TO YOUR MODS FOLDER"
```

Replace **FULL PATH TO YOUR MODS FOLDER** with the entire file path to your game's "mods" folder, but be sure to keep the quotation marks. As well, make sure to use two backslashes instead of one (ex. `C:\\Program Files\\Steam\\steamapps\\common\\The Binding of Isaac Rebirth\\mods`). If you're playing Repentance, you can find this folder by clicking "browse local files" under your game's manage section.