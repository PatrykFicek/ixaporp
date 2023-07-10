local PLUGIN = PLUGIN

PLUGIN.name = "NPC Loot"
PLUGIN.description = ""
PLUGIN.author = "Noney"
PLUGIN.schema = "Any"

PLUGIN.config = {
    ["npc_zombie"] = {
        rarity = 40,
        randomItems = true,
        items = {
            "bandage",
        },
    },
    ["npc_manhack"] = {
        rarity = 0,
        randomItems = true,
        items = {
            "biolink",
            "metalplate",
            "metalplate",
        },
    },
    ["npc_cscanner"] = {
        rarity = 0,
        randomItems = true,
        items = {
            "biolink",
            "refinedmetal",
            "refinedmetal",
        },
    },
}

ix.util.Include("sv_plugin.lua")