# tf2_civilianpose_mod

Mod to make players T-Pose in TF2  
https://forums.alliedmods.net/showthread.php?p=2764469#post2764469

### Install

download smx from releases or directory 
put to addons/sourcemod/plugins directory

### Usage

type `!civ` or `!tpose` in chat

### 2.0 Changes

∙ Written for SM1.10 using ChatGPT 4.

∙ Replaced the TF2_RemoveWeaponSlot() function calls with a loop that uses RemovePlayerItem() and GetPlayerWeaponSlot() to remove weapons from the player.

∙ Added a check to ensure that the client is in the game before the command is executed. If not, an error message will be displayed.

∙ Added a check for the player's class, ensuring the player is a valid TF2 class before the command is executed. If not, an error message will be displayed.

∙ Introduced a new array isCivilian to keep track of the civilian state for each player.

∙ Updated the command behavior to toggle the civilian state for the player when the command is executed. If the player is already a civilian, the command will revert them to their original state, and they will receive their weapons upon respawning or touching a locker.

∙ Added a ConVar civilianpose_self_notification to allow users to enable or disable self-notifications when they become a civilian or revert to their original state. Users can change the value of this ConVar in the console without recompiling the plugin.