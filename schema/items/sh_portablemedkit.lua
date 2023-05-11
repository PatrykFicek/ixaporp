
ITEM.name = "Apteczka podręczna"
ITEM.model = Model("models/illusion/eftcontainers/carmedkit.mdl")
ITEM.description = "Mała apteczka. Przydatna w nagłych wypadkach"
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
				client:SetAction("applyingItem", 4)
				client:SetRunSpeed(defaultSpeeds.walk)
				target:SetHealth(math.min(target:Health() + 45, 100))
				client:SetRunSpeed(defaultSpeeds.run)

			end, 4, function()
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

		client:SetAction("applyingItem", 4, function()
			client:SetHealth(math.min(client:Health() + 45, 100))
			client:SetRunSpeed(defaultSpeeds.run)
		end)
	end
}
