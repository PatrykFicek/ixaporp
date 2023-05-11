
ITEM.name = "Bandaż wojskowy"
ITEM.model = Model("models/illusion/eftcontainers/armybandage.mdl")
ITEM.description = "A small roll of hand-made gauze."

ITEM.functions.Apply = {
	sound = "items/medshot4.wav",
	OnRun = function(itemTable)
		local client = itemTable.player

		client:SetHealth(math.min(client:Health() + 20, 100))
	end
}
