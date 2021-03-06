AddCSLuaFile( "cl_init.lua" ) -- Make sure clientside
AddCSLuaFile( "shared.lua" )  -- and shared scripts are sent.
 
include('shared.lua')
 
function ENT:Initialize()
 
	self:SetModel( "models/props_junk/garbage_newspaper001a.mdl" )
	self:SetTrigger( true ) --EXTREMELY IMPORTANT FOR CRAFTING
	self:PhysicsInit( SOLID_VPHYSICS )      -- Make us work with physics,
	self:SetMoveType( MOVETYPE_VPHYSICS )   -- after all, gmod is a physics
	self:SetSolid( SOLID_VPHYSICS )         -- Toolbox
 
        local phys = self:GetPhysicsObject()
	if (phys:IsValid()) then
		phys:Wake()
	end
end
 
function ENT:Use( activator, caller )

end

funtion ENT:Touch( entity )
	if entity == "item_sterile" then
		self:Remove()
		local bandage = ents.Create( "item_bandages" )
		bandage:SetPos( Vector( 0, 0, 20 ) )
		bandage:Spawn()
	end
	return end
end

function ENT:Think()
    -- We don't need to think, we are just a prop after all!
end

function ENT:OnRemove()
	self:Remove()
end