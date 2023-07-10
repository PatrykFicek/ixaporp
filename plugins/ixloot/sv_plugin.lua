local PLUGIN = PLUGIN

-- messy but idc.
function PLUGIN:SearchLootContainer(ent, ply)
    if not ent.containerAlreadyUsed or ent.containerAlreadyUsed <= CurTime() then
        local randomChance = math.random(1,20)
        --local randomAmountChance = math.random(1,3)
        local lootAmount = ent.lootAmount
        local inventory = ix.inventory.Create(ent.invWidth, ent.invHeight, os.time())
        inventory.noSave = true

        local randomLootItem = table.Random(ent.randomLoot.common)
        --[[if ( randomAmountChance == 3 ) then
            lootAmount = math.random(1,3)
        else
            lootAmount = 1
        end]]

        for i = 1, lootAmount do
            if (randomChance == math.random(1,20)) then
                randomLootItem = table.Random(ent.randomLoot.rare)
                inventory:Add(randomLootItem)
            else
                randomLootItem = table.Random(ent.randomLoot.common)
                inventory:Add(randomLootItem)
            end
        end

        ix.storage.Open(ply, inventory, {
            entity = ent,
            name = "Test",
            searchText = "@lootingCont", -- Add localized texts
            searchTime = 0.5
        })
        ent.containerAlreadyUsed = CurTime() + 180
    else
        if not ent.ixContainerNothingInItCooldown or ent.ixContainerNothingInItCooldown <= CurTime() then
            ply:NotifyLocalized("nothingInCont")
        end
    end
    
end

function Schema:SpawnRandomLoot(position, rareItem)
    local randomLootItem = table.Random(PLUGIN.randomLoot.common)

    if (rareItem == true) then
        randomLootItem = table.Random(PLUGIN.randomLoot.rare)
    end

    ix.item.Spawn(randomLootItem, position)
end