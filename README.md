# tf2_civilianpose_mod

Mod to make players T-Pose in TF2  
https://forums.alliedmods.net/showthread.php?p=2764469#post2764469

### Install

∙ Download smx from releases or directory.

∙ Add it to your addons/sourcemod/plugins directory.

∙ Load/reload plugin or restart/reload map

### Usage

∙ Type `!civ` or `!tpose` in chat

### 2.0 Changes

∙ Written for SM1.10 using ChatGPT 4.

∙ Overall simplified and optimized code.

∙ Added a check for the player's class, ensuring the player is a valid TF2 class before the command is executed. If not, an error message will be displayed.

∙ Added a ConVar civilianpose_self_notification to allow users to enable or disable self-notifications when they become a civilian or revert to their original state. Users can change the value of this ConVar in the console without recompiling the plugin.
