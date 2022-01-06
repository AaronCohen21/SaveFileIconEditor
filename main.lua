local saveFileIconEditor = RegisterMod("Save File Icon Editor", 1)
local io = require 'io'
local MCM = nil
if ModConfigMenu then
   MCM = require("scripts.modconfig")
end

--All code written by Aaron Cohen

--determine if the user is on windows or mac
local system = nil
if package.config:sub(1,1) == "\\" then
    --If the game is being run on a windows pc
    system = "windows"
elseif package.config:sub(1,1) == "/" then
    --If the game is being run on MacOS
    system = "mac"
end

--determine if the user is playing repentence, this takes precedent over if the user is playing on windows or mac
if REPENTANCE then
    system = "repentance"
end

--If the code cannot find the file for the anm2, this will cause the save function to return an error, and the save button will display "ERROR"
local user = nil
local filePath = nil
local filePath32 = "C:\\Program Files\\Steam\\steamapps\\common\\The Binding of Isaac Rebirth\\mods\\save file icon editor_2521782304\\resources\\gfx\\ui\\main menu\\saveselectmenu.anm2"

--=================================--
--Put Code For Quick Fix Below Here--
--=================================--





local file1 = 1
local alt1 = 1
local file2 = 1
local alt2 = 1
local file3 = 1
local alt3 = 1

local function getIconFile(icon, alt)
    if icon == 2 then
        return "01_basement.png"
    elseif icon == 3 then
        return "02_momkill.png"
    elseif icon == 4 then
        return "03_heart.png"
    elseif icon == 5 then
        return "04_everythingisterrible.png"
    elseif icon == 6 then
        return "06_bluebaby.png"
    elseif icon == 7 then
        return "05_fetus.png"
    elseif icon == 8 then
        if alt == 1 then
            return "12_photooutline.png"
        elseif alt == 2 then
            return "12_photo1piece.png"
        elseif alt == 3 then
            return "11_photo2pieces.png"
        elseif alt == 4 then
            return "10_photo3pieces.png"
        elseif alt == 5 then
            return "09_photo4pieces.png"
        elseif alt == 6 then
            return "08_photofull.png"
        end
    elseif icon == 9 then
        if alt == 1 then
            return "12_photooutline.png"
        elseif alt == 2 then
            return "12_negative1piece.png"
        elseif alt == 3 then
            return "11_negative2pieces.png"
        elseif alt == 4 then
            return "10_negative3pieces.png"
        elseif alt == 5 then
            return "09_negative4pieces.png"
        elseif alt == 6 then
            return "08_negativefull.png"
        end
    elseif icon == 10 then
        return "13_lambskull.png"
    elseif icon == 11 then
        return "07_goldengod.png"
    elseif icon == 12 then
        return "16_killmegasatan.png"
    elseif icon == 13 then
        return "MotherRep.png"
    elseif icon == 14 then
        return "Dogma.png"
    elseif icon == 15 then
        return "Beast.png"
    elseif icon == 16 then
        return "14_platinumgod.png"
    elseif icon == 17 then
        return "15_realplatinumgod.png"
    elseif icon == 18 then
        return "17_1000percent.png"
    elseif icon == 19 then
        return "Deadgod.png"
    elseif icon == 20 then
        return "2savefilestogo.png"
    elseif icon == 21 then
        return "2savefilestogoRep.png"
    elseif icon == 22 then
        return "1savefiletogo.png"
    elseif icon == 23 then
        return "1savefiletogoRep.png"
    elseif icon == 24 then
        if alt == 1 or alt == 4 then
            return "complete1.png"
        elseif alt == 2 or alt == 5 then
            return "complete2.png"
        elseif alt == 3 or alt == 6 then
            return "complete3.png"
        end
    elseif icon == 25 then
        if alt == 1 or alt == 4 then
            return "Complete1Rep.png"
        elseif alt == 2 or alt == 5 then
            return "Complete2Rep.png"
        elseif alt == 3 or alt == 6 then
            return "Complete3Rep.png"
        end
    elseif icon == 26 then
        if alt == 1 or alt == 4 then
            return "Infinity1.png"
        elseif alt == 2 or alt == 5 then
            return "Infinity2.png"
        elseif alt == 3 or alt == 6 then
            return "Infinity3.png"
        end
    end
end

local function saveIcons(icon1, alt1, icon2, alt2, icon3, alt3)

    --file path stuff
    if system == "windows" then
        --Determine the name of the user for the filepath
        local cmd = io.popen("echo %userprofile%")  --This will return "C:\Users\USERNAME"
        user = cmd:read()
        --Concatinate the filepath to the main menu anm2 file
        filePath = user .. "\\Documents\\My Games\\Binding of Isaac Afterbirth+ Mods\\save file icon editor_2521782304\\resources\\gfx\\ui\\main menu\\saveselectmenu.anm2"
    elseif system == "mac" then
        --Determine the name of the user for the filepath
        local cmd = io.popen("id -un")  --This will return the name of the user running the game
        user = cmd:read()
        --Concatinate the filepath to the main menu anm2 file
        filePath = "/Users/" .. user .. "/Library/Application Support/Binding of Isaac Afterbirth+ Mods/save file icon editor_2521782304/resources/gfx/ui/main menu/saveselectmenu.anm2"
    elseif system == "repentance" then
        --Determine the file path of the main menu anm2 file in the repentence mods folder
        filePath = "C:\\Program Files (x86)\\Steam\\steamapps\\common\\The Binding of Isaac Rebirth\\mods\\save file icon editor_2521782304\\resources\\gfx\\ui\\main menu\\saveselectmenu.anm2"
    elseif system == "custom" then
        filePath = filePath .. "\\save file icon editor_2521782304\\resources\\gfx\\ui\\main menu\\saveselectmenu.anm2"
    end

    --read anm2 file and store all lines in a table
    local file = io.open(filePath, "r")

    if system == "repentance" then
        file = io.open(filePath, "r") or io.open(filePath32, "r")   --If the game is running repentence, check to see if the mods folder is in the 32 bit location on the hard drive as well. This allows the mod to work on 32 bit pcs
    end

    local lines = {}
    for line in file:lines() do
        table.insert(lines, line)
    end
    io.close(file)

    --change the icon filepath for save file 1
    if file1 ~= 1 then lines[7] = "<Spritesheet Path=\"savedrawings\\" .. getIconFile(icon1, alt1) .. "\" Id=\"2\"/>" end
    --save file 2
    if file2 ~= 1 then lines[8] = "<Spritesheet Path=\"savedrawings\\" .. getIconFile(icon2, alt2) .. "\" Id=\"3\"/>" end
    --save file 3
    if file3 ~= 1 then lines[9] = "<Spritesheet Path=\"savedrawings\\" .. getIconFile(icon3, alt3) .. "\" Id=\"4\"/>" end

    --write changes to anm2 file
    file = io.open(filePath, "w")
    for index, value in ipairs(lines) do
        file:write(value.. '\n')
    end
    io.close(file)
    
end

-- Mod Config Menu
local saveChanges = false
local saveChangesLabel = "SAVE CHANGES"
if ModConfigMenu then
  local category = "Save File Icons"
  local info = "Information    "
  local editor = "Editor"

  MCM.UpdateCategory(category, {
    Info = "Edit Your Save File Icons!",
  })

  --Information

  MCM.UpdateSubcategory(category, info, {
    Info = "Information About The Mod",
  })

  --MCM.AddSpace(category, info)

  MCM.AddTitle(category, info, "Disclaimer")

  MCM.AddSpace(category, info)

  MCM.AddSetting(category, info, {

    Type = ModConfigMenu.OptionType.BOOLEAN,

    CurrentSetting = false,

    Display = function() return "--luadebug allows Lua from The Binding" end,

    Info = {"Disclaimer"}
  })
  MCM.AddText(category, info, "of Isaac many more permissions than it")
  MCM.AddText(category, info, "normally has, including reading/writing to")
  MCM.AddText(category, info, "any part of your hard drive! If you are")
  MCM.AddText(category, info, "reading this, --luadebug is enabled.")
  MCM.AddSetting(category, info, {

    Type = ModConfigMenu.OptionType.BOOLEAN,

    CurrentSetting = false,

    Display = function() return "Please be cautious as I cannot be" end,

    Info = {"Disclaimer"}
  })
  MCM.AddText(category, info, "responsible for any malicious mods out")
  MCM.AddText(category, info, "there that might take advantage of this.")
  MCM.AddText(category, info, "Once you are finished editing your save")
  MCM.AddText(category, info, "file icons, I highly recommend removing")
  MCM.AddText(category, info, "--luadebug from your Launch Options.")
  MCM.AddText(category, info, "This will disable the editor only, but")
  MCM.AddSetting(category, info, {

    Type = ModConfigMenu.OptionType.BOOLEAN,

    CurrentSetting = false,

    Display = function() return "your changes will still be visible." end,

    Info = {"Disclaimer"}
  })

  MCM.AddSpace(category, info)

  --Editor

  MCM.UpdateSubcategory(category, editor, {
    Info = "Edit Your Save File Icons!",
  })

  local iconOptions = {"Don't Change", "Basement", "Mom Kill", "Mom's Heart", "Everything Is Terrible!!!", "Blue Baby", "It Lives", "The Polaroid", "The Negative", "The End", "Golden God!", "Mega Satan", "Mother", "Dogma", "The Beast", "Platinum God!", "Real Platinum God!", "1001%!", "Dead God!!", "2 Save Files To Go!", "Repentance 2 Save Files To Go!", "1 Save File To Go!", "Repentance 1 Save File To Go!", "3,000,000%!!!", "Repentance 3,000,000%!!!", "Infinity"}

  local photoOptions = {"Blank", "1 Piece", "2 Pieces", "3 Pieces", "4 Pieces", "Full"}

  local threeMilPercentOptions = {"3,000", ",000", "%!!!", "3,000", ",000", "%!!!"}

  local positionOptions = {"Left", "Middle", "Right", "Left", "Middle", "Right"}

  local noOptions = {"", "", "", "", "", ""}

  --MCM.AddSpace(category, editor)
  MCM.AddTitle(category, editor, "Icon Options")
  MCM.AddSpace(category, editor)

  --Icon 1
  local alt1Text = "No Extra Options Available"
  local alt1Options = noOptions
  MCM.AddSetting(category, editor, {

    Type = ModConfigMenu.OptionType.NUMBER,

    CurrentSetting = function() return file1 end,

    Minimum = 1,
    Maximum = 26,

    Display = function() return "File 1: " .. iconOptions[file1] end,

    OnChange = function(i)
        file1 = i
        alt1 = 1

        if file1 == 8 then
            alt1Text = "Polaroid Progress: "
            alt1Options = photoOptions
        elseif file1 == 9 then
            alt1Text = "Negative Progress: "
            alt1Options = photoOptions
        elseif file1 == 24 then
            alt1Text = "3,000,000%!!! Icon: "
            alt1Options = threeMilPercentOptions
        elseif file1 == 25 then
            alt1Text = "Repentance 3,000,000%!! Icon: "
            alt1Options = positionOptions
        elseif file1 == 26 then
            alt1Text = "Infinity Icon: "
            alt1Options = positionOptions
        else
            alt1Text = "No Extra Options Available"
            alt1Options = noOptions
        end
    end,

    Info = {"Choose the icon for Save File 1"}
  })

  --Icon 2
  local alt2Text = "No Extra Options Available"
  local alt2Options = noOptions
  MCM.AddSetting(category, editor, {

    Type = ModConfigMenu.OptionType.NUMBER,

    CurrentSetting = function() return file2 end,

    Minimum = 1,
    Maximum = 26,

    Display = function() return "File 2: " .. iconOptions[file2] end,

    OnChange = function(i)
        file2 = i
        alt2 = 1

        if file2 == 8 then
            alt2Text = "Polaroid Progress: "
            alt2Options = photoOptions
        elseif file2 == 9 then
            alt2Text = "Negative Progress: "
            alt2Options = photoOptions
        elseif file2 == 24 then
            alt2Text = "3,000,000%!!! Icon: "
            alt2Options = threeMilPercentOptions
        elseif file2 == 25 then
            alt2Text = "Repentance 3,000,000%!! Icon: "
            alt2Options = positionOptions
        elseif file2 == 26 then
            alt2Text = "Infinity Icon: "
            alt2Options = positionOptions
        else
            alt2Text = "No Extra Options Available"
            alt2Options = noOptions
        end
    end,

    Info = {"Choose the icon for Save File 2"}
  })

  --Icon 3
  local alt3Text = "No Extra Options Available"
  local alt3Options = noOptions
  MCM.AddSetting(category, editor, {

    Type = ModConfigMenu.OptionType.NUMBER,

    CurrentSetting = function() return file3 end,

    Minimum = 1,
    Maximum = 26,

    Display = function() return "File 3: " .. iconOptions[file3] end,

    OnChange = function(i)
        file3 = i
        alt3 = 1

        if file3 == 8 then
            alt3Text = "Polaroid Progress: "
            alt3Options = photoOptions
        elseif file3 == 9 then
            alt3Text = "Negative Progress: "
            alt3Options = photoOptions
        elseif file3 == 24 then
            alt3Text = "3,000,000%!!! Icon: "
            alt3Options = threeMilPercentOptions
        elseif file3 == 25 then
            alt3Text = "Repentance 3,000,000%!! Icon: "
            alt3Options = positionOptions
        elseif file3 == 26 then
            alt3Text = "Infinity Icon: "
            alt3Options = positionOptions
        else
            alt3Text = "No Extra Options Available"
            alt3Options = noOptions
        end
    end,

    Info = {"Choose the icon for Save File 3"}
  })

  MCM.AddSpace(category, editor)
  MCM.AddTitle(category, editor, "Extra Options")
  MCM.AddSpace(category, editor)

  --Alt 1
  MCM.AddSetting(category, editor, {

    Type = ModConfigMenu.OptionType.NUMBER,

    CurrentSetting = function() return alt1 end,

    Minimum = 1,
    Maximum = 6,

    Display = function() return alt1Text .. alt1Options[alt1] end,

    OnChange = function(i)
        alt1 = i
    end,

    Info = {"Extra Options for Save File 1"}
  })

  --Alt 2
  MCM.AddSetting(category, editor, {

    Type = ModConfigMenu.OptionType.NUMBER,

    CurrentSetting = function() return alt2 end,

    Minimum = 1,
    Maximum = 6,

    Display = function() return alt2Text .. alt2Options[alt2] end,

    OnChange = function(i)
        alt2 = i
    end,

    Info = {"Extra Options for Save File 2"}
  })

  --Alt 3
  MCM.AddSetting(category, editor, {

    Type = ModConfigMenu.OptionType.NUMBER,

    CurrentSetting = function() return alt3 end,

    Minimum = 1,
    Maximum = 6,

    Display = function() return alt3Text .. alt3Options[alt3] end,

    OnChange = function(i)
        alt3 = i
    end,

    Info = {"Extra Options for Save File 3"}
  })

  MCM.AddSpace(category, editor)

  --Save Button
  MCM.AddSetting(category, editor, {

    Type = ModConfigMenu.OptionType.BOOLEAN,

    CurrentSetting = function() return saveChanges end,

    Display = function() return saveChangesLabel end,

    OnChange = function(boolean) 
      saveChanges = boolean

      saveChangesLabel = "ERROR: COULD NOT SAVE CHANGES"    --this will only show up if the saveIcons() function does not complete, otherwise it won't show up at all

      -- Save Changes Here
      saveIcons(file1, alt1, file2, alt2, file3, alt3)
    
      saveChangesLabel = "SAVED, RESTART YOUR GAME"
    end,

    Info = {"Save your changes. Restart your game for changes to take effect"}
  })
end