ITEM.base = "base_meds"
ITEM.name = "Medical items"
ITEM.description = "Medical thingy"
ITEM.model = Model("models/props_c17/suitcase_passenger_physics.mdl")
ITEM.category = "Medical"
ITEM.width = 1
ITEM.height = 1
ITEM.healAmount = 10
ITEM.applyTime = 3

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
				client:SetAction("@applyingItem", itemTable.applyTime)
				client:SetRunSpeed(defaultSpeeds.walk)
				target:SetHealth(math.min(target:Health() + itemTable.healAmount, 100))

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

		client:SetAction("@applyingItem", itemTable.applyTime, function()
			client:SetHealth(math.min(client:Health() + itemTable.healAmount, 100))
			client:SetRunSpeed(defaultSpeeds.run)
		end)

		if (stacks != 1) then
			itemTable:SetData('stacks', stacks - 1, client)
			return false 
		end
	end
}
