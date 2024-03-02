TEAM_VALLKOV = DarkRP.createJob("*WL* Famille Valkov", {
    color = Color(0, 0, 0, 255),
          model = {"models/knyaje pack/sso_rf/sso_trooper.mdl", "models/player/ocelot.mdl"},
    description = [[
  WL pour Reaper.
  Catéorie d'armes : ★★★★
  Printer : ✔
  Racket : ✔
  ]],
    weapons = {   "weapon_fists", "advancedrobbery_cellphone", "jewelry_robbery_hammer", "tfa_luger", "salute"},
    command = "valkov",
    max = 6,
    salary = 2000,
    admin = 0,
    category = "Perso",
    etoiles = 4,
    vote = false,
    hasRadio = true,
    hasLicense = true,
    jobType = "job",
  
    PlayerDeath = function(ply, weapon, killer)
  
          ply:teamBan()
          ply:changeTeam(GAMEMODE.DefaultTeam, true)
    end,
  })  