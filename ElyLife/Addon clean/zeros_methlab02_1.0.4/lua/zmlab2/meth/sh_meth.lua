zmlab2 = zmlab2 or {}
zmlab2.Meth = zmlab2.Meth or {}

zmlab2.Meth.Materials = zmlab2.Meth.Materials or {}

// Creates / returns a meth material which matches the specified parameters
function zmlab2.Meth.GetMaterial(MethType,MethQuality)

    local quality_step = math.Round((5 / 100) * MethQuality)

    local mat_name = "zmlab2_material_meth_" .. MethType .. "_" .. quality_step

    if zmlab2.Meth.Materials[mat_name] then
        return mat_name
    end


    local MethData = zmlab2.config.MethTypes[MethType]
    if MethData == nil then return end
    // This is a big OOF but for some reason phong wont work for materials created with LUA

    local mat_params = {
    	["$basetexture"] = "$basetexture","zerochain/props_methlab/meth/zmlab2_meth_cracked_diff",
    	["$bumpMap"] = "$bumpMap","zerochain/props_methlab/meth/zmlab2_meth_cracked_nrm",
    	["$normalmapalphaenvmapmask"] = 1,

        ["$model"] = 1,
    	["$surfaceprop"] = "metal",

    	["$envmap"] = "env_cubemap",
        ["$envmaptint"] = Vector(1,1,1),
        ["$envmapfresnel"] = 0.25,

    	["$phong"] = 1,
    	["$phongexponent"] = 25,
    	["$phongtint"] = Vector(1, 1, 1),
    	["$phongboost"] = 25
    }

    zmlab2.Debug("zmlab2.Meth.MethMaterial Created!")
    local mat = CreateMaterial(mat_name, "VertexLitGeneric", mat_params)

    if MethData.material then
        if MethData.material.diff then mat:SetTexture("$basetexture",MethData.material.diff) end
        if MethData.material.nrm then mat:SetTexture("$bumpMap",MethData.material.nrm) end
    else
        mat:SetTexture("$basetexture","zerochain/props_methlab/meth/zmlab2_meth_cracked_diff")
        mat:SetTexture("$bumpMap","zerochain/props_methlab/meth/zmlab2_meth_cracked_nrm")
    end
    mat:SetInt("$flags",2048 + 4194304 + 134217728 + 512 ) // model + normalmapalphaenvmapmask + halflambert + $multipass

    local qual_fract = (1 / 100) * MethQuality

    local col = MethData.color

    mat:SetFloat("$phongexponent",5 * qual_fract) // DOES NOT WORK
    mat:SetFloat("$phongboost",5 * qual_fract) // DOES NOT WORK
    mat:SetFloat("$envmapfresnel",1 * qual_fract)

    local h,s,v = ColorToHSV(col)
    s = s * qual_fract

    //local reflect_strength = 0.25

    local col_vec = zmlab2.util.ColorToVector(HSVToColor(h,s,v))
    mat:SetVector("$phongtint",col_vec) // DOES NOT WORK
    mat:SetVector("$envmaptint",Vector(col_vec.x * qual_fract,col_vec.y * qual_fract,col_vec.z * qual_fract))
    mat:SetVector("$color2",col_vec)

    mat:Recompute()

    zmlab2.Meth.Materials[mat_name] = mat

    return mat_name
end

function zmlab2.Meth.GetValue(MethType,MethAmount,MethQuality)
    return (zmlab2.config.MethTypes[MethType].price * MethAmount) * ((1 / 100) * MethQuality)
end

function zmlab2.Meth.GetMixTime(MethType)
    return zmlab2.config.MethTypes[MethType] and zmlab2.config.MethTypes[MethType].mix_time or 60
end

function zmlab2.Meth.GetVentTime(MethType)
    return zmlab2.config.MethTypes[MethType] and zmlab2.config.MethTypes[MethType].vent_time or 60
end

function zmlab2.Meth.GetFilterTime(MethType)
    return zmlab2.config.MethTypes[MethType] and zmlab2.config.MethTypes[MethType].filter_time or 60
end

function zmlab2.Meth.GetColor(MethType)
    return zmlab2.config.MethTypes[MethType] and zmlab2.config.MethTypes[MethType].color or Color(255,255,255,255)
end

function zmlab2.Meth.GetDifficulty(MethType)
    return zmlab2.config.MethTypes[MethType] and math.Clamp(zmlab2.config.MethTypes[MethType].difficulty or 1,1,10)
end
