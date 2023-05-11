
ITEM.name = "Bandaż"
ITEM.model = Model("models/illusion/eftcontainers/bandage.mdl")
ITEM.description = "Mała rolka z materiału."
ITEM.category = "Medical"
ITEM.maxStacks = 5

if CLIENT then
	function ITEM:PaintOver(item, w, h)
		draw.SimpleText(
			item:GetData('stacks', 1), 'DermaDefault', w - 5, h - 5,
			color_white, TEXT_ALIGN_RIGHT, TEXT_ALIGN_BOTTOM, 1, color_black
		)
	end
end

ITEM.functions.Apply = {
	name = "applyItem",
	sound = "items/medshot4.wav",
	OnRun = function(itemTable)
		local client = itemTable.player
		local stacks = itemTable:GetData('stacks', 1)
		local target = client:GetEyeTrace().entity
		local defaultSpeeds = {
			walk = client:GetWalkSpeed(),
			run = client:GetRunSpeed()
		}

		if IsValid(target) and target.IsPlayer() then
			client:DoStaredAction(target, function()
				client:SetAction("applyingItem", 3)
				client:SetRunSpeed(defaultSpeeds.walk)
				target:SetHealth(math.min(target:Health() + 20, 100))

				if (stacks != 1) then
					itemTable:SetData('stacks', stacks - 1, client)
					return false 
				end

				client:SetRunSpeed(defaultSpeeds.run)

			end, 3, function()
				client:NotifyLocalized("targetTooFar")
				return false 
			end, 100)			
		else
			client:NotifyLocalized("targetInvalid")
			return false
		end

		
	end
}

ITEM.functions.ApplySelf = {
	name = "applyItemSelf",
	sound = "items/medshot4.wav",
	OnRun = function(itemTable)
		local client = itemTable.player
		local stacks = itemTable:GetData('stacks', 1)
		local defaultSpeeds = {
			walk = client:GetWalkSpeed(),
			run = client:GetRunSpeed()
		}
		client:SetRunSpeed(defaultSpeeds.walk)

		client:SetAction("applyingItem", 3, function()
			client:SetHealth(math.min(client:Health() + 20, 100))
			client:SetRunSpeed(defaultSpeeds.run)
		end)

		if (stacks != 1) then
			itemTable:SetData('stacks', stacks - 1, client)
			return false 
		end
	end
}

ITEM.functions.combine = {
	OnRun = function(firstItem, data)
        local firstItemStacks = firstItem:GetData('stacks', 1)
        local secondItem = ix.item.instances[data[1]]
        local secondItemStacks = secondItem:GetData('stacks', 1)
		local totalStacks = secondItemStacks + firstItemStacks

        if (firstItem.uniqueID ~= secondItem.uniqueID) then return false end
        if (totalStacks > firstItem.maxStacks) then return false end

		firstItem:SetData('stacks', totalStacks, ix.inventory.Get(firstItem.invID):GetReceivers())
		secondItem:Remove()

		return false
	end,
	OnCanRun = function(firstItem, data)
		return true
	end
}

ITEM.functions.split = {
	name = "splitItem",
	icon = "icon16/arrow_divide.png",
	OnRun = function(item)
		local client = item.player
		local character = client:GetCharacter()
		local itemUniqueID = item.uniqueID
		local stacks = item:GetData('stacks', 1)
		client:RequestString('Split', 'Please enter how many items you want to split', function(splitStack)
			if !isnumber(tonumber(splitStack)) then client:Notify('Please enter a `number`') return false end
			local cleanSplitStack = math.Round(math.abs(tonumber(splitStack)))
			if (cleanSplitStack >= stacks) then return false end
			local stackedCount = (stacks - cleanSplitStack)

			if !character:GetInventory():Add(itemUniqueID, 1, {stacks = cleanSplitStack}) then
				ix.item.Spawn(itemUniqueID, client, nil, angle_zero, {stacks = cleanSplitStack})
			end

			item:SetData("stacks", stackedCount, ix.inventory.Get(item.invID):GetReceivers())
		end, '1')
		return false
	end,
	OnCanRun = function(item)
		return (item:GetData('stacks', 1) ~= 1)
	end
}