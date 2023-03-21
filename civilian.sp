#include <sourcemod>
#include <tf2_stocks>
#include <sdktools>
#include <convars>

public Plugin myinfo = {
    name = "Optimized Civilian Pose Plugin",
    author = "dada513, We Do It Live! & ChatGPT",
    description = "Adds a command to add a civilian pose",
    version = "2.0",
    url = "https://github.com/dada513/tf2-civplugin"
};

new bool:isCivilian[MAXPLAYERS + 1];
new ConVar:cv_self_notification;

public void OnPluginStart() {
    PrintToServer("Optimized Civilian Pose Plugin loaded!");
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

    if (isCivilian[client]) {
        if (GetConVarInt(cv_self_notification)) {
            PrintToChat(client, "You are no longer a civilian!");
            PrintToChat(client, "Go to a locker or respawn to receive your weapons!");
        }
        isCivilian[client] = false;
    } else {
        if (GetConVarInt(cv_self_notification)) {
            PrintToChat(client, "You are now a civilian!");
            PrintToChat(client, "Go to a locker or type the command again to be normal!");
        }

        isCivilian[client] = true;

        for (int i = 0; i < 4; i++) {
            int itemHandle = GetPlayerWeaponSlot(client, i);
            if (view_as<int>(itemHandle) > view_as<int>(INVALID_HANDLE)) {
                RemovePlayerItem(client, itemHandle);
            }
        }
    }

    return Plugin_Handled;
}
