if CLIENT then return end
zpn = zpn or {}
zpn.Candy = zpn.Candy or {}

zpn.SpawnedCandy = zpn.SpawnedCandy or {}

if zpn.config.Candy.DespawnTime ~= -1 then
    local timerid = "zpn_candy_despawner"
    zclib.Timer.Remove(timerid)

    zclib.Timer.Create(timerid, zpn.config.Candy.DespawnTime, 0, function()
        if zpn.SpawnedCandy and table.Count(zpn.SpawnedCandy) > 0 then
            for k, v in pairs(zpn.SpawnedCandy) do
                if IsValid(v) then
                    if v.DeSpawnTime < CurTime() then
                        v:Remove()
                    end
                else
                    zpn.SpawnedCandy[k] = nil
                end
            end
        end
    end)
end


function zpn.Candy.Initialize(Candy)
    zclib.Debug("zpn.Candy.Initialize")

    local val,key = table.Random(zpn.Theme.Candytypes)

    Candy:SetModel(key)
    Candy:SetCandy(val)
    Candy:SetModelScale(0.75)

    Candy:SetColor(HSVToColor(math.random(0,360),0.7,1))

    local size = 50

    //Vectors
    local min = Vector(0 - (size / 2), 0 - (size / 2), 0 - (size / 2))
    local max = Vector(size / 2, size / 2, size / 2)


    //Set physics box
    Candy:PhysicsInitBox(min,max)

    //Set bounding box - this will be used for triggers and
    //determining if rendering is necessary clientside)
    Candy:SetCollisionBounds(min,max)


    Candy:SetUseType(SIMPLE_USE)
    Candy:SetTrigger(true)

    Candy:SetCollisionGroup(COLLISION_GROUP_WEAPON)

    Candy:SetCustomCollisionCheck(true)

    local phys = Candy:GetPhysicsObject()
    if IsValid(phys) then
        phys:Wake()
        phys:EnableMotion(true)

        phys:EnableDrag( true )
        phys:SetAngleDragCoefficient(1000000)
        phys:SetDragCoefficient(1000000)
    end

    zclib.EntityTracker.Add(Candy)

    Candy.DeSpawnTime = CurTime() + zpn.config.Candy.DespawnTime

    table.insert(zpn.SpawnedCandy,Candy)
end

function zpn.Candy.Collect(Candy,ply)
    zclib.Debug("zpn.Candy.Collect")
    ply:EmitSound("zpn_candy_collect")

	local points = Candy:GetCandy() * zpn.Mask.GetCandyMul(ply)

    zpn.Candy.AddPoints(ply,points)
    Candy:Remove()
end

function zpn.Candy.StartTouch(Candy, ply)
    if zclib.util.CollisionCooldown(Candy) then return end
    zpn.Candy.Collect(Candy, ply)
end
