#include <sourcemod>
#include <tf2_stocks>
#include <sdktools>
#include <convars>

public Plugin myinfo = {
    name = "Simplified Civilian Pose Plugin",
    author = "dada513, We Do It Live! & ChatGPT",
    description = "Adds a command to add a civilian pose",
    version = "2",
    url = "https://github.com/dada513/tf2-civplugin"
};

new ConVar:cv_self_notification;

public void OnPluginStart() {
    PrintToServer("Simplified Civilian Pose Plugin loaded!");
    RegConsoleCmd("sm_civ", Command_Civ, "Makes the player a civilian");
    RegConsoleCmd("sm_tpose", Command_Civ, "Makes the player a civilian");

    // Create the ConVar without generating a configuration file
    cv_self_notification = CreateConVar("civilianpose_self_notification", "1", "Enable/Disable self-notification when a player becomes a civilian. 0 = Disable, 1 = Enable", _, true, 0.0, true, 1.0);
}

public Action Command_Civ(int client, int args) {
    if (!IsClientInGame(client)) {
        PrintToConsole(client, "Error: You must be in-game to use this command.");
        return Plugin_Handled;
    }

    int playerClass = view_as<int>(TF2_GetPlayerClass(client));

    if (playerClass == -1) {
        PrintToConsole(client, "Error: You must be a valid TF2 class to use this command.");
        return Plugin_Handled;
    }

    if (GetConVarInt(cv_self_notification)) {
        PrintToChat(client, "You are now a civilian!");
    }

    for (int i = 0; i < 4; i++) {
        TF2_RemoveWeaponSlot(client, i);
    }

    return Plugin_Handled;
}
