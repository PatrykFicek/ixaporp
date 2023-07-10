local PLUGIN = PLUGIN

function PLUGIN:OnNPCKilled(npc, attacker)
    print(npc:GetClass())

    local config = self.config[npc:GetClass()]

    if not (config and config.items) then
        return 
    end

    local width = PLUGIN.InvWidth
    local height = PLUGIN.InvHeight

    local inventory = ix.inventory.Create(width, height, os.time())
    inventory.noSave = true    
    
    local dropChance = math.random(1,100)
    if not (dropChance >= config.rarity) then
        return 
    end

    if (config.randomItems) then
        inventory:Add(table.Random(config.items), math.random(1,4))
    else
        for k, v in pairs(config.items) do
            inventory:Add(v, 1)
        end
    end

    npc.ixInventory = inventory
end

function PLUGIN:PlayerUse(client, npc)
    local character = client:GetCharacter()

    if (npc:GetClass() == "prop_ragdoll" and self.config[npc:GetClass()] and npc.ixInventory and !ix.storage.InUse(npc.ixInventory)) then
        ix.storage.Open(client, npc.ixInventory, {
            entity = npc,
            name = "Ciało", -- add localization
            searchTest = "@searchingCorpse",
            searchTime = 5
        })

        return false
    end
end