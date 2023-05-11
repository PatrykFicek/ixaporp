
FACTION.name = "Fundacja Tartarus"
FACTION.description = "Członek Fundacji Tartarus"
FACTION.color = Color(150, 125, 100, 255)
FACTION.models = {
	"models/yukon/hecu/hecu_01_npc.mdl",
	"models/yukon/hecu/hecu_02_npc.mdl"
}
FACTION.isDefault = false 

function FACTION:GetDefaultName(client)
	return "CRR-" .. Schema:ZeroNumber(math.random(1, 9999), 4) .. " ", true
end

function FACTION:OnTransferred(character)
	inventory = character:GetInventory()

	character:SetName(self:GetDefaultName() .. character:GetName())
	inventory:Add("cerberp_uniform", 1)

end

function FACTION:OnNameChanged(client, oldValue, value)
	local character = client:GetCharacter()

	if (!Schema:IsRank(oldValue, "CRR-") and Schema:IsRank(value, "CRR-")) then
		character:JoinClass(CLASS_CERBERP)
	elseif (!Schema:IsRank(oldValue, "GRG-") and Schema:IsRank(value, "GRG-")) then
		character:JoinClass(CLASS_GORGONO)
	elseif (!Schema:IsRank(oldValue, "ARG-") and Schema:IsRank(value, "ARG-")) then
		character:JoinClass(CLASS_ARGUSG)
	elseif (!Schema:IsRank(oldValue, "HDR-") and Schema:IsRank(value, "HDR-")) then
		character:JoinClass(CLASS_HYDRAP)
	end

end

FACTION_FUNTAR = FACTION.index
