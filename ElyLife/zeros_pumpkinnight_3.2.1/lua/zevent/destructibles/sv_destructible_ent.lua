if CLIENT then return end
zpn = zpn or {}
zpn.Destructable = zpn.Destructable or {}

function zpn.Destructable.Initialize(Pumpkin)
    zclib.Debug("zpn.Destructable.Initialize")

    Pumpkin:SetModel(zpn.Theme.Destructibles.models[math.random(#zpn.Theme.Destructibles.models)])

    // Give it some random orange color
    Pumpkin:SetColor(zpn.Theme.Destructibles.getcolor())

    Pumpkin:PhysicsInit(SOLID_VPHYSICS)
    Pumpkin:SetSolid(SOLID_VPHYSICS)
    Pumpkin:SetMoveType(MOVETYPE_VPHYSICS)
    Pumpkin:SetUseType(SIMPLE_USE)
    Pumpkin:SetCollisionGroup(COLLISION_GROUP_WEAPON)
	Pumpkin:SetCustomCollisionCheck(true)

    local phys = Pumpkin:GetPhysicsObject()
    if IsValid(phys) then
        phys:Wake()
        phys:EnableMotion(false)
    end

    Pumpkin.Smashed = false

    local health = math.random(zpn.config.Destructable.Health.min, zpn.config.Destructable.Health.max)
    Pumpkin:SetMaxHealth( health )
    Pumpkin:SetHealth( health )

    zclib.EntityTracker.Add(Pumpkin)

    // Precache gibs
    Pumpkin:PrecacheGibs()

    Pumpkin.DeSpawnTime = CurTime() + zpn.config.Destructable.DespawnTime
    table.insert(zpn.SpawnedPumpkins, Pumpkin)
    table.insert(zpn.PumpkinsTargets, Pumpkin)
end

function zpn.Destructable.OnRemove(Pumpkin)
    table.RemoveByValue(zpn.SpawnedPumpkins, Pumpkin)
    table.RemoveByValue(zpn.PumpkinsTargets, Pumpkin)
end

function zpn.Destructable.BeingGhostTarget(Pumpkin)
	return Pumpkin.zpn_GhostAttackCooldown and Pumpkin.zpn_GhostAttackCooldown > CurTime()
end

function zpn.Destructable.OnTakeDamage(Pumpkin, dmginfo)
    zclib.Debug("zpn.Destructable.OnTakeDamage")
    if not IsValid(Pumpkin) then return end
    if zpn.Destructable.BeingGhostTarget(Pumpkin) then return end

    if Pumpkin.Smashed then return end

    // Make sure we're not already applying damage a second time
    // This prevents infinite loops
    if (not Pumpkin.m_bApplyingDamage) then
        Pumpkin.m_bApplyingDamage = true

        Pumpkin:TakeDamageInfo(dmginfo)
        Pumpkin:SetHealth(math.Clamp(Pumpkin:Health() - dmginfo:GetDamage(),0,zpn.config.Destructable.Health.max))

        if Pumpkin:Health() <= 0 then
            zpn.Destructable.Smash(Pumpkin,dmginfo:GetAttacker())
        end

        Pumpkin.m_bApplyingDamage = false
    end
end

function zpn.Destructable.OnPhysicsCollide(Pumpkin,data)
    zclib.Debug("zpn.Destructable.OnPhysicsCollide")
    if not IsValid(Pumpkin) then return end
	if zpn.Destructable.BeingGhostTarget(Pumpkin) then return end

    if Pumpkin.Smashed then return end


    if (data.Speed > 400) then
        zpn.Destructable.Smash(Pumpkin,nil)
    end
end

function zpn.Destructable.Smash(Pumpkin,ply)
    zclib.Debug("zpn.Destructable.Smash")

    if IsValid(ply) and ply:IsPlayer() and ply:Alive() then
        zpn.Score.AddPoints(ply, 1)
    end

    zpn.Destructable.Destroy(Pumpkin)

    timer.Simple(0,function()
        if IsValid(Pumpkin) then
            local candyCount = math.random(zpn.config.Destructable.Candy.min,zpn.config.Destructable.Candy.max)

            hook.Run("zpn_OnDestructableSmashed", ply, Pumpkin)

            local pos = Pumpkin:GetPos()
            local randomAngle = math.random(1000)
            local InnerCircleRadius = math.random(50,100)
            local offset = Vector(math.cos(randomAngle) * InnerCircleRadius, math.sin(randomAngle) * InnerCircleRadius, 15)

            for i = 1, candyCount do

                // Lets make sure atleast one candy spawns at the pumpkins position
                if i == 1 then
                    pos = Pumpkin:GetPos() + Vector(0,0,15)
                else
                    randomAngle = math.random(1000)
                    InnerCircleRadius = math.random(50, 100)
                    offset = Vector(math.cos(randomAngle) * InnerCircleRadius, math.sin(randomAngle) * InnerCircleRadius, 15)
                    pos = Pumpkin:GetPos() + offset
                end
                local ent = ents.Create("zpn_candy")
                ent:SetPos(pos)
                ent:Spawn()
                ent:Activate()
            end


            // Custom Drop
            if table.Count(zpn.config.Destructable.CustomDrop) > 0 then
                local pool = {}

                for k,v in pairs(zpn.config.Destructable.CustomDrop) do

                    for i = 1, 100 - v.chance do
                        table.insert(pool, -1)
                    end

                    for i = 1, v.chance do
                        table.insert(pool, k)
                    end
                end

                pool = zclib.table.randomize( pool )

                local id = pool[math.random(#pool)]
                if id > 0 and IsValid(ply) then
                    zpn.config.Destructable.CustomDrop[id].drop(ply,pos)
                end
            end
        end
    end)
end

function zpn.Destructable.Destroy(Pumpkin)
    //zclib.Debug("zpn.Destructable.Destroy")
    Pumpkin.Smashed = true
    Pumpkin:SetNoDraw(true)

    zclib.NetEvent.Create("zpn_destructable_destroy", {Pumpkin})

    table.RemoveByValue(zpn.SpawnedPumpkins,Pumpkin)

    SafeRemoveEntityDelayed(Pumpkin,2)
end
