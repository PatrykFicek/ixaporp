
ITEM.name = "Apteczka bojowa"
ITEM.model = Model("models/illusion/eftcontainers/ifak.mdl")
ITEM.description = "Mała torebka oznaczona białym krzyżem. Wypełniona jest wszelkiego rodzaju medykamentami."
ITEM.category = "Medical"

ITEM.functions.Apply = {
	name = "applyItem",
	sound = "items/medshot4.wav",
	OnRun = function(itemTable)
		local client = itemTable.player
		local target = client:GetEyeTrace().entity
		local defaultSpeeds = {
			walk = client:GetWalkSpeed(),
			run = client:GetRunSpeed()
		}

		if IsValid(target) and target.IsPlayer() then
			client:DoStaredAction(target, function()
				client:SetAction("applyingItem", 5)
				client:SetRunSpeed(defaultSpeeds.walk)
				target:SetHealth(math.min(target:Health() + 50, 100))
				client:SetRunSpeed(defaultSpeeds.run)

			end, 5, function()
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
		local defaultSpeeds = {
			walk = client:GetWalkSpeed(),
			run = client:GetRunSpeed()
		}
		client:SetRunSpeed(defaultSpeeds.walk)

		client:SetAction("applyingItem", 5, function()
			client:SetHealth(math.min(client:Health() + 50, 100))
			client:SetRunSpeed(defaultSpeeds.run)
		end)
	end
}