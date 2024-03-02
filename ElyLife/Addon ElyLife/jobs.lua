hook.Add('RP_CustomJobs', 'gmodlife', function()
      local GAMEMODE = GM
  
      TEAM_CITIZEN = DarkRP.createJob("Citoyen", {
            color = Color(20, 150, 20,  255),
            model = {"models/player/Group01/female_01.mdl", "models/player/Group01/female_02.mdl", "models/player/Group01/female_03.mdl", "models/player/Group01/female_04.mdl", "models/player/Group01/female_05.mdl", "models/player/Group01/female_06.mdl", "models/player/Group01/male_01.mdl", "models/player/Group01/male_02.mdl", "models/player/Group01/male_03.mdl", "models/player/Group01/male_04.mdl", "models/player/Group01/male_05.mdl", "models/player/Group01/male_06.mdl", "models/player/Group01/male_07.mdl", "models/player/mossman_arctic.mdl", "models/player/Group01/male_08.mdl", "models/player/Group01/male_09.mdl", "models/player/Group02/male_02.mdl", "models/player/Group02/male_04.mdl", "models/player/Group02/male_06.mdl", "models/player/Group02/male_08.mdl"},
            description = [[
  Vous êtes un habitant de la ville.
  Il vous est autorisé de printer !
  Pour tout action spécifique autre que celles permises par les métiers existant sur nos serveurs, vous êtes en droit (sur accord du staff quant à l’action que vous souhaitez mener) de requalifier votre métier par un /job.
  L’utilisation d’une arme légère avec licence est autorisée uniquement si votre vie est dans un cas de danger majeur.
  Il vous est conseillé, pour un citoyen, de rester le plus neutre possible et d’être un citoyen habituel qui vit sa vie sans aucun problème.
  Vous ne devez jamais vous trouver à l'intérieur du périmètre de sécurité mise en place par les force de l’ordre lors d’un braquage de banque ou même à proximité sous peine d’une sanction lourde.
                
  Catéorie d'armes : ★
  Printer : ✔
  Racket : ✘
      ]],
            weapons = { "weapon_fists"},
            command = "citizen",
            max = 0,
            salary = 0,
            jobType = "job",
            admin = 0,
            etoiles = 1,
            category = "Citoyen",
            vote = false,
            hasLicense = false,
            candemote = false,
            PlayerDeath = function(ply, weapon, killer)
                  ply:teamBan()
                  ply:changeTeam(GAMEMODE.DefaultTeam, true)
            end,
      })
  
       TEAM_GOUVERNEUR = DarkRP.createJob("*WL* Gouverneure", {
            color = Color(173, 45, 18, 255),
            model = { 
            "models/player/suits/male_04_open_tie.mdl",

  },
            description = [[ Vous êtes Gouverneur]],
            weapons = { "weapon_fists","weapon_rdo_radio"},
            command = "gouverneur",
            max = 1,
            etoiles = 1,
            salary = 400,
            admin = 0,
            vote = false,
            hasLicense = true,
            candemote = false,
            category =  "Gouvernement",
            PlayerDeath = function(ply, weapon, killer)
                ply:teamBan(TEAM_GOUVERNEUR,120)
                ply:changeTeam(GAMEMODE.DefaultTeam, true)
            end
      }) 
  
      TEAM_VGOUVERNEUR = DarkRP.createJob("*WL* Vice-Gouverneur", {
            color = Color(173, 45, 18, 255),
            model = { 
            "models/player/suits/male_08_closed_coat_tie.mdl",
  },
            description = [[ Vous êtes Vice-Gouverneur]],
            weapons = { "weapon_fists","weapon_rdo_radio"},
            command = "vgouverneur",
            max = 1,
            etoiles = 1,
            salary = 400,
            admin = 0,
            vote = false,
            hasLicense = true,
            candemote = false,
            category =  "Gouvernement",
            PlayerDeath = function(ply, weapon, killer)
                ply:teamBan(TEAM_VGOUVERNEU,120)
                ply:changeTeam(GAMEMODE.DefaultTeam, true)
            end
      }) 
  
      TEAM_GOUVERNEMENT = DarkRP.createJob("*WL* Gouvernement", {
            color = Color(173, 45, 18, 255),
            model = { 
            "models/player/suits/male_07_shirt_tie.mdl ",
            "models/player/suits/male_05_shirt_tie.mdl ",
            "models/player/suits/male_09_shirt_tie.mdl ",
            "models/player/suits/male_08_shirt_tie.mdl ",
            "models/player/suits/male_03_shirt_tie.mdl ",
            "models/player/suits/male_01_shirt_tie.mdl ",
       },
            description = [[ Vous êtes membre du gouvernement]],
            weapons = { "weapon_fists","weapon_rdo_radio"},
            command = "gouvernement",
            max = 8,
            etoiles = 1,
            salary = 400,
            admin = 0,
            vote = false,
            hasLicense = true,
            candemote = false,
            category =  "Gouvernement",
            PlayerDeath = function(ply, weapon, killer)
                ply:teamBan(TEAM_GOUVERNEMENT,120)
                ply:changeTeam(GAMEMODE.DefaultTeam, true)
            end
      })
  
      TEAM_SECRETSERVICE = DarkRP.createJob("*WL* Garde Républicaine", {
            color = Color(173, 45, 18, 255),
            model = { 
              "models/dannio/secretservice/secretservice.mdl",
            "models/player/police_agent/male_01_agent.mdl",
            "models/player/police_agent/male_02_agent.mdl",
            "models/player/police_agent/male_03_agent.mdl",
            "models/player/police_agent/male_04_agent.mdl",
            "models/player/police_agent/male_05_agent.mdl",
            "models/player/police_agent/male_06_agent.mdl",
            "models/player/police_agent/male_07_agent.mdl",
            "models/player/police_agent/male_08_agent.mdl",
            "models/player/police_agent/male_09_agent.mdl",
            "models/player/darkley/f_gend_01_960.mdl",
            "models/player/darkley/f_gend_02_960.mdl",
            "models/player/darkley/f_gend_03_960.mdl",
       },
            description = [[ Vous êtes membre du gouvernement]],
      weapons = { "weapon_fists","weapon_rdo_radio","weapon_cuff_police", "stunstick", "salute_swep", "cross_arms_swep", "cross_arms_infront_swep", "stungun"},
            command = "secretservice",
            max = 8,
            etoiles = 4,
            salary = 400,
            admin = 0,
            vote = false,
            hasLicense = true,
            candemote = false,
            category =  "Gouvernement",
            PlayerDeath = function(ply, weapon, killer)
                ply:teamBan(TEAM_SECRETSERVICE,120)
                ply:changeTeam(GAMEMODE.DefaultTeam, true)
            end
      }) 
  
  
  
      TEAM_CONVOYEUR = DarkRP.createJob("Convoyeur Brinks", {
            color = Color(0, 37, 255, 255),
            model = {"models/brinks/security/guard_brinks_1.mdl",
                        "models/brinks/security/guard_brinks_2.mdl",
                        "models/brinks/security/guard_brinks_3.mdl",
                        "models/brinks/security/guard_brinks_4.mdl", 
                        "models/brinks/security/guard_brinks_5.mdl",
                        "models/brinks/security/guard_brinks_6.mdl",
                        "models/brinks/security/guard_brinks_7.mdl",
                        "models/brinks/security/guard_brinks_8.mdl", 
                        "models/brinks/security/guard_brinks_9.mdl"},
            description = [[
      Allez transportez de l'argent votre camion est blindé
      
      Catéorie d'armes : ✘✘✘✘
      Printer : ✘ 
      Racket : ✘]],
      weapons = {"weapon_rdo_radio","weapon_fists", "tfa_bcry2_scarab"},
            command = "convoyeur",
            max = 4,
            salary = 20,
            etoiles = 4,
            admin = 0,
            jobType = "job",
            category = "Citoyen",
            vote = false,
            hasLicense = false,
      
            PlayerDeath = function(ply, weapon, killer)
      
                  ply:teamBan()
                  ply:changeTeam(GAMEMODE.DefaultTeam, true)
            end,
  
  
      })
  
  
      TEAM_CONVOYEUR_VIP = DarkRP.createJob("*VIP* Convoyeur Brinks", {
            color = Color(0, 37, 255, 255),
            model = {"models/brinks/security/guard_brinks_1.mdl",
                        "models/brinks/security/guard_brinks_2.mdl",
                        "models/brinks/security/guard_brinks_3.mdl",
                        "models/brinks/security/guard_brinks_4.mdl", 
                        "models/brinks/security/guard_brinks_5.mdl",
                        "models/brinks/security/guard_brinks_6.mdl",
                        "models/brinks/security/guard_brinks_7.mdl",
                        "models/brinks/security/guard_brinks_8.mdl", 
                        "models/brinks/security/guard_brinks_9.mdl"},
            description = [[
            Allez transportez de l'argent votre camion est blindé
      
            Catéorie d'armes : ✘✘✘✘
            Printer : ✘ 
            Racket : ✘]],
      weapons = {"weapon_rdo_radio","weapon_fists", "tfa_bcry2_scarab"},
            command = "convoyeurvip",
            max = 2,
            salary = 20,
            etoiles = 4,
            admin = 0,
            jobType = "job",
            category = "Citoyen",
            vote = false,
            hasLicense = false,
            customCheck = function(ply)
        return ElyConfig.Checks.NeedRank("vip", ply)
            end,
            PlayerDeath = function(ply, weapon, killer)
      
                  ply:teamBan()
                  ply:changeTeam(GAMEMODE.DefaultTeam, true)
            end,
  
  
      })
  
      TEAM_HIT = DarkRP.createJob("*VIP* Tueur à gages", {
            color = Color(20, 20, 255, 255),
            model = {"models/Humans/Group01/Female_01.mdl"},
            description = [[
  Vous êtes un tueur à gages, vous devez effectuer les contrats que vous recevez sur votre téléphone.
  Il vous est INTERDIT de printer
  Il vous est INTERDIT de racketter
  Vous devez éliminer vos cibles dans la plus grande discrétion
  Vous devez utiliser UNIQUEMENT les armes qui vous sont fournies avec votre métier
                
  Catéorie d'armes : ★★★★
  Printer : ✘
  Racket : ✘
  ]],
            weapons = {"weapon_fists", "door_ram", "weapon_checker", "weapon_cuff_police"},
            command = "chirref",
            max = 3,
            admin = 0,
            salary = 80,
            jobType = "job",
            hasLicense = true,
            category = "VIP",
            etoiles = 2,
            chief = true,
            hasRadio = true,
            candemote = false,
            customCheck = function(ply)
        return ElyConfig.Checks.NeedRank("vip", ply)
            end,
            jobType = "vip",
            PlayerDeath = function(ply, weapon, killer)
                  ply:teamBan()
                  ply:changeTeam(GAMEMODE.DefaultTeam, true)
            end,
      })
  
      TEAM_BAC = DarkRP.createJob("*VIP* BAC", {
            color = Color(20, 150, 20, 255),
            model = {"models/player/Group01/female_01.mdl", "models/player/Group01/female_02.mdl", "models/player/Group01/female_03.mdl", "models/player/Group01/female_04.mdl", "models/player/Group01/female_05.mdl", "models/player/Group01/female_06.mdl", "models/player/Group01/male_01.mdl", "models/player/Group01/male_02.mdl", "models/player/Group01/male_03.mdl", "models/player/Group01/male_04.mdl", "models/player/Group01/male_05.mdl", "models/player/Group01/male_06.mdl", "models/player/Group01/male_07.mdl", "models/player/mossman_arctic.mdl", "models/player/Group01/male_08.mdl", "models/player/Group01/male_09.mdl", "models/player/Group02/male_02.mdl", "models/player/Group02/male_04.mdl", "models/player/Group02/male_06.mdl", "models/player/Group02/male_08.mdl"},
  
            description = [[
  Vous êtes un agent de police en civil, la traque des criminels est votre devoir.
  Le commissaire & le RAID sont vos supérieurs hiérarchiques. Les gardiens de la paix sont au même grade que vous.
  Lorsque vous parvenez à infiltrer un gang, vous êtes autorisés à utiliser les armes du métier que vous avez infiltré.
  Vous devrez utiliser un véhicule banalisé lors de vos déplacements.
  Il vous est INTERDIT de rentrer dans une maison sans mandat si vous n'y avez pas été invité (infiltration).
  
  Catéorie d'armes : ★
  Printer : ✘
  Racket : ✘
      ]],
      weapons = { "weapon_morpher", "salute", "weapon_rpt_stungun", "weapon_fists", "stungun", "arrest_stick", "unarrest_stick", "tfa_colt1911", "nightstick", "door_ram", "weapon_checker", "weapon_rpt_handcuff","weapon_rdo_radio","policebadge","weapon_rpt_finebook"},
            command = "bac",
            max = 4,
            salary = 50,
            category = "Police",
            etoiles = 1,
            admin = 0,
            vote = false,
            customCheck = function(ply)
        return ElyConfig.Checks.NeedRank("vip", ply)
            end,
            hasLicense = true,
            jobType = "vip",
            hasRadio = true,
            PlayerDeath = function(ply, weapon, killer)
                  ply:teamBan()
                  ply:changeTeam(GAMEMODE.DefaultTeam, true)
            end,
      })
  
      TEAM_PSYCO = DarkRP.createJob("*VIP* Psycopathe", {
            color = Color(20, 150, 20, 255),
            model = {"models/player/Group01/female_01.mdl", "models/player/Group01/female_02.mdl", "models/player/Group01/female_03.mdl", "models/player/Group01/female_04.mdl", "models/player/Group01/female_05.mdl", "models/player/Group01/female_06.mdl", "models/player/Group01/male_01.mdl", "models/player/Group01/male_02.mdl", "models/player/Group01/male_03.mdl", "models/player/Group01/male_04.mdl", "models/player/Group01/male_05.mdl", "models/player/Group01/male_06.mdl", "models/player/Group01/male_07.mdl", "models/player/mossman_arctic.mdl", "models/player/Group01/male_08.mdl", "models/player/Group01/male_09.mdl", "models/player/Group02/male_02.mdl", "models/player/Group02/male_04.mdl", "models/player/Group02/male_06.mdl", "models/player/Group02/male_08.mdl"},
  
            description = [[
  Vous êtes un fou. Votre rôle est de tuer en toute discrétion, uniquement dans des endroits sombre et sans témoins.
  Il est OBLIGATOIRE de tuer vos victimes au couteau et/ou à la machette.
  Vous devez tuer vos victimes les unes après les autres. Vous ne pouvez pas rassembler plusieurs personnes pour les tuer ensemble.
  
  Catéorie d'armes : ★
  Printer : ✘
  Racket : ✘
  ]],
            weapons = { "weapon_fists", "tfa_apex_kunai", "weapon_chainsaw_new", "yurie_eft_usvr_taiga"},
            command = "psyco",
            max = 4,
            salary = 0,
            admin = 0,
            category = "VIP",
            etoiles = 1,
            vote = false,
            hasLicense = false,
            customCheck = function(ply)
        return ElyConfig.Checks.NeedRank("vip", ply)
            end,
            PlayerDeath = function(ply, weapon, killer)
                  ply:teamBan()
                  ply:changeTeam(GAMEMODE.DefaultTeam, true)
            end,
      })
  
      TEAM_MAYOR = DarkRP.createJob("Maire", {
            color = Color(150, 20, 20, 255),
            model = {"models/player/emmanuel_macron.mdl"},
            description = [[
  Le maire est élu par les habitants de la ville de Rockford au suffrage universel direct (vote codé).
  Une fois élu, vous avez le choix entre contribuer au bonheur des citoyens (démocratie) ou instaurer une terrible dictature !
  Vous avez 15 minutes pour faire votre tableau des lois ET ENSUITE votre protection. Vos lois doivent être compatibles avec les règles Elysion RP.
  Il est INTERDIT de donner l'ordre aux policiers & aux gardes de tirer à vue !
  Il est aussi INTERDIT d’enlever sa dictature lors d’une attaque pour sauver sa peau.
  Une dictature implique que les délits RP deviennent tous légaux (il s’agit de le préciser dans les lois). Vous êtes autorisé à printer pendant une dictature.
  Lorsque vous prévoyez un événements (Exemple : concert, course...). Vous devez embaucher du personnel (UNIQUEMENT DES CITOYENS AYANT UTILISÉ LE /JOB) pour les préparatifs de vos événements et bien évidemment les payer.
  Il vous est interdit de construire vous-même en dehors de la mairie.
  
  Catéorie d'armes : ★
  Printer : ✔
  Racket : ✘
      ]],
            weapons = { "weapon_fists","weapon_rdo_radio"},
            command = "mayor",
            max = 1,
            salary = 125,
            vote = true,
            category = "Maire",
            etoiles = 1,
            admin = 0,
            hasLicense = false,
            mayor = true,
            hasRadio = true,
            PlayerDeath = function(ply, weapon, killer)
                  ply:teamBan()
  
                  if killer:IsPlayer() then
                        DarkRP.notifyAll(0, 4, "Le Maire est mort.")
                  else
                        DarkRP.notifyAll(0, 4, "Le Maire est mort.")
                  end
            end,
      })
  
      TEAM_ADMIN = DarkRP.createJob("Administrateur", {
            color = Color(75, 0, 130, 255),
            model = {"models/Buffed/Paimon.mdl"},
            description = [[Job pour les admins.]],
            weapons = { "weapon_fists", "unarrest_stick", "weapon_checker"},
            command = "admin",
            max = 20,
            salary = 350,
            admin = 0,
            vote = false,
            customCheck = function(ply)
                  return ply:IsAdmin()
            end,
            hasLicense = true,
            jobType = "job",
            candemote = false,
            hasRadio = true,
            PlayerLoadout = function(ply)
                    ply:SetHealth(99999999)
                end,
            PlayerDeath = function(ply, weapon, killer)
                  ply:teamBan()
                  ply:changeTeam(GAMEMODE.DefaultTeam, true)
            end,
      })
  
      TEAM_POLICE = DarkRP.createJob("Gardien de la Paix", {
            color = Color(25, 25, 170, 255),
            model = {"models/kerry/citizens/male_01_police.mdl", 
                     "models/kerry/citizens/male_02_police.mdl", 
                     "models/kerry/citizens/male_03_police.mdl", 
                     "models/kerry/citizens/male_04_police.mdl", 
                     "models/kerry/citizens/female_01_police.mdl"},
            description = [[
  Vous faites partie de la Police Nationale. Votre rôle est de faire respecter les lois du maire et de protéger la population.
  
  Vous devez obéir aux ordres du commissaire et du RAID.
  Il vous est interdit de sortir votre arme en pleine rue sans raison.
  Pour entrer dans une habitation ou commerce, il vous faut impérativement un mandat valide, c’est-à-dire avec une raison valable.
  Il est INTERDIT d’effectuer des “CONTRÔLES de ROUTINE”. Il est donc INTERDIT de fouiller une personne aléatoirement. En revanche, il est autorisé de procéder à un contrôle d’identité aléatoirement.
  Dans le cas d’un code X lancé par le RAID, vous ne pourrez pas aider le maire. Par conséquent, vous devrez être du côté du RAID.
  
  Cadet / Recrue = Arme de poing
  Brigadier/Major = Pistolet mitrailleur
  Lieutenant à Commandant = Fusil d’assaut et Pompe
  
  Catéorie d'armes : ★★★
  Printer : ✘
  Racket : ✘  ]],
            weapons = {"weapon_rpt_stungun", "weapon_fists","weapon_rdo_radio","salute", "tfa_colt1911", "nightstick", "door_ram", "weapon_checker", "weapon_rpt_handcuff", "policebadge","weapon_rpt_finebook"},
            command = "cp",
            max = 25,
            salary = 20,
            admin = 0,
            jobType = "job",
            category = "Police",
            etoiles = 2,
            hasLicense = true,
            hasRadio = true,
            PlayerDeath = function(ply, weapon, killer)
                  ply:teamBan()
                  ply:changeTeam(GAMEMODE.DefaultTeam, true)
            end,
      })
  
  
      TEAM_CPOLICE = DarkRP.createJob("GDLP - Officiers", {
            color = Color(25, 25, 170, 255),
            model = {"models/player/eliot/policefrmod_02.mdl",
            "models/player/eliot/policefrmod_03.mdl"},
            description = [[
  Vous faites partie de la Police Nationale. Votre rôle est de faire respecter les lois du maire et de protéger la population.
  
  Vous devez obéir aux ordres du commissaire.
  Il vous est interdit de sortir votre arme en pleine rue sans raison.
  Pour entrer dans une habitation ou commerce, il vous faut impérativement un mandat valide, c’est-à-dire avec une raison valable.
  Il est INTERDIT d’effectuer des “CONTRÔLES de ROUTINE”. Il est donc INTERDIT de fouiller une personne aléatoirement. En revanche, il est autorisé de procéder à un contrôle d’identité aléatoirement.
  
  Cadet / Recrue = Arme de poing
  Brigadier/Major = Pistolet mitrailleur
  Lieutenant à Commandant = Fusil d’assaut et Pompe
  
  Catéorie d'armes : ★★★
  Printer : ✘
  Racket : ✘  ]],
            weapons = {"weapon_rpt_stungun","weapon_fists","weapon_rdo_radio","salute", "tfa_colt1911", "nightstick", "door_ram", "weapon_checker", "weapon_rpt_handcuff", "policebadge","weapon_rpt_finebook"},
            command = "cpo",
            max = 25,
            salary = 20,
            admin = 0,
            jobType = "job",
            category = "Police",
            etoiles = 4,
            hasLicense = true,
            hasRadio = true,
            PlayerDeath = function(ply, weapon, killer)
                  ply:teamBan()
                  ply:changeTeam(GAMEMODE.DefaultTeam, true)
            end,
      })
  
      TEAM_HCCOMMANDEMENT = DarkRP.createJob("HC de Commandement", {
            color = Color(25, 25, 170, 255),
            model = {"models/kerry/citizens/male_01_police.mdl", "models/kerry/citizens/male_02_police.mdl", "models/kerry/citizens/male_03_police.mdl", "models/kerry/citizens/male_04_police.mdl", "models/kerry/citizens/female_01_police.mdl", "models/player/police_agent/male_02_agent.mdl", "models/player/police_agent/male_04_agent.mdl", "models/player/police_agent/male_07_agent.mdl", "models/player/police_agent/male_09_agent.mdl"},
            description = [[
  Vous faites partie de la Police Nationale. Votre rôle est de faire respecter les lois du maire et de protéger la population.
  
  Vous devez obéir aux ordres du commissaire.
  Il vous est interdit de sortir votre arme en pleine rue sans raison.
  Pour entrer dans une habitation ou commerce, il vous faut impérativement un mandat valide, c’est-à-dire avec une raison valable.
  Il est INTERDIT d’effectuer des “CONTRÔLES de ROUTINE”. Il est donc INTERDIT de fouiller une personne aléatoirement. En revanche, il est autorisé de procéder à un contrôle d’identité aléatoirement.
  
  Cadet / Recrue = Arme de poing
  Brigadier/Major = Pistolet mitrailleur
  Lieutenant à Commandant = Fusil d’assaut et Pompe
  
  Catéorie d'armes : ★★★
  Printer : ✘
  Racket : ✘  ]],
            weapons = {"weapon_rpt_stungun","weapon_fists","weapon_rdo_radio","salute", "tfa_colt1911", "nightstick", "door_ram", "weapon_checker", "weapon_rpt_handcuff", "policebadge","weapon_rpt_finebook"},
            command = "hccm",
            max = 25,
            salary = 20,
            admin = 0,
            jobType = "job",
            category = "Police",
            etoiles = 4,
            hasLicense = true,
            hasRadio = true,
            PlayerDeath = function(ply, weapon, killer)
                  ply:teamBan()
                  ply:changeTeam(GAMEMODE.DefaultTeam, true)
            end,
      })
  
  
  
TEAM_CHIEF = DarkRP.createJob("*WL* Commissaire", {
            color = Color(20, 20, 255, 255),
            model = {
            "models/mike/commissaire_04.mdl",
  "models/mike/commissaire_05.mdl",
  "models/mike/commissaire_07.mdl",
  "models/mike/commissaire_08.mdl",
  "models/mike/commissaire_09.mdl",
  },
            description = [[
  Vous êtes le chef de la police de Rockford !
  Vous organisez les patrouilles de vos ordres et affectez les agents de la BAC à leurs missions.
  
  Catéorie d'armes : ★★
  Printer : ✘
  Racket : ✘]],
            weapons = {"weapon_rpt_stungun", "salute","weapon_rdo_radio","weapon_fists", "tfa_colt1911", "nightstick", "door_ram", "weapon_checker", "weapon_rpt_handcuff", "policebadge", "weapon_baton","weapon_rpt_finebook"},
            command = "chief",
            max = 3,
            admin = 0,
            salary = 80,
            jobType = "job",
            hasLicense = true,
        warrant = true,
            category = "Police",
            etoiles = 4,
            chief = true,
            hasRadio = true,
            candemote = false,
            PlayerDeath = function(ply, weapon, killer)
                  ply:teamBan()
                  ply:changeTeam(GAMEMODE.DefaultTeam, true)
            end,
      })

        
      TEAM_GUNR = DarkRP.createJob("Vendeur d'armes", {
            color = Color(255, 140, 0, 255),
            model = {"models/player/Group01/female_01.mdl", "models/player/Group01/female_02.mdl", "models/player/Group01/female_03.mdl", "models/player/Group01/female_04.mdl", "models/player/Group01/female_05.mdl", "models/player/Group01/female_06.mdl", "models/player/Group01/male_01.mdl", "models/player/Group01/male_02.mdl", "models/player/Group01/male_03.mdl", "models/player/Group01/male_04.mdl", "models/player/Group01/male_05.mdl", "models/player/Group01/male_06.mdl", "models/player/Group01/male_07.mdl", "models/player/mossman_arctic.mdl", "models/player/Group01/male_08.mdl", "models/player/Group01/male_09.mdl", "models/player/Group02/male_02.mdl", "models/player/Group02/male_04.mdl", "models/player/Group02/male_06.mdl", "models/player/Group02/male_08.mdl"},
  
            description = [[
  Vous vendez des armes dans votre boutique à des gens avec ou sans licence. Il est interdit de vendre vos armes dans la rue.
  Vous pouvez engager des gardes du corps pour sécuriser votre commerce. Les mercenaires ne sont pas des garde du corps, mais il est vous est possible de faire appel à eux uniquement dans le cadre d'un contrat destiné à éliminer votre concurrence.
  Votre rôle est de vendre les armes qui vous sont données, dans votre boutique ou dont vous disposez dans votre inventaire, sans refuser d’en vendre à qui que ce soit. Mais attention aux agents infiltrés (bac) !
  Il vous est strictement interdit d'acheter des armes pour les stocker dans votre inventaire.
  
  Catéorie d'armes : ★
  Printer : ✘
  Racket : ✘
  ]],
            weapons = {"weapon_fists"},
            command = "armevendeur",
            max = 5,
            category = "Commerçant",
            etoiles = 1,
            jobType = "job",
            salary = 0,
            admin = 0,
            vote = false,
            hasLicense = false,
            PlayerDeath = function(ply, weapon, killer)
                  ply:teamBan()
                  ply:changeTeam(GAMEMODE.DefaultTeam, true)
            end,
  
      })
  
  TEAM_GARBAGECOLLECTOR = DarkRP.createJob( "Éboueur", {
            color = Color( 70, 70, 70, 255 ),
            model = "models/snowred/dab9595/hex/odessa.mdl",
            description = [[Ramassez les bennes à ordures et les poubelles dans les rues pour gagner de l'argent.]],
            weapons = {},
            command = "garbagecollector",
            max = 3,
            etoiles = 1,
            salary = 85,
            admin = 0,
            vote = false,
        category = "Citoyen",
            hasLicense = false,
        PlayerDeath = function(ply, weapon, killer)
                  ply:teamBan()
                  ply:changeTeam(GAMEMODE.DefaultTeam, true)
            end,    
      } )
  
  
      TEAM_BLACK = DarkRP.createJob("Trafiquant", {
            color = Color(255, 140, 0, 255),
            model = {"models/player/Group01/female_01.mdl", "models/player/Group01/female_02.mdl", "models/player/Group01/female_03.mdl", "models/player/Group01/female_04.mdl", "models/player/Group01/female_05.mdl", "models/player/Group01/female_06.mdl", "models/player/Group01/male_01.mdl", "models/player/Group01/male_02.mdl", "models/player/Group01/male_03.mdl", "models/player/Group01/male_04.mdl", "models/player/Group01/male_05.mdl", "models/player/Group01/male_06.mdl", "models/player/Group01/male_07.mdl", "models/player/mossman_arctic.mdl", "models/player/Group01/male_08.mdl", "models/player/Group01/male_09.mdl", "models/player/Group02/male_02.mdl", "models/player/Group02/male_04.mdl", "models/player/Group02/male_06.mdl", "models/player/Group02/male_08.mdl"},
  
            description = [[
  Vous êtes comme le vendeur d’arme, vous avez une boutique, soyez discret en vendant vos objets illégaux.
  Il vous est interdit de printer.
  Vous avez le droit d’engager un Mercenaire.
  Votre arme ne vous sert que dans le cas où vous vous retrouveriez en danger de mort imminent.
  Vous ne devez jamais vous trouver à l'intérieur du périmètre de sécurité mise en place par les force de l’ordre lors d’un braquage de banque ou même à proximité sous peine d’une sanction lourde. Agissez comme un civil.
  
  Catéorie d'armes : ★
  Printer : ✘
  Racket : ✘
  ]],
            weapons = {"weapon_fists"},
            command = "diver",
            max = 3,
            category = "Commerçant",
            etoiles = 1,
            jobType = "job",
            salary = 0,
            admin = 0,
            vote = false,
            hasLicense = false,
            PlayerDeath = function(ply, weapon, killer)
                  ply:teamBan()
                  ply:changeTeam(GAMEMODE.DefaultTeam, true)
            end,
      })
  
      -- TEAM_MOB = DarkRP.createJob("*VIP* Tueur à gages", {
      -- color = Color(25, 25, 25, 255),
      -- model = "models/player/agent_47.mdl",
      -- description = [[
      -- Vos contrats doivent être effectués de manière RolePlay, au sniper et en toute discrétion.
      -- Il est INTERDIT d'utiliser vos armes pour autre chose que l’exécution de vos contrats.
      -- Votre client doit vous informer d'un motif valable et RolePlay pour que vous acceptiez le contrat. Vous êtes autorisé à refuser un contrat dont le motif vous semble irrecevable.
      -- Il vous est interdit de printer !
      -- Catéorie d'armes : ★✖✖★
      -- Printer : ✘
      -- Racket : ✘]] ,
      -- weapons = {  "weapon_fists", "fas2_m24", "m9k_knife"},
      -- command = "mobboss",
      -- max = 2,
      -- salary = 25,
      -- admin = 0,
      -- category = "VIP",
      -- etoiles = 3,
      -- jobType = "vip",
      -- customCheck = function(ply) return table.HasValue({"VIP", "Super-Admin", "VIP+", "superadmin", "Chef-Modo", "Premium", "admin", "Moderateur"}, ply:GetNWString("usergroup")) end,
      -- hasLicense = false,
      -- OnPlayerChangedTeam = function(ply)
      -- ply:ConCommand("noclip")
      -- end,
      -- PlayerDeath = function(ply, weapon, killer)
      -- ply:teamBan()
  
      -- end,
      -- })
      TEAM_BANK = DarkRP.createJob("Banquier", {
            color = Color(89, 50, 9, 255),
            model = {"models/player/magnusson.mdl"},
            description = [[
  Vous est OBLIGATOIRE de vous installer dans la banque du centre-ville.
  Vous devez entretenir les imprimantes d’argents qui vous sont confiés par les citoyens !
  Vous ne devez pas voler l’argent des citoyens malhonnêtement mais vous êtes en droit de prélever un maigre bénéfice sur les printers qu'ils vous laissent à condition qu'ils en soient informés.
  Vous pouvez contacter les forces de l’ordre lorsque vous sentez que la banque est menacée. Vos Agents de sécurité ne peuvent pas incarcérer de braqueurs.
  
  Catéorie d'armes : ★
  Printer : ✔
  Racket : ✘
  ]],
            weapons = { "weapon_fists"},
            command = "bank",
            max = 2,
            salary = 150,
            admin = 0,
            vote = false,
            category = "Citoyen",
            etoiles = 1,
            jobType = "job",
            hasLicense = false,
            -- Insert customCheck here if you have one and want one.
            PlayerDeath = function(ply, weapon, killer)
                  ply:teamBan()
                  ply:changeTeam(GAMEMODE.DefaultTeam, true)
            end,
      })
  
      TEAM_BODYGUARD = DarkRP.createJob("Agent de Sécurité", {
            color = Color(244, 164, 96, 255),
            model = {"models/player/guard_pack/guard_01.mdl", "models/player/guard_pack/guard_02.mdl", "models/player/guard_pack/guard_03.mdl", "models/player/guard_pack/guard_04.mdl", "models/player/guard_pack/guard_05.mdl", "models/player/guard_pack/guard_06.mdl", "models/player/guard_pack/guard_07.mdl", "models/player/guard_pack/guard_08.mdl", "models/player/guard_pack/guard_09.mdl"},
            description = [[
  Vous protégez un client et son commerce d’activités légales.
  Le fusil à pompe est exceptionnellement autorisé pour les agents employés par la banque.
  Vous ne pouvez pas intervenir dans la rue ou autour de votre lieu de travail. En aucun cas, vous ne pouvez tirer dans la rue. Merci de laisser la Police faire son travail lorsque celle-ci intervient.
  
  Catéorie d'armes : ★
  Printer : ✘
  Racket : ✘
      ]],
            weapons = { "weapon_fists","weapon_rpt_stungun","nightstick", "weapon_checker", "stungun", "weapon_cuff_police"},
            command = "bodyguard",
            max = 6,
            salary = 0,
            category = "Citoyen",
            etoiles = 1,
            jobType = "job",
            admin = 0,
            vote = false,
            hasLicense = true,
            PlayerDeath = function(ply, weapon, killer)
                  ply:teamBan()
                  ply:changeTeam(GAMEMODE.DefaultTeam, true)
            end,
      })
  
      --Crips
      TEAM_CHEFCRIPZ = DarkRP.createJob("Chef Crips", {
            color = Color(33, 23, 125, 255),
            model = {"models/player/cripz/slow_3.mdl"},
            description = [[
  Vous êtes un bandit de quartier, vous ne respectez aucune loi de la ville. Vous faites des activités illégales comme racketter des gens, (Se référer aux règlements concernant le racket) rentrer chez des gens par effractions etc…
  
  Catéorie d'armes : ★★★
  Printer : ✔
  Racket : ✔
  ]],
            weapons = { "weapon_fists", "advancedrobbery_cellphone", "jewelry_robbery_hammer"},
            command = "chefcripz",
            max = 1,
            jobType = "job",
            salary = 0,
            admin = 0,
            category = "Gang",
            etoiles = 4,
            vote = false,
            hasLicense = false,
            hasRadio = true,
            PlayerDeath = function(ply, weapon, killer)
                  ply:teamBan()
                  ply:changeTeam(GAMEMODE.DefaultTeam, true)
            end,
      })
  
      TEAM_CRIPZ = DarkRP.createJob("Cripz", {
            color = Color(33, 23, 125, 255),
            model = {"models/player/cripz/slow_1.mdl", "models/player/cripz/slow_2.mdl"},
            description = [[
  Vous êtes un bandit de quartier, vous ne respectez aucune loi de la ville. Vous faites des activités illégales comme racketter des gens, (Se référer aux règlements concernant le racket) rentrer chez des gens par effractions etc…
  
  Catéorie d'armes : ★★★
  Printer : ✔
  Racket : ✔
  ]],
            weapons = { "weapon_fists", "advancedrobbery_cellphone", "jewelry_robbery_hammer"},
            command = "cripz",
            max = 10,
            category = "Gang",
            etoiles = 4,
            jobType = "job",
            salary = 0,
            admin = 0,
            vote = false,
            hasLicense = false,
            hasRadio = true,
            PlayerDeath = function(ply, weapon, killer)
                  ply:teamBan()
                  ply:changeTeam(GAMEMODE.DefaultTeam, true)
            end,
      })
  
      --Bloods
      TEAM_CHEFBLOODZ = DarkRP.createJob("*VIP* Chef Bloodz", {
            color = Color(198, 8, 0, 255),
            model = "models/player/bloodz/slow_3.mdl",
            description = [[
  Vous êtes un bandit de quartier, vous ne respectez aucune loi de la ville. Vous faites des activités illégales comme racketter des gens, (Se référer aux règlements concernant le racket) rentrer chez des gens par effractions etc…
  
  Catéorie d'armes : ★★★
  Printer : ✔
  Racket : ✔
  ]],
            weapons = { "weapon_fists", "tfa_cso2_mac10", "advancedrobbery_cellphone", "jewelry_robbery_hammer"},
            command = "chefbloodz",
            max = 1,
            jobType = "vip",
            category = "Gang",
            etoiles = 4,
            salary = 0,
            admin = 0,
            vote = false,
            hasLicense = false,
            customCheck = function(ply)
              return ElyConfig.Checks.NeedRank("vip", ply)            
            end,
            hasRadio = true,
            PlayerDeath = function(ply, weapon, killer)
                  ply:teamBan()
                  ply:changeTeam(GAMEMODE.DefaultTeam, true)
            end,
      })
  
      TEAM_BACK = DarkRP.createJob("*VIP* Prisonnier", {
            color = Color(20, 150, 20, 255),
            model = {"models/kaesar/prisonerfemale/prisonerfemale.mdl", "models/kaesar/prisonerfemale2/prisonerfemale2.mdl", "models/kaesar/prisonermale/prisonermale.mdl", "models/kaesar/prisonermale2/prisonermale2.mdl"},
            description = [[
  Vous vous êtes échapez de prison !
  
  Le monde est a vous maintenant. 
  
  Catéorie d'armes : ★★★★
  Printer : ✔
  Racket : ✔
      ]],
            weapons = { "weapon_fists", "weapon_morpher", "advancedrobbery_cellphone", "jewelry_robbery_hammer"},
            command = "bddac",
            max = 4,
            salary = 50,
            category = "VIP",
            etoiles = 4,
            admin = 0,
            vote = false,
            customCheck = function(ply)
              return ElyConfig.Checks.NeedRank("vip", ply)  
            end,
            hasLicense = true,
            jobType = "vip",
            hasRadio = true,
            PlayerDeath = function(ply, weapon, killer)
                  ply:teamBan()
                  ply:changeTeam(GAMEMODE.DefaultTeam, true)
            end,
      })
  
      TEAM_BLOODZ = DarkRP.createJob("*VIP* Bloodz", {
            color = Color(198, 8, 0, 255),
            model = {"models/player/bloodz/slow_1.mdl", "models/player/bloodz/slow_2.mdl"},
            description = [[
  Vous êtes un bandit de quartier, vous ne respectez aucune loi de la ville. Vous faites des activités illégales comme racketter des gens, (Se référer aux règlements concernant le racket) rentrer chez des gens par effractions etc…
  
  Catéorie d'armes : ★★★
  Printer : ✔
  Racket : ✔
  ]],
            weapons = { "weapon_fists", "tfa_cso2_mac10", "advancedrobbery_cellphone", "jewelry_robbery_hammer"},
            command = "bloodz",
            max = 10,
            jobType = "vip",
            salary = 0,
            category = "Gang",
            etoiles = 4,
            admin = 0,
            vote = false,
            hasLicense = false,
            customCheck = function(ply)
                  return ElyConfig.Checks.NeedRank("vip", ply)  
            end,
            hasRadio = true,
            PlayerDeath = function(ply, weapon, killer)
                  ply:teamBan()
                  ply:changeTeam(GAMEMODE.DefaultTeam, true)
            end,
      })
  
      --fin
      TEAM_CHEFPARRAIN = DarkRP.createJob("Parrain", {
            color = Color(255, 0, 127, 255),
            model = "models/vito.mdl",
            description = [[
  Vous êtes le représentant et le chef de la mafia, vous êtes celui qui prend les décisions pour l’organisation des activités de votre famille.
  Les membres de votre gang se trouvant déjà en action RP lorsque vous spawnez ne sont pas obligé de vous suivre dans vos activités.
  
  Catéorie d'armes : ★★★★
  Printer : ✔
  Racket : ✔
  ]],
            weapons = { "weapon_fists", "unarrest_stick", "weapon_cuff_standard", "advancedrobbery_cellphone", "jewelry_robbery_hammer"},
            command = "parrain",
            max = 1,
            jobType = "job",
            category = "Mafia",
            etoiles = 4,
            salary = 0,
            admin = 0,
            hasLicense = false,
            hasRadio = true,
            PlayerDeath = function(ply, weapon, killer)
                  ply:teamBan()
                  ply:changeTeam(GAMEMODE.DefaultTeam, true)
            end,
      })
  
      TEAM_VIPMAFIEUX = DarkRP.createJob("*VIP* Mafieux", {
            color = Color(255, 0, 127, 255),
            model = {"models/kerry/citizens/male_01_mafia.mdl",
             "models/kerry/citizens/male_02_mafia.mdl",
              "models/kerry/citizens/male_03_mafia.mdl",
               "models/kerry/citizens/male_04_mafia.mdl"},
           description = [[
  Vous êtes le représentant et le chef de la mafia, vous êtes celui qui prend les décisions pour l’organisation des activités de votre famille.
  Les membres de votre gang se trouvant déjà en action RP lorsque vous spawnez ne sont pas obligé de vous suivre dans vos activités.
  
  Catéorie d'armes : ★★★★
  Printer : ✔
  Racket : ✔
  ]],
            weapons = { "weapon_fists", "advancedrobbery_cellphone", "jewelry_robbery_hammer"},
            command = "vipmaffieu",
            max = 15,
            jobType = "job",
            salary = 0,
            category = "Mafia",
            etoiles = 4,
            admin = 0,
            hasLicense = false,
            hasRadio = true,
            customCheck = function(ply)
              return ElyConfig.Checks.NeedRank("vip", ply)  
                          end,
            PlayerDeath = function(ply, weapon, killer)
                  ply:teamBan()
                  ply:changeTeam(GAMEMODE.DefaultTeam, true)
            end,
      })
  
      TEAM_MAFIEUX = DarkRP.createJob("Mafieux", {
            color = Color(255, 0, 127, 255),
            model = {"models/kerry/citizens/male_01_mafia.mdl", "models/kerry/citizens/male_02_mafia.mdl", "models/kerry/citizens/male_03_mafia.mdl", "models/kerry/citizens/male_04_mafia.mdl"},
            description = [[
  Vous êtes le représentant et le chef de la mafia, vous êtes celui qui prend les décisions pour l’organisation des activités de votre famille.
  Les membres de votre gang se trouvant déjà en action RP lorsque vous spawnez ne sont pas obligé de vous suivre dans vos activités.
  
  Catéorie d'armes : ★★★★
  Printer : ✔
  Racket : ✔
  ]],
            weapons = { "weapon_fists", "advancedrobbery_cellphone", "jewelry_robbery_hammer"},
            command = "maffieu",
            max = 20,
            jobType = "job",
            salary = 0,
            category = "Mafia",
            etoiles = 4,
            admin = 0,
            hasLicense = false,
            hasRadio = true,
            PlayerDeath = function(ply, weapon, killer)
                  ply:teamBan()
                  ply:changeTeam(GAMEMODE.DefaultTeam, true)
            end,
      })
  
      TEAM_METH = DarkRP.createJob("Fabricant de meth", {
            color = Color(37, 253, 233, 255),
            model = {"models/player/Group01/female_01.mdl", "models/player/Group01/female_02.mdl", "models/player/Group01/female_03.mdl", "models/player/Group01/female_04.mdl", "models/player/Group01/female_05.mdl", "models/player/Group01/female_06.mdl", "models/player/Group01/male_01.mdl", "models/player/Group01/male_02.mdl", "models/player/Group01/male_03.mdl", "models/player/Group01/male_04.mdl", "models/player/Group01/male_05.mdl", "models/player/Group01/male_06.mdl", "models/player/Group01/male_07.mdl", "models/player/mossman_arctic.mdl", "models/player/Group01/male_08.mdl", "models/player/Group01/male_09.mdl", "models/player/Group02/male_02.mdl", "models/player/Group02/male_04.mdl", "models/player/Group02/male_06.mdl", "models/player/Group02/male_08.mdl"},
            description = [[
  Vous fabriquez de la Meth en toute discrétion.
  Si quelqu’un essaye de s’introduire chez vous, vous pouvez l’abattre, même s’il s’agit d'un représentant de la loi.
  À propos :
  
  Personne ne peut entendre le bruit de la confection de la Weed/Meth, ni la voir depuis l’extérieur du bâtiment où elle est produite. (Règle du Metagaming)​
  
  Catéorie d'armes : ★
  Printer : ✔
  Racket : ✘
  ]],
            weapons = { "weapon_fists"},
            command = "mehjh",
            max = 4,
            jobType = "job",
            salary = 0,
            category = "Citoyen",
            etoiles = 1,
            admin = 0,
            vote = false,
            hasLicense = false,
            PlayerDeath = function(ply, weapon, killer)
                  ply:teamBan()
                  ply:changeTeam(GAMEMODE.DefaultTeam, true)
            end,
      })
  
 TEAM_ZGO2_BASIC = DarkRP.createJob("Fabricant de Weed", {
  color = Color(57, 179, 0, 255),
  model = {"models/player/odessa.mdl"},
  description = [[Vous fabriquez de la Weed en toute discrétion.
  Si quelqu’un essaye de s’introduire chez vous, vous pouvez l’abattre, même s’il s’agit d'un représentant de la loi.
  À propos :
  
  
  Personne ne peut entendre le bruit de la confection de la Weed/Meth, ni la voir depuis l’extérieur du bâtiment où elle est produite. (Règle du Metagaming)​
  
  Catéorie d'armes : ★
  Printer : ✔
  Racket : ✘
  ]],
  weapons = {"zgo2_multitool", "weapon_fists"},
  command = "zgo2_basic",
    jobType = "job",
    etoiles = 1,
  max = 4,
  salary = 0,
  admin = 0,
  vote = false,
  category = "Citoyen",
    hasLicense = true,
    PlayerDeath = function(ply, weapon, killer)
                  ply:teamBan()
                  ply:changeTeam(GAMEMODE.DefaultTeam, true)
            end,
})

TEAM_ZGO2_PRO = DarkRP.createJob("[VIP] Fabricant de Weed", {
  color = Color(57, 179, 0, 255),
  model = {"models/player/odessa.mdl"},
  description = [[Vous fabriquez de la Weed en toute discrétion.
  Si quelqu’un essaye de s’introduire chez vous, vous pouvez l’abattre, même s’il s’agit d'un représentant de la loi.
  À propos :
  
  
  Personne ne peut entendre le bruit de la confection de la Weed/Meth, ni la voir depuis l’extérieur du bâtiment où elle est produite. (Règle du Metagaming)​
  
  Catéorie d'armes : ★
  Printer : ✔
  Racket : ✘
  ]],
  weapons = {"zgo2_multitool", "weapon_fists"},
  command = "zgo2_pro",
    jobType = "job",
    etoiles = 1,
  max = 4,
  salary = 0,
  admin = 0,
  vote = false,
  category = "Citoyen",
    customCheck = function(ply)
              return ElyConfig.Checks.NeedRank("vip", ply)  
                          end,
            hasLicense = true,
            PlayerDeath = function(ply, weapon, killer)
                  ply:teamBan()
                  ply:changeTeam(GAMEMODE.DefaultTeam, true)
            end,
})  
        
TEAM_ZBF_MINER = DarkRP.createJob("Mineur de cryptomonnaies", {
  color = Color(111, 150, 97, 255),
  model = {"models/player/Group01/female_01.mdl", "models/player/Group01/female_02.mdl", "models/player/Group01/female_03.mdl", "models/player/Group01/female_04.mdl", "models/player/Group01/female_05.mdl", "models/player/Group01/female_06.mdl", "models/player/Group01/male_01.mdl", "models/player/Group01/male_02.mdl", "models/player/Group01/male_03.mdl", "models/player/Group01/male_04.mdl", "models/player/Group01/male_05.mdl", "models/player/Group01/male_06.mdl", "models/player/Group01/male_07.mdl", "models/player/mossman_arctic.mdl", "models/player/Group01/male_08.mdl", "models/player/Group01/male_09.mdl", "models/player/Group02/male_02.mdl", "models/player/Group02/male_04.mdl", "models/player/Group02/male_06.mdl", "models/player/Group02/male_08.mdl"},
  description = [[Catéorie d'armes : ★
  Printer : ✔
  Racket : ✘]],
  weapons = {},
  command = "zbl_cryptominer",
    jobType = "job",
  max = 5,
  salary = 0,
  admin = 0,
    etoiles = 1,
  vote = false,
  category = "Citoyen",
            hasLicense = false,
            PlayerDeath = function(ply, weapon, killer)
                  ply:teamBan()
                  ply:changeTeam(GAMEMODE.DefaultTeam, true)
            end,
})

TEAM_ZBF_HACKER = DarkRP.createJob("Hackeur", {
  color = Color(111, 150, 97, 255),
  model = {"models/player/Group01/female_01.mdl", "models/player/Group01/female_02.mdl", "models/player/Group01/female_03.mdl", "models/player/Group01/female_04.mdl", "models/player/Group01/female_05.mdl", "models/player/Group01/female_06.mdl", "models/player/Group01/male_01.mdl", "models/player/Group01/male_02.mdl", "models/player/Group01/male_03.mdl", "models/player/Group01/male_04.mdl", "models/player/Group01/male_05.mdl", "models/player/Group01/male_06.mdl", "models/player/Group01/male_07.mdl", "models/player/mossman_arctic.mdl", "models/player/Group01/male_08.mdl", "models/player/Group01/male_09.mdl", "models/player/Group02/male_02.mdl", "models/player/Group02/male_04.mdl", "models/player/Group02/male_06.mdl", "models/player/Group02/male_08.mdl"},
  description = [[ Catéorie d'armes : ★
  Printer : ✔
  Racket : ✘]],
  weapons = {},
  command = "zbl_hacker",
    jobType = "job",
  max = 5,
  salary = 0,
  admin = 0,
    etoiles = 1,
  vote = false,
  category = "Citoyen",
    hasLicense = false,
    PlayerDeath = function(ply, weapon, killer)
             ply:teamBan()
             ply:changeTeam(GAMEMODE.DefaultTeam, true)
            end,
})
  
      TEAM_COOK = DarkRP.createJob("Cuisinier", {
            color = Color(238, 99, 99, 255),
            model = "models/fearless/chef1.mdl",
            description = [[
  Vous devez nourrir la ville grâce à votre restaurant. Il est vous interdit d’utiliser des props pour construire en extérieur (sauf événement encadré par un membre du staff). Vous devez obligatoirement rester dans un espace clos prévu à cet effet.
  Vous êtes dans l’obligation de placer un four micro-onde au niveau des bureaux du maire. (Mairie)
  Il est interdit de travailler pour le compte d’une seule personne. Y COMPRIS D’UN DICTATEUR !
  Le cuisinier doit être disponible et accessible pour tous. Il évite de se promener dans la rue librement sauf pour effectuer des livraisons.
  Vous ne devez jamais vous trouver à l'intérieur du périmètre de sécurité mise en place par les force de l’ordre lors d’un braquage de banque ou même à proximité sous peine d’une sanction lourde.
  
  Catéorie d'armes : ✘
  Printer : ✘
  Racket : ✘
  ]],
            weapons = {},
            command = "cook",
            max = 3,
            category = "Citoyen",
            salary = 45,
            jobType = "job",
            admin = 0,
            vote = false,
            hasLicense = false,
            cook = true,
            PlayerDeath = function(ply, weapon, killer)
                  ply:teamBan()
                  ply:changeTeam(GAMEMODE.DefaultTeam, true)
            end,
      })
  
  
  
      -- TEAM_PRIME = DarkRP.createJob("*VIP* Chasseur de Primes", {
      -- color = Color(98, 26, 62, 255),
      -- model = {"models/minson97/bo2/harper/harper.mdl"},
      -- description = [[
      -- Vous êtes le chef des mercenaires, c’est vous qui les formez et qui les guidez vers le droit chemin.
      -- Vous donnez les ordres aux mercenaires qui sont sous vos ordres.
      -- Catéorie d'armes : ★★★★
      -- Printer : ✔
      -- Racket : ✔
      -- ]],
      -- weapons = {   "weapon_fists", "tfa_colt1911" },
      -- command = "chefmercenaire",
      -- max = 2,
      -- salary = 30,
      -- admin = 0,
      -- category = "VIP",
      -- etoiles = 4,
      -- vote = false,
      -- hasRadio = true,
      -- hasLicense = true,
      -- customCheck = function(ply) return table.HasValue({"VIP", "Super-Admin", "VIP+", "superadmin", "Divin", "Premium", "admin", "Moderateur"}, ply:GetNWString("usergroup")) end,
      -- jobType = "vip",
      -- PlayerDeath = function(ply, weapon, killer)
      -- ply:teamBan()
  
      -- end,
      -- })
      TEAM_VIPGANG = DarkRP.createJob("*VIP* Gangster", {
            color = Color(75, 75, 75, 255),
            model = {"models/kerry/citizens/male_01_suit.mdl", "models/kerry/citizens/male_02_suit.mdl", "models/kerry/citizens/male_03_suit.mdl", "models/kerry/citizens/male_04_suit.mdl"},
            description = [[
  Vous faites partie d’un réseau criminel et pratiquez des actions illégales. Vous faites des activités illégales comme racketter des gens, (Se référer aux règlements concernant le racket) rentrer chez des gens par effractions etc…
  Vous êtes autorisé à braquer la banque à condition de vous être associés aux braqueurs, ainsi qu'à organiser des prises d’otages.
  Vous êtes sous les ordres du Chef Des Gangsters si celui-ci est incarné lorsque vous spawnez.
  
  Catéorie d'armes : ★★★★
  Printer : ✔
  Racket : ✔
  ]],
            weapons = { "weapon_fists", "advancedrobbery_cellphone", "jewelry_robbery_hammer"},
            command = "vipgangster",
            max = 15,
            salary = 0,
            jobType = "job",
            admin = 0,
            vote = false,
            category = "Gangster",
            etoiles = 4,
            hasLicense = false,
            hasRadio = true,
            customCheck = function(ply)
              return ElyConfig.Checks.NeedRank("vip", ply)  
                          end,
            PlayerDeath = function(ply, weapon, killer)
                  ply:teamBan()
                  ply:changeTeam(GAMEMODE.DefaultTeam, true)
            end,
      })
  
      TEAM_GANG = DarkRP.createJob("Gangster", {
            color = Color(75, 75, 75, 255),
            model = {"models/kerry/citizens/male_01_suit.mdl", "models/kerry/citizens/male_02_suit.mdl", "models/kerry/citizens/male_03_suit.mdl", "models/kerry/citizens/male_04_suit.mdl"},
            description = [[
  Vous faites partie d’un réseau criminel et pratiquez des actions illégales. Vous faites des activités illégales comme racketter des gens, (Se référer aux règlements concernant le racket) rentrer chez des gens par effractions etc…
  Vous êtes autorisé à braquer la banque à condition de vous être associés aux braqueurs, ainsi qu'à organiser des prises d’otages.
  Vous êtes sous les ordres du Chef Des Gangsters si celui-ci est incarné lorsque vous spawnez.
  
  Catéorie d'armes : ★★★★
  Printer : ✔
  Racket : ✔
  ]],
            weapons = { "weapon_fists", "advancedrobbery_cellphone", "jewelry_robbery_hammer"},
            command = "gangster",
            max = 20,
            salary = 0,
            jobType = "job",
            admin = 0,
            vote = false,
            category = "Gangster",
            etoiles = 4,
            hasLicense = false,
            hasRadio = true,
            PlayerDeath = function(ply, weapon, killer)
                  ply:teamBan()
                  ply:changeTeam(GAMEMODE.DefaultTeam, true)
            end,
      })
  
      TEAM_CHEFGANGSTER = DarkRP.createJob("Chef des Gangsters", {
            color = Color(25, 25, 25, 255),
            model = "models/player/guerilla.mdl",
            description = [[
  Vous formez et dirigez les autres gangsters et organisez vos activités illégales.
  Les membres de votre gang se trouvant déjà en action RP lorsque vous spawnez ne sont pas obligé de vous suivre dans vos activités.
  
  Catéorie d'armes : ★★★★
  Printer : ✔
  Racket : ✔
  ]],
            weapons = { "weapon_fists", "unarrest_stick", "weapon_cuff_standard", "advancedrobbery_cellphone", "jewelry_robbery_hammer"},
            command = "chefgangster",
            max = 1,
            salary = 0,
            category = "Gangster",
            etoiles = 4,
            admin = 0,
            hasLicense = false,
            jobType = "job",
            hasRadio = true,
            PlayerDeath = function(ply, weapon, killer)
                  ply:teamBan()
                  ply:changeTeam(GAMEMODE.DefaultTeam, true)
            end,
      })
  
      TEAM_HOBO = DarkRP.createJob("SDF", {
            color = Color(80, 45, 0, 255),
            model = {"models/kerry/citizens/male_01_hobo.mdl", "models/kerry/citizens/male_02_hobo.mdl", "models/kerry/citizens/male_03_hobo.mdl", "models/kerry/citizens/male_04_hobo.mdl"},
            description = [[
  Vous mendiez et suppliez les passants pour gagner votre vie.
  Vous pouvez construire votre « cabane » dans la rue (dans la limite du raisonnable) à condition que celle-ci ne se trouve pas sur une route ou un parking.
  Les SDF ont uniquement droit aux couteaux et en dernier recours.
  Vous pouvez lancer vos excréments sur les personnes non généreuses et/ou qui vous traitent mal. (ne pas en abuser)
  Vous ne devez jamais vous trouver à l'intérieur du périmètre de sécurité mise en place par les force de l’ordre lors d’un braquage de banque ou même à proximité sous peine d’une sanction lourde.
  
  Catéorie d'armes : ★
  Printer : ✘
  Racket : ✘
  ]],
            weapons = { "weapon_fists", "weapon_bugbait", "weapon_gpee"},
            command = "hobo",
            max = 5,
            category = "Citoyen",
            salary = 0, 
            admin = 0,
            etoiles = 1,
            vote = false,
            jobType = "job",
            hasLicense = false,
            candemote = false,
            hobo = true,
            PlayerDeath = function(ply, weapon, killer)
                  ply:teamBan()
                  ply:changeTeam(GAMEMODE.DefaultTeam, true)
            end,
      })
  
      TEAM_BRA = DarkRP.createJob("Braqueur", {
            color = Color(75, 75, 75, 255),
            model = {"models/kerry/citizens/male_01_suit.mdl",
                  "models/kerry/citizens/male_02_suit.mdl",
                  "models/kerry/citizens/male_03_suit.mdl",
                  "models/kerry/citizens/male_04_suit.mdl"},
            description = [[
  Votre rôle se résume aux actions de braquage de banques, autrement dit, il vous est interdit de racketter des personnes.
  Il vous est également interdit de printer.
  Vous pouvez faire alliance avec les réseaux criminels des gangsters ou de la mafia. Vous pouvez également les trahir.
  Vous n’avez en aucun cas le droit de vous allier avec les gangs des Bloodz ou des Crips.
  
  Catéorie d'armes : ★★★★
  Printer : ✔
  Racket : ✘
  ]],
            weapons = { "weapon_fists", "advancedrobbery_cellphone", "jewelry_robbery_hammer"},
            command = "braqueur",
            max = 2,
            salary = 0,
            admin = 0,
            vote = false,
            category = "Braqueur",
            etoiles = 4,
            hasLicense = false,
            hasRadio = true,
            jobType = "job",
            PlayerDeath = function(ply, weapon, killer)
                  ply:teamBan()
                  ply:changeTeam(GAMEMODE.DefaultTeam, true)
            end,
      })
  
  TEAM_MERCENAIRE = DarkRP.createJob("*VIP* Mercenaire", {
            color = Color(98, 26, 62, 255),
                  model = {
                  "models/kerry/citizens/male_01_merrywathers.mdl",
                  "models/kerry/citizens/male_02_merrywathers.mdl",
                  "models/kerry/citizens/male_03_merrywathers.mdl",
                  "models/kerry/citizens/male_04_merrywathers.mdl"},
            description = [[
      Vous êtes un professionnel embauché par quelqu’un dans le but d’exécuter des contrats ou pour protéger un lieu / une personne.
      Votre but est de protéger votre employeur et d’éliminer les personnes qui lui sont nuisibles.
      Vos exécutions doivent être justifier par un motif RP.
      Vous n’êtes pas obligé d’être discret pour exécuter vos contrats.
      
      Catéorie d'armes : ★★★★
      Printer : ✔
      Racket : ✔
      ]],
            weapons = {   "weapon_fists", "tfa_colt1911", "advancedrobbery_cellphone", "jewelry_robbery_hammer"},
            command = "mercenaire",
            max = 20,
            salary = 25,
            admin = 0,
            category = "VIP",
            etoiles = 4,
            vote = false,
            hasRadio = true,
            hasLicense = true,
            customCheck = function(ply)               
                return ElyConfig.Checks.NeedRank("vip", ply)  
          end,
            jobType = "vip",
      
            PlayerDeath = function(ply, weapon, killer)
      
                  ply:teamBan()
                  ply:changeTeam(GAMEMODE.DefaultTeam, true)
            end,
      })
  
      TEAM_BRA = DarkRP.createJob("*VIP* Braqueur", {
            color = Color(75, 75, 75, 255),
            model = {"models/kerry/citizens/male_01_suit.mdl",
                  "models/kerry/citizens/male_02_suit.mdl",
                  "models/kerry/citizens/male_03_suit.mdl", 
                  "models/kerry/citizens/male_04_suit.mdl"},
            description = [[
  Votre rôle se résume aux actions de braquage de banques, autrement dit, il vous est interdit de racketter des personnes.
  Il vous est également interdit de printer.
  Vous pouvez faire alliance avec les réseaux criminels des gangsters ou de la mafia. Vous pouvez également les trahir.
  Vous n’avez en aucun cas le droit de vous allier avec les gangs des Bloodz ou des Crips.
  
  Catéorie d'armes : ★★★★
  Printer : ✔
  Racket : ✘
  ]],
            weapons = { "weapon_fists", "tfa_deagle", "weapon_acracker_default", "advancedrobbery_cellphone", "jewelry_robbery_hammer"},
            command = "braquefdur",
            max = 2,
            salary = 0,
            admin = 0,
            vote = false,
            hasLicense = false,
            category = "Braqueur",
            etoiles = 4,
            hasRadio = true,
            jobType = "vip",
            customCheck = function(ply)
              return ElyConfig.Checks.NeedRank("vip", ply)  
                          end,
            PlayerDeath = function(ply, weapon, killer)
                  ply:teamBan()
                  ply:changeTeam(GAMEMODE.DefaultTeam, true)
            end,
      })
  
      TEAM_THIEF = DarkRP.createJob("Voleur", {
            color = Color(20, 150, 20, 255),
            model = {"models/player/Group01/female_01.mdl", "models/player/Group01/female_02.mdl", "models/player/Group01/female_03.mdl", "models/player/Group01/female_04.mdl", "models/player/Group01/female_05.mdl", "models/player/Group01/female_06.mdl", "models/player/Group01/male_01.mdl", "models/player/Group01/male_02.mdl", "models/player/Group01/male_03.mdl", "models/player/Group01/male_04.mdl", "models/player/Group01/male_05.mdl", "models/player/Group01/male_06.mdl", "models/player/Group01/male_07.mdl", "models/player/mossman_arctic.mdl", "models/player/Group01/male_08.mdl", "models/player/Group01/male_09.mdl", "models/player/Group02/male_02.mdl", "models/player/Group02/male_04.mdl", "models/player/Group02/male_06.mdl", "models/player/Group02/male_08.mdl"},
            --Hommes
            description = [[
  Vous vous introduisez chez les gens ou les volez discrètement.
  Votre arme vous sert uniquement au cas où votre vie est en péril.
  Il vous est interdit de printer.
  Vous ne devez jamais vous trouver à l'intérieur du périmètre de sécurité mise en place par les force de l’ordre lors d’un braquage de banque ou même à proximité sous peine d’une sanction lourde. Agissez comme un civil.
  
  Catéorie d'armes : ★
  Printer : ✔
  Racket : ✘
  ]],
            weapons = { "weapon_fists", "keypad_cracker", "lockpick", "swep_pickpocket", "advancedrobbery_cellphone", "jewelry_robbery_hammer"},
            command = "thief",
            max = 8,
            salary = 0, 
            admin = 0,
            category = "Citoyen",
            etoiles = 1,
            jobType = "job",
            vote = false,
            hasLicense = false,
            PlayerDeath = function(ply, weapon, killer)
                  ply:teamBan()
                  ply:changeTeam(GAMEMODE.DefaultTeam, true)
            end,
      })
  
      TEAM_MEDIC = DarkRP.createJob("SAMU", {
            color = Color(255, 165, 51, 255),
            model = {"models/kerry/citizens/male_01_samu.mdl", "models/kerry/citizens/male_02_samu.mdl", "models/kerry/citizens/male_03_samu.mdl", "models/kerry/citizens/male_04_samu.mdl"},
            description = [[
  Vous soignez les gens dans votre hôpital ou sur place en cas d’urgence.
  Vous êtes un fonctionnaire et ne pouvez pas être l'employé d'une seule personne, ni d'un groupe de personne (gang, polices...etc.)
  Votre but est de soigner les gens le plus rapidement possible.
  Il vous est INTERDIT de soigner pendant une fusillade.
  Vous ne devez jamais vous trouver à l'intérieur du périmètre de sécurité mise en place par les force de l’ordre lors d’un braquage de banque ou même à proximité sous peine d’une sanction lourde.
  
  Catéorie d'armes : ✘
  Printer : ✘
  Racket : ✘
  ]],
            weapons = { "weapon_fist", "elysion_syringue", "weapon_defibrillator", "weapon_medkit", "elysion_medkit"},
            command = "urgentiste",
            max = 5,
            salary = 150,
            admin = 0,
            category = "Medecin",
            vote = false,
            jobType = "job",
            hasLicense = false,
            PlayerDeath = function(ply, weapon, killer)
                  ply:teamBan()
                  ply:changeTeam(GAMEMODE.DefaultTeam, true)
            end,
      })
  
  
      TEAM_GUITARISTE = DarkRP.createJob("Musicien", {
            color = Color(20, 150, 20, 255),
      model = {"models/player/Group01/female_01.mdl", "models/player/Group01/female_02.mdl", "models/player/Group01/female_03.mdl", "models/player/Group01/female_04.mdl", "models/player/Group01/female_05.mdl", "models/player/Group01/female_06.mdl", "models/player/Group01/male_01.mdl", "models/player/Group01/male_02.mdl", "models/player/Group01/male_03.mdl", "models/player/Group01/male_04.mdl", "models/player/Group01/male_05.mdl", "models/player/Group01/male_06.mdl", "models/player/Group01/male_07.mdl", "models/player/mossman_arctic.mdl", "models/player/Group01/male_08.mdl", "models/player/Group01/male_09.mdl", "models/player/Group02/male_02.mdl", "models/player/Group02/male_04.mdl", "models/player/Group02/male_06.mdl", "models/player/Group02/male_08.mdl"},
  
            description = [[
  Vous disposez d’une guitare pour accompagner votre musique.
  Vous pouvez construire une estrade pour faire des concerts à condition que celle-ci ne se trouve pas sur un parking. Vous avez le droit de demander de l’argent aux personnes assistant à votre concert.
  Vous ne devez jamais vous trouver à l'intérieur du périmètre de sécurité mise en place par les force de l’ordre lors d’un braquage de banque ou même à proximité sous peine d’une sanction lourde.
  
  Catéorie d'armes : ✘
  Printer : ✘
  Racket : ✘
  ]],
            weapons = { "weapon_fists", "guitar"},
            command = "guitariste",
            max = 1,
            salary = 0,
            admin = 0,
            category = "Citoyen",
            vote = false,
            hasRadio = true,
            jobType = "job",
            hasLicense = true,
            PlayerDeath = function(ply, weapon, killer)
                  ply:teamBan()
                  ply:changeTeam(GAMEMODE.DefaultTeam, true)
            end,
      })
  
      TEAM_BODYMAYOR = DarkRP.createJob("Garde du Maire", {
            color = Color(244, 164, 96, 255),
            model = {"models/player/smith.mdl"},
            description = [[
  Votre tôle est de protéger le Maire au péril de votre vie.
  Votre autorité s’arrête à la mairie. Vous ne pouvez intervenir uniquement sur les actions qui se déroule dans le bâtiment de la mairie. Laissez la police faire son travail.
  En dictature les gardes du maire on le droit de porter des armes ★★★.
  
  Catéorie d'armes : ★
  Printer : ✔
  Racket : ✘
  ]],
            weapons = { "weapon_fists", "nightstick", "weapon_checker", "stungun", "weapon_cuff_police"},
            command = "bodymayor",
            max = 4,
            salary = 40,
            admin = 0,
            category = "Protection",
            etoiles = 3,
            vote = false,
            jobType = "job",
            hasLicense = true,
            PlayerDeath = function(ply, weapon, killer)
                  ply:teamBan()
                  ply:changeTeam(GAMEMODE.DefaultTeam, true)
            end,
      })
  
      TEAM_TOWER = DarkRP.createJob("Garagiste", {
            color = Color(255, 165, 51, 255),
            model = "models/player/mechanic.mdl",
            description = [[
  Vous devez récupérer/dépanner les véhicules épaves ou abandonné le long des routes ainsi que ceux se trouvant en stationnement interdit.
  Il est interdit d'embarquer un véhicule de fonction en intervention. Y COMPRIS LE CAMION DES BRAQUEURS SE TROUVANT DEVANT LA BANQUE AU COURS DU BRAQUAGE DE CETTE DERNIÈRE !
  Il est interdit de placer une contravention sur un véhicule tant que vous ne l'avez emmené à la fourrière.
  Vous ne devez jamais vous trouver à l'intérieur du périmètre de sécurité mise en place par les force de l’ordre lors d’un braquage de banque ou même à proximité sous peine d’une sanction lourde.
  
  Catéorie d'armes : ✘✘
  Printer : ✘
  Racket : ✘]],
            weapons = { "weapon_fists", "vc_wrench", "tow_attach"},
            command = "tower",
            max = 4,
            salary = 20,
            admin = 0,
            jobType = "job",
            category = "Citoyen",
            vote = false,
            hasLicense = false,
            PlayerDeath = function(ply, weapon, killer)
                  ply:teamBan()
                  ply:changeTeam(GAMEMODE.DefaultTeam, true)
            end,
      })
        
      --[[ FAMILLES ELYSION ]]
        
      TEAM_JUGE = DarkRP.createJob("*WL* Juge", {
            color = Color(255, 0, 127, 255),
            model = {"models/player/kvkarakter/polat_alemdar.mdl"},
            description = [[
  Vous êtes le représentant de la justice dans cette ville, vous vous devez d'être impartial !
  
  Catéorie d'armes : ★
  Printer : ✘
  Racket : ✘
  ]],
            weapons = { "weapon_fists"},
            command = "juge",
            max = 1,
            jobType = "job",
            salary = 0,
            category = "Citoyen",
            etoiles = 1,
            admin = 0,
            hasLicense = false,
            hasRadio = true,
            PlayerDeath = function(ply, weapon, killer)
                  ply:teamBan()
                  ply:changeTeam(GAMEMODE.DefaultTeam, true)
            end,
      })
  
      TEAM_PROCUREUR = DarkRP.createJob("*WL* Procureur", {
            color = Color(255, 0, 127, 255),
            model = {"models/player/suits/male_08_open.mdl"},
            description = [[
  Vous êtes le représentant et le chef de la mafia, vous êtes celui qui prend les décisions pour l’organisation des activités de votre famille.
  Les membres de votre gang se trouvant déjà en action RP lorsque vous spawnez ne sont pas obligé de vous suivre dans vos activités.
  
  Catéorie d'armes : ★
  Printer : ✘
  Racket : ✘
  ]],
            weapons = { "weapon_fists"},
            command = "procureur",
            max = 1,
            jobType = "job",
            salary = 0,
            category = "Citoyen",
            etoiles = 1,
            admin = 0,
            hasLicense = false,
            hasRadio = true,
            PlayerDeath = function(ply, weapon, killer)
                  ply:teamBan()
                  ply:changeTeam(GAMEMODE.DefaultTeam, true)
            end,
      })
  
      TEAM_AVOCAT = DarkRP.createJob("*VIP* Avocat", {
            color = Color(255, 0, 127, 255),
            model = {"models/player/suits/male_09_open.mdl"},
            description = [[
  Vous êtes avocat, vous devez aider vos clients et les mener si possible à la victoire.
  
  Catéorie d'armes : ★
  Printer : ✘
  Racket : ✘
  ]],
            weapons = { "weapon_fists"},
            command = "avocat",
            max = 4,
            jobType = "job",
            salary = 0,
            category = "Citoyen",
            etoiles = 1,
            admin = 0,
            hasLicense = false,
            customCheck = function(ply)               
            return ElyConfig.Checks.NeedRank("vip", ply)  

          end,
            hasRadio = true,
            PlayerDeath = function(ply, weapon, killer)
                  ply:teamBan()
                  ply:changeTeam(GAMEMODE.DefaultTeam, true)
            end,
      })
         
  -- PERSO --        
 
 
        
      TEAM_WOLF = DarkRP.createJob("*WL* Organisation Wölf", {
            color = Color(0, 0, 0, 255),
                  model = {"models/knyaje pack/sso_rf/sso_trooper.mdl", "models/player/ocelot.mdl"},
            description = [[
      WL pour Reaper.
      Catéorie d'armes : ★★★★
      Printer : ✔
      Racket : ✔
      ]],
            weapons = {   "weapon_fists", "advancedrobbery_cellphone", "jewelry_robbery_hammer", "tfa_luger", "salute"},
            command = "wolf",
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
      
      
  
      TEAM_BRUSCA = DarkRP.createJob("*WL* Famille Brusca", {
        color = Color(0, 0, 0, 255),
        model = {"models/almeida.j/mafia/sentrybusi3male2pm.mdl",
        "models/almeida.j/mafia/sentrybusi3male4pm.mdl",
        "models/almeida.j/mafia/sentrybusi3male6pm.mdl",
        "models/almeida.j/mafia/sentrybusi3male7pm.mdl",
        "models/almeida.j/mafia/sentrybusi3male8pm.mdl",
         "models/almeida.j/mafia/sentrychibossmale2pm.mdl",
        "models/almeida.j/mafia/sentrychibossmale4pm.mdl",
        "models/almeida.j/mafia/sentrychibossmale6pm.mdl",
        "models/almeida.j/mafia/sentrychibossmale7pm.mdl",
       "models/almeida.j/mafia/sentrychibossmale8pm.mdl",
       "models/almeida.j/mafia/sentryhighsecmale2pm.mdl",
       "models/almeida.j/mafia/sentryhighsecmale4pm.mdl",
       " models/almeida.j/mafia/sentryhighsecmale6pm.mdl",
       "models/almeida.j/mafia/sentryhighsecmale7pm.mdl",
       " models/almeida.j/mafia/sentrykorbossmale2pm.mdl",
       "models/almeida.j/mafia/sentrykorbossmale4pm.mdl",
        "models/almeida.j/mafia/sentrykorbossmale6pm.mdl",
        "models/almeida.j/mafia/sentrykorbossmale7pm.mdl",
        "models/almeida.j/mafia/sentrykorbossmale8pm.mdl",
        "models/almeida.j/mafia/sentrykorlitmale2pm.mdl",
        "models/almeida.j/mafia/sentrykorlitmale4pm.mdl",
        "models/almeida.j/mafia/sentrykorlitmale6pm.mdl",
        "models/almeida.j/mafia/sentrykorlitmale7pm.mdl",
        "models/almeida.j/mafia/sentrykorlitmale8pm.mdl",
        "models/kerry/player/merriweather/male_02.mdl",
        "models/kerry/player/merriweather/male_04.mdl",
        "models/kerry/player/merriweather/male_06.mdl",
        "models/kerry/player/merriweather/male_07.mdl",
        "models/kerry/player/merriweather/male_08.mdl",
        "models/smalls_civilians/pack1/puffer_male_02_pm.mdl",
        "models/smalls_civilians/pack1/puffer_male_04_pm.mdl",
        "models/smalls_civilians/pack1/puffer_male_07_pm.mdl",
        "models/smalls_civilians/pack1/zipper_female_01_pm.mdl"
      },
        description = [[
            Job Perso
            Catéorie d'armes : ★★★★
            Printer : ✔
            Racket : ✔  
            ]],
        weapons = {   "weapon_fists", "advancedrobbery_cellphone", "jewelry_robbery_hammer", "tfa_luger", "salute"},
        command = "brusca",
        max = 20,
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

     TEAM_COSANOSTRA = DarkRP.createJob("*WL* Famille Cosa Nostra", {
      color = Color(0, 0, 0, 255),
      model = {"models/player/spike/michael.mdl",
      "models/player/spike/requiem.mdl",
      "models/player/spike/owly.mdl"
    },
      description = [[
          Job Perso
          Catéorie d'armes : ★★★★
          Printer : ✔
          Racket : ✔  
          ]],
      weapons = {   "weapon_fists", "advancedrobbery_cellphone", "jewelry_robbery_hammer", "tfa_luger", "salute"},
      command = "cosa",
      max = 20,
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
        
        TEAM_VALLKOV = DarkRP.createJob("*WL* Famille Valkov", {
    	color = Color(0, 0, 0, 255),
          model = {"models/knyaje pack/sso_rf/sso_trooper.mdl", "models/player/ocelot_npc.mdl"},
   		 description = [[
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

      TEAM_JELINSKI = DarkRP.createJob("*WL* Famille Jelinski", {
            color = Color(0, 0, 0, 255),
            model = {"models/player/male_1950.mdl",
            "models/player/female_1950.mdl",
            "models/sentry/suanro/male_01_closed_coat_tiepm.mdl",
            "models/sentry/suanro/male_02_closed_coat_tieg.mdl",
            "models/sentry/suanro/male_03_closed_coat_tiepm.mdl",
            "models/sentry/suanro/male_04_closed_coat_tiepm.mdl",
            "models/sentry/suanro/male_05_closed_coat_tiepm.mdl",
            "models/sentry/suanro/male_06_closed_coat_tiepm.mdl",
            "models/sentry/suanro/male_07_closed_coat_tiepm.mdl",
            "models/sentry/suanro/male_08_closed_coat_tiepm.mdl",
            "models/sentry/suanro/male_09_closed_coat_tiepm.mdl",
          },
            description = [[
                Job Perso
                Catéorie d'armes : ★★★★
                Printer : ✔
                Racket : ✔  
                ]],
            weapons = {   "weapon_fists", "advancedrobbery_cellphone", "jewelry_robbery_hammer", "tfa_luger", "salute"},
            command = "jelinski",
            max = 20,
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
  
     TEAM_CARTELNOCHE = DarkRP.createJob("*WL* Cartel Noche", {
        color = Color(0, 0, 0, 255),
        model = {"models/player/cagatt.mdl", "models/player/ao_blackmask.mdl",
      },
        description = [[
            Job Perso
            Catéorie d'armes : ★★★★
            Printer : ✔
            Racket : ✔  
            ]],
      weapons = {   "weapon_fists", "advancedrobbery_cellphone", "jewelry_robbery_hammer", "tfa_luger", "salute"},
      command = "cartelnoche",
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

      TEAM_OXFORDCORP = DarkRP.createJob("*WL* Oxford Corporation", {
        color = Color(0, 0, 0, 255),
        model = {"models/tfusion/playermodels/mw3/mp_africa_militia_a.mdl", "models/tfusion/playermodels/mw3/mp_africa_militia_b.mdl", "models/tfusion/playermodels/mw3/mp_africa_militia_c.mdl", "models/tfusion/playermodels/mw3/mp_africa_militia_d.mdl", "models/tfusion/playermodels/mw3/mp_opforce_ghillie_africa_militia_sniper.mdl"
      },
        description = [[
            Job Perso
            Catéorie d'armes : ★★★★
            Printer : ✔
            Racket : ✔  
            ]],
        weapons = {   "weapon_fists", "advancedrobbery_cellphone", "jewelry_robbery_hammer", "tfa_luger", "salute"},
        command = "oxfordcorp",
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




      TEAM_RAID = DarkRP.createJob("*WL* RAID", {
            color = Color(0, 68, 255),
            model = {"models/ninja/mw3/delta/delta4_masked.mdl","models/ninja/mw3/delta/delta4_masked.mdl"},
            description = [[
      WL RAID
      Catéorie d'armes : ★★★★
      Printer : ✔
      Racket : ✔  
      ]],
            weapons = { "weapon_fists", "sg_adrenaline", "garde_a_vousv1.2", "nightstick", "weapon_rpw_binoculars", "weapon_extinguisher", "weapon_sh_smokegrenade","weapon_sh_flashbang", "tfa_apex_kunai", "tfa_cso_g_deagle","wcd_speedchecker","door_ram","weapon_sh_doorcharge","tfa_ithacam37", "weapon_cuff_police", "salute", "deployable_shield", "weapon_rpt_stungun", "tfa_bcry2_scar", "weapon_rpt_handcuff", "weapon_rdo_radio", "realistic_hook", "weapon_rpt_finebook", "weapon_checker"},                         
            command = "raid",
            max = 35,
            salary = 25,
            admin = 0,
            category = "RAID",
            etoiles = 4,
            hasRadio = true,
            hasLicense = true,
            jobType = "job",
      
            PlayerDeath = function(ply, weapon, killer)
      
                  ply:teamBan()
                  ply:changeTeam(GAMEMODE.DefaultTeam, true)
            end,
      })
        
      TEAM_RAIDCHEF = DarkRP.createJob("*WL* Chef RAID", {
            color = Color(0, 68, 255),
            model = {"models/ninja/mw3/delta/delta4_masked.mdl","models/ninja/mw3/delta/delta4_masked.mdl"},
            weapons = { "weapon_fists", "sg_adrenaline", "garde_a_vousv1.2", "nightstick", "weapon_rpw_binoculars", "weapon_extinguisher", "weapon_sh_smokegrenade", "weapon_sh_flashbang", "tfa_apex_kunai", "tfa_cso_g_deagle", "tfa_cso_m1887_gold", "tfa_cso_savery", "wcd_speedchecker", "salute", "deployable_shield", "weapon_rpt_stungun", "tfa_bcry2_scar", "weapon_rpt_handcuff", "weapon_rdo_radio", "realistic_hook", "weapon_rpt_finebook"},
            description = [[
      WL RAID
      Catéorie d'armes : ★★★★
      Printer : ✔
      Racket : ✔
      ]],
            weapons = {   "weapon_fists", "sg_adrenaline", "garde_a_vousv1.2", "nightstick", "weapon_policeshield", "weapon_rpw_binoculars", "weapon_extinguisher", "weapon_sh_smokegrenade", "weapon_sh_flashbang", "tfa_apex_kunai", "tfa_cso_g_deagle", "tfa_cso_m1887_gold", "tfa_cso_savery", "wcd_speedchecker", "salute", "weapon_rpt_handcuff", "weapon_rdo_radio", "realistic_hook", "tfa_codol_spas12rad", "weapon_rpt_stungun", "weapon_rpt_finebook"},
            command = "raidchief",
            max = 1,
            salary = 25,
            admin = 0,
            category = "RAID",
            etoiles = 4,
            hasRadio = true,
            hasLicense = true,
            jobType = "job",
      
            PlayerDeath = function(ply, weapon, killer)
      
                  ply:teamBan()
                  ply:changeTeam(GAMEMODE.DefaultTeam, true)
            end,
      })
        
      TEAM_ZMLAB2_COOK = DarkRP.createJob("*Légende* Fabriquant de Meth Pro", {
            color = Color(0, 128, 255, 255),
                  model = {"models/player/Group01/female_01.mdl", "models/player/Group01/female_02.mdl", "models/player/Group01/female_03.mdl", "models/player/Group01/female_04.mdl", "models/player/Group01/female_05.mdl", "models/player/Group01/female_06.mdl", "models/player/Group01/male_01.mdl", "models/player/Group01/male_02.mdl", "models/player/Group01/male_03.mdl", "models/player/Group01/male_04.mdl", "models/player/Group01/male_05.mdl", "models/player/Group01/male_06.mdl", "models/player/Group01/male_07.mdl", "models/player/mossman_arctic.mdl", "models/player/Group01/male_08.mdl", "models/player/Group01/male_09.mdl", "models/player/Group02/male_02.mdl", "models/player/Group02/male_04.mdl", "models/player/Group02/male_06.mdl", "models/player/Group02/male_08.mdl"},
  
            description = [[
      Vous fabriquez de la Meth en toute discrétion.
      Si quelqu’un essaye de s’introduire chez vous, vous pouvez l’abattre, même s’il s’agit d'un représentant de la loi.
      À propos :
  
      Personne ne peut entendre le bruit de la confection de la Weed/Meth, ni la voir depuis l’extérieur du bâtiment où elle est produite. (Règle du Metagaming)​
  
      Catéorie d'armes : ★
      Printer : ✔
      Racket : ✘
      ]], 
            weapons = {},
            command = "zmlab2_MethCook",
            max = 5,
            salary = 45,
            admin = 0,
            vote = false,
            hasLicense = false,
            candemote = false,
            category = "Citoyen",
            customCheck = function(ply)
              return ElyConfig.Checks.NeedRank("legende", ply)              end,
            PlayerDeath = function(ply, weapon, killer)
                  ply:teamBan()
                  ply:changeTeam(GAMEMODE.DefaultTeam, true)
            end,
      citizenpm = true
      })
        
        -- POMPIER-- 
      TEAM_POMPIERPRO = DarkRP.createJob("*WL* Pompier Professionnel", {
      color = Color(173, 45, 18, 255),
      model = { 
      "models/player/portal/male_02_fireman.mdl",
      "models/player/portal/male_04_fireman.mdl" ,
      "models/player/portal/male_05_fireman.mdl" ,
      "models/player/portal/male_06_fireman.mdl",
            "models/player/portal/male_07_fireman.mdl",
            "models/player/portal/male_08_fireman.mdl",
            "models/player/portal/male_09_fireman.mdl",
            "models/darkley/sapeur_p01.mdl",
            "models/darkley/sapeur_p02.mdl",
            "models/darkley/sapeur_p03.mdl",
            "models/player/darkley/pompier01.mdl",
            "models/player/darkley/pompier02.mdl",
            "models/player/darkley/pompier03.mdl"
            },
      description = [[ Faut (pas) allumer le feu]],
      weapons 
      = { "weapon_fist", "weapon_firehose_infinite", "elysion_syringue", "weapon_defibrillator", "weapon_medkit", "elysion_medkit"},
      command = "pompierprof",
      max = 10,
      salary = 150,
      admin = 0,
      vote = false,
      hasLicense = false,
      candemote = false,
      category =  "Pompier",                
      PlayerDeath = function(ply, weapon, killer)
            ply:teamBan(TEAM_POMPIERVOL,120)
            ply:changeTeam(GAMEMODE.DefaultTeam, true)
      end
      })
  
      TEAM_POMPIERVOL = DarkRP.createJob("*Légende* Sapeur Pompier Volontaire", {
      color = Color(173, 45, 18, 255),
      model = { 
      "models/player/portal/male_02_fireman.mdl",
      "models/player/portal/male_04_fireman.mdl" ,
      "models/player/portal/male_05_fireman.mdl" ,
      "models/player/portal/male_06_fireman.mdl",
            "models/player/portal/male_07_fireman.mdl",
            "models/player/portal/male_08_fireman.mdl",
            "models/player/portal/male_09_fireman.mdl",
            "models/darkley/sapeur_p01.mdl",
            "models/darkley/sapeur_p02.mdl",
            "models/darkley/sapeur_p03.mdl",
            "models/player/darkley/pompier01.mdl",
            "models/player/darkley/pompier02.mdl",
            "models/player/darkley/pompier03.mdl"
            },
      description = [[ Faut (pas) allumer le feu]],
      weapons 
      = { "weapon_fist", "weapon_firehose_infinite", "elysion_syringue", "weapon_defibrillator", "weapon_medkit", "elysion_medkit"},
      command = "pompiervol",
      max = 4,
      salary = 150,
      admin = 0,
      vote = false,
      hasLicense = false,
      candemote = false,
      category =  "Pompier",
      customCheck = function(ply)
              return ElyConfig.Checks.NeedRank("legende", ply)              end,                 
      PlayerDeath = function(ply, weapon, killer)
            ply:teamBan(TEAM_POMPIERVOL,120)
            ply:changeTeam(GAMEMODE.DefaultTeam, true)
      end
      })
  
      TEAM_POMPIERCHEF = DarkRP.createJob("*WL* Chef de Caserne", {
      color = Color(173, 45, 18, 255),
      model = { 
      "models/player/portal/male_02_fireman.mdl",
      "models/player/portal/male_04_fireman.mdl" ,
      "models/player/portal/male_05_fireman.mdl" ,
      "models/player/portal/male_06_fireman.mdl",
            "models/player/portal/male_07_fireman.mdl",
            "models/player/portal/male_08_fireman.mdl",
            "models/player/portal/male_09_fireman.mdl",
            "models/darkley/sapeur_p01.mdl",
            "models/darkley/sapeur_p02.mdl",
            "models/darkley/sapeur_p03.mdl",
            "models/player/darkley/pompier01.mdl",
            "models/player/darkley/pompier02.mdl",
            "models/player/darkley/pompier03.mdl"
            },
      description = [[ Faut (pas) allumer le feu]],
      weapons 
      = { "weapon_fist", "weapon_defibrillator","dsr_medkit","swep_drone_controller","weapon_firehose_infinite", "elysion_syringue", "weapon_defibrillator", "weapon_medkit", "elysion_medkit"},
      command = "pompierchef",
      max = 1,
      salary = 400,
      admin = 0,
      vote = false,
      hasLicense = false,
      candemote = false,
      category =  "Pompier",
      PlayerDeath = function(ply, weapon, killer)
            ply:teamBan(TEAM_POMPIERCHEF,120)
            ply:changeTeam(GAMEMODE.DefaultTeam, true)
      end
      }) 
  
      TEAM_POLICECHIEN = DarkRP.createJob("*Légende* Chien Policier", {
      color = Color(25, 25, 170, 255),
      model = { "models/dannio/dogpolice/police_k9.mdl"
            },
      description = [[ Ouaf ouaf ouaf !! ]],
      weapons 
      = {"weapon_dogswep", "zgo2_sniffer"},
      command = "policedog",
      max = 2,
      salary = 150,
      admin = 0,
      vote = false, 
      hasLicense = false,
      candemote = false,
      category =  "Police",
            customCheck = function(ply)
              return ElyConfig.Checks.NeedRank("legende", ply)              end,     
      PlayerDeath = function(ply, weapon, killer)
            ply:teamBan(TEAM_POLICECHIEN,120)
            ply:changeTeam(GAMEMODE.DefaultTeam, true)
      end
      }) 
  
  
  
      TEAM_POMPIERCHIEN = DarkRP.createJob("*Légende* Chien Pompier", {
      color = Color(173, 45, 18, 255),
      model = { "models/jwk987/animal/riley.mdl"
            },
      description = [[ Vous êtes un dog
      Bark bark bark ]],
      weapons 
      = {"weapon_dogswep"},
      command = "pompierchien",
      max = 2,
      salary = 150,
      admin = 0,
      vote = false,
      hasLicense = false,
      candemote = false,
      category =  "Pompier",
            customCheck = function(ply)
                  return table.HasValue({"Super-Admin", "superadmin", "Légende","Divin"}, ply:GetNWString("usergroup"))
            end,     
      PlayerDeath = function(ply, weapon, killer)
            ply:teamBan(TEAM_POMPIERCHIEN,120)
            ply:changeTeam(GAMEMODE.DefaultTeam, true)
      end
      })
            
      TEAM_PYRO = DarkRP.createJob("*VIP* Pyromane", {
      color = Color(173, 45, 18, 255),
      model = {"models/player/Group01/female_01.mdl", "models/player/Group01/female_02.mdl", "models/player/Group01/female_03.mdl", "models/player/Group01/female_04.mdl", "models/player/Group01/female_05.mdl", "models/player/Group01/female_06.mdl", "models/player/Group01/male_01.mdl", "models/player/Group01/male_02.mdl", "models/player/Group01/male_03.mdl", "models/player/Group01/male_04.mdl", "models/player/Group01/male_05.mdl", "models/player/Group01/male_06.mdl", "models/player/Group01/male_07.mdl", "models/player/mossman_arctic.mdl", "models/player/Group01/male_08.mdl", "models/player/Group01/male_09.mdl", "models/player/Group02/male_02.mdl", "models/player/Group02/male_04.mdl", "models/player/Group02/male_06.mdl", "models/player/Group02/male_08.mdl"},
  
                  description = [[
      Vous êtes un habitant de la ville.
      Essayez de mettre le feu discrètement.
                  
      Catéorie d'armes : ★
      Printer : ✔
      Racket : ✘ 
            ]],
                  weapons = { "weapon_fists","weapon_nmrih_molotov"},
      command = "pyrobarbare",
      max = 2,
      salary = 150, 
      admin = 0,
      vote = false,
      hasLicense = false,
      candemote = false,
      category =  "Citoyen",
      customCheck = function(ply)
              return ElyConfig.Checks.NeedRank("vip", ply)        end, 
      PlayerDeath = function(ply, weapon, killer)
            ply:teamBan(TEAM_PYRO,600)
            ply:changeTeam(GAMEMODE.DefaultTeam, true)
      end
      })      
      -- Animo job 
       
      TEAM_OIS = DarkRP.createJob("Pigeon", {
            color = Color(17,148,240, 255),
            model = {
                  "models/pigeon.mdl"
            },
            description = [[
            ]],
            weapons = {},
            command = "pigeon",
            max = 4,
            salary = 0,
            admin = 0, 
            etoiles = 0,
            vote = false,
            hasLicense = false,
            candemote = false,
        category =  "Animaux",
            jobType = "job",
            PlayerSpawn = function(ply)
                  pk_pills.apply(ply,"bird_pigeon_2") 
                  ply:SetNoDraw(true)
                  --ply:SetModelScale(0.1)
            end,
            PlayerDeath = function(ply, weapon, killer)
                  ply:SetCollisionGroup(COLLISION_GROUP_WORLD)
                  ply:changeTeam(GAMEMODE.DefaultTeam, true)
            end,   
      })

      TEAM_SPIDER = DarkRP.createJob("Araignée", {
            color = Color(0, 0, 0, 255),
            model = {
                  "models/vj_darkmessiah/spider_regular.mdl"
            },
            description = [[
            ]],
            weapons = {},
            command = "araignee",
            max = 4,
            salary = 0,
            admin = 0,
            etoiles = 0,
            vote = false,
            hasLicense = false,
            candemote = false,
        category =  "Animaux",
            jobType = "job",
            PlayerSpawn = function(ply)
                  pk_pills.apply(ply,"spider") 
                  ply:SetNoDraw(true)
                  ply:SetModelScale(0.045)
            end,
            PlayerDeath = function(ply, weapon, killer)
                  ply:SetCollisionGroup(COLLISION_GROUP_WORLD)
                  ply:changeTeam(GAMEMODE.DefaultTeam, true)
            end,   
      })

      --Orga gmod

      TEAM_WARAY = DarkRP.createJob("*WL* Waray", {
            color = Color(0, 0, 0, 255),
                  model = {"models/sentry/gtav/armenian/armbosspm.mdl",
                  "models/sentry/gtav/armenian/armgoonpm.mdl",
                 "models/sentry/gtav/armenian/armlitpm.mdl",
                },
            description = [[
                  Waray Gang (Philippin)
      Catéorie d'armes : ★★★★
      Printer : ✔
      Racket : ✔
      ]],
            weapons = {   "weapon_fists", "advancedrobbery_cellphone", "jewelry_robbery_hammer", "tfa_luger", "salute", "tfa_cso_ak_long", "aus_m_machete"},
            command = "waray",
            max = 15,
            salary = 250,
            admin = 0,
            category = "Organisations",
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

      TEAM_ELG = DarkRP.createJob("*WL*ELG", {
            color = Color(0, 0, 0, 255),
                  model = {"models/gta5/ballas/ballaseastpm.mdl",
                  "models/gta5/ballas/ballasorigpm.mdl",
                  "models/gta5/ballas/ballassoutpm.mdl",},
            description = [[
                  ELG Gang (Afro-américain)
      Catéorie d'armes : ★★★★
      Printer : ✔
      Racket : ✔
      ]],
            weapons = {   "weapon_fists", "advancedrobbery_cellphone", "jewelry_robbery_hammer", "tfa_luger", "salute"},
            command = "elgggg",
            max = 15,
            salary = 250,
            admin = 0,
            category = "Organisations",
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

      TEAM_MATONES = DarkRP.createJob("*WL* Los Matones", {
            color = Color(0, 0, 0, 255),
                  model = {"models/sentry/gtav/mexican/aztecapm.mdl",
                 "models/sentry/gtav/mexican/aztecagirlpm.mdl",
                 "models/sentry/gtav/mexican/mexboss1pm.mdl",},
            description = [[
                  Los Matones (Latino)
      Catéorie d'armes : ★★★★
      Printer : ✔
      Racket : ✔
      ]],
            weapons = {   "weapon_fists", "advancedrobbery_cellphone", "jewelry_robbery_hammer", "tfa_luger", "salute"},
            command = "matones",
            max = 15,
            salary = 2000,
            admin = 0,
            category = "Organisations",
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


      TEAM_MORILLO = DarkRP.createJob("*WL* Cartel Morillo", {
            color = Color(0, 0, 0, 255),
                  model = {"models/sentry/gtav/mexican/mexgangpm.mdl",
                  "models/sentry/gtav/mexican/pologoon1pm.mdl",
                  "models/sentry/gtav/mexican/mexboss2pm.mdl",},
            description = [[
                  Cartel Morillo (Cartel mexicain)
      Catéorie d'armes : ★★★★
      Printer : ✔
      Racket : ✔
      ]],
            weapons = {   "weapon_fists", "advancedrobbery_cellphone", "jewelry_robbery_hammer", "tfa_luger", "salute"},
            command = "morillo",
            max = 15,
            salary = 2000,
            admin = 0,
            category = "Organisations",
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

      TEAM_BRATKOV = DarkRP.createJob("*WL* Bratkov ", {
            color = Color(0, 0, 0, 255),
                  model = {"models/rashkinsk/fsin/camo/camo_08.mdl",
                  "models/rashkinsk/fsin/camo/camo_07.mdl",
                 "models/rashkinsk/fsin/camo/camo_06.mdl",
                  "models/rashkinsk/fsin/camo/camo_04.mdl",
                  "models/rashkinsk/fsin/camo/camo_02.mdl",
                  "models/rashkinsk/fsin/camo/camo_fem_06.mdl",
                  "models/rashkinsk/fsin/spetsnaz/spetsnaz_02.mdl",
                  },
            description = [[
                  Bratkov (Russe)
      Catéorie d'armes : ★★★★
      Printer : ✔
      Racket : ✔
      ]],
            weapons = {   "weapon_fists", "advancedrobbery_cellphone", "jewelry_robbery_hammer", "tfa_luger", "salute"},
            command = "bratkov",
            max = 15,
            salary = 2000,
            admin = 0,
            category = "Organisations",
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

      TEAM_TRIADE = DarkRP.createJob("*WL* Triade ", {
            color = Color(0, 0, 0, 255),
                  model = {"models/sentry/gtav/kkangpae/korbosspm.mdl",
                  "models/sentry/gtav/kkangpae/korlitpm.mdl",
                 "models/sentry/gtav/kkangpae/korean2pm.mdl",
                  "models/sentry/gtav/kkangpae/korean1pm.mdl",
                  },
            description = [[
                  Triade (Japonais)
      Catéorie d'armes : ★★★★
      Printer : ✔
      Racket : ✔
      ]],
            weapons = {   "weapon_fists", "advancedrobbery_cellphone", "jewelry_robbery_hammer", "tfa_luger", "salute"},
            command = "triade",
            max = 15,
            salary = 2000,
            admin = 0,
            category = "Organisations",
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
        
      -- Fondation SCP
  /*      
      TEAM_AGENT_FONDATION = DarkRP.createJob("*WL* Agent Fondation", {
    color = Color(26, 46, 189, 255),
    model = {
        "models/kss/tsremastered/smod_tactical_soldier.mdl",
        "models/player/r6s_iq.mdl",
        "models/kss/tsremastered/smod_operator_tac_03.mdl","models/kss/tsremastered/smod_operator_tac_02.mdl",
        "models/player/R6S_Ash.mdl"
    },
    description = [[]],
    weapons = {"tfa_ins2_glock_19", "tfa_m416", "stunstick", "weapon_checker", "stungun", "weapon_cuff_police", "salute"},
    command = "agent_fondation",
    max = 0,
    salary = 150,
    admin = 0,
    vote = false,
    hasLicense = false,
    candemote = false,
    etoiles = 3,  
    category = "Fondation SCP",
    sortOrder = 2,
    PlayerLoadout = function(ply)
        ply:SetJumpPower(190)
        ply:SetRunSpeed(250)
        ply:SetHealth(100)
        ply:SetArmor(600)
end
})
        
TEAM_CHERCHEUR_FONDATION = DarkRP.createJob("*WL* Chercheur", {
    color = Color(0, 255, 255, 255),
    model = {"models/player/kerry/Class_scientist_1.mdl", "models/player/kerry/Class_scientist_2.mdl", "models/player/kerry/Class_scientist_3.mdl", "models/player/kerry/Class_scientist_4.mdl", "models/player/kerry/Class_scientist_5.mdl", "models/player/kerry/Class_scientist_6.mdl", "models/player/kerry/Class_scientist_7.mdl"},
    description = [[]],
    weapons = {"salute"},
    command = "chercheur_fondation",
    max = 0,
    salary = 150,
    admin = 0,
    vote = false,
    hasLicense = false,
    candemote = false,
    etoiles = 0,
    category = "Fondation SCP",
    sortOrder = 1,
    PlayerLoadout = function(ply)
        ply:SetJumpPower(150)
        ply:SetHealth(100)
        ply:SetArmor(200)
end
})

TEAM_CLASSED_FONDATION = DarkRP.createJob("Classe D", {
    color = Color(255, 93, 0, 255),
    model = {
        "models/player/kerry/Class_D_1.mdl", "models/player/kerry/Class_D_2.mdl", "models/player/kerry/Class_D_3.mdl", "models/player/kerry/Class_D_4.mdl", "models/player/kerry/Class_D_5.mdl", "models/player/kerry/Class_D_6.mdl", "models/player/kerry/Class_D_7.mdl"},
    description = [[]],
    weapons = {"cross_arms_swep"},
    command = "classed_fondation",
    max = 0,
    salary = 10,
    admin = 0,
    vote = false,
    hasLicense = false,
    candemote = false,
    etoiles = 1, 
    category = "Fondation SCP",
    sortOrder = 0,
    PlayerLoadout = function(ply)
        ply:SetJumpPower(150)
        ply:SetHealth(100)
end,
        PlayerDeath = function(ply, weapon, killer)
            ply:teamBan()
            ply:changeTeam(GAMEMODE.DefaultTeam, true)
                end
})
        
    TEAM_CHEF_AGENT_FONDATION = DarkRP.createJob("*WL* Chef Agent Fondation", {
    color = Color(26, 46, 189, 255),
    model = {
        "models/kss/tsremastered/smod_tactical_soldier.mdl",
        "models/player/r6s_iq.mdl",
        "models/kss/tsremastered/smod_operator_tac_03.mdl","models/kss/tsremastered/smod_operator_tac_02.mdl",
        "models/player/R6S_Ash.mdl"
    },
    description = [[]],
    weapons = {"tfa_ins2_glock_19", "tfa_m416", "stunstick", "weapon_checker", "stungun", "weapon_cuff_police", "salute"},
    command = "chef_agent_fondation",
    max = 0,
    salary = 150,
    admin = 0,
    vote = false,
    hasLicense = false,
    candemote = false,
    etoiles = 3,  
    category = "Fondation SCP",
    sortOrder = 3,
    PlayerLoadout = function(ply)
        ply:SetJumpPower(190)
        ply:SetRunSpeed(250)
        ply:SetHealth(100)
        ply:SetArmor(900)
end
})
        
TEAM_DIRECTEUR_FONDATION = DarkRP.createJob("*WL* Directeur du site", {
    color = Color(160, 40, 95, 255),
    model = {"models/GrandTheftAuto5/Michael.mdl", "models/player/voikanaa/kazuma_kiryu.mdl", "models/Curator_TrenchCoat_NoHat.mdl"},
    description = [[]],
    weapons = {"tfa_ins2_m9", "salute"},
    command = "directeur_fondation",
    max = 1,
    salary = 300,
    admin = 0,
    vote = false,
    hasLicense = false,
    candemote = false,
    etoiles = 0,
    category = "Direction",
    sortOrder = 4,  
    PlayerLoadout = function(ply)
        ply:SetJumpPower(150)
        ply:SetHealth(300)
        ply:SetArmor(1200)
end
})

TEAM_049_FONDATION = DarkRP.createJob("SCP-049", {
   color = Color(255, 0, 0, 255),
   model = {"models/scp049/scp049.mdl"},
   description = [[]],
   weapons = {"scp_049_rp2021"},
   command = "scp_049_fondation",
   max = 1,
   level = 20,
   salary = 150,
   admin = 0,
   vote = false,
   hasLicense = false,
   candemote = false,
   etoiles = 0,
   category = "Fondation SCP",
      sortOrder = 5,
    PlayerLoadout = function(ply)
        ply:SetJumpPower(190)
        ply:SetRunSpeed(250)
        ply:SetHealth(5000)
end,
        PlayerDeath = function(ply, weapon, killer)
            ply:teamBan()
            ply:changeTeam(GAMEMODE.DefaultTeam, true)
                end
})
                
TEAM_173_FONDATION = DarkRP.createJob("SCP-173", {
   color = Color(255, 0, 0, 255),
   model = {"models/scp/173.mdl"},
   description = [[]],
   weapons = {"rp_scp173"},
   command = "scp_173_fondation",
   max = 1,
   level = 10,
   salary = 150,
   admin = 0,
   vote = false,
   hasLicense = false,
   candemote = false,
   category = "Fondation SCP",
   sortOrder = 6,
    PlayerLoadout = function(ply)
        ply:SetJumpPower(190)
        ply:SetRunSpeed(250)
        ply:SetHealth(999999)
end,
        PlayerDeath = function(ply, weapon, killer)
            ply:teamBan()
            ply:changeTeam(GAMEMODE.DefaultTeam, true)
                end
})
        
TEAM_096_FONDATION = DarkRP.createJob("SCP-096", {
   color = Color(255, 0, 0, 255),
   model = {"models/player/scp096.mdl"},
   description = [[]],
   weapons = {"vkx_scp_096"},
   command = "scp_096_fondation",
   max = 1,
   level = 17,
   scale = 2,
   salary = 150,
   admin = 0,
   vote = false,
   hasLicense = false,
   candemote = false,
   etoiles = 0,
   category = "Fondation SCP",
         sortOrder = 7,
    PlayerLoadout = function(ply)
        ply:SetJumpPower(190)
        ply:SetRunSpeed(250)
        ply:SetHealth(99999)
end,
        PlayerDeath = function(ply, weapon, killer)
            ply:teamBan()
            ply:changeTeam(GAMEMODE.DefaultTeam, true)
                end
})
*/
      -- GF job 
/*
      TEAM_GF = DarkRP.createJob("Joueur Pro", {
            color = Color(254,0,220),
            model = {  "models/player/police.mdl",
"models/player/police_fem.mdl",
"models/player/alyx.mdl",
"models/player/p2_chell.mdl",
"models/player/corpse1.mdl",
"models/player/skeleton.mdl",
"models/player/hostage/hostage_04.mdl",
"models/player/guerilla.mdl",
"models/player/gasmask.mdl",
"models/player/leet.mdl",
"models/player/phoenix.mdl",
"models/player/riot.mdl",
"models/player/swat.mdl",
"models/player/urban.mdl",
"models/player/dod_american.mdl",
"models/player/dod_german.mdl",
                  },
            description = [[ Devenez le nouveau Joker le cheat ou KennyS ou Faker d'Elysion ]],
            weapons  = {"weapon_dogswep"},
            command = "jobgf",
            max = 10,
            etoiles = 4,
            salary = 150,
            admin = 0,
            vote = false,
            hasLicense = false,
            candemote = false,
            category =  "Gunfight",
                  customCheck = function(ply)
                        return ( tonumber(os.date("%H")) > 15 or tonumber(os.date("%H")) < 9 )
                  end, 
            PlayerDeath = function(ply, weapon, killer)
                  --ply:teamBan(TEAM_GF,120)
                  --ply:changeTeam(GAMEMODE.DefaultTeam, true)
            end
            })

            TEAM_GFPR = DarkRP.createJob("*Premium* Joueur Pro", {
                  color = Color(254,0,220),
                  model = {  "models/player/police.mdl",
"models/player/police_fem.mdl",
"models/player/alyx.mdl",
"models/player/p2_chell.mdl",
"models/player/corpse1.mdl",
"models/player/skeleton.mdl",
"models/player/hostage/hostage_04.mdl",
"models/player/guerilla.mdl",
"models/player/gasmask.mdl",
"models/player/leet.mdl",
"models/player/phoenix.mdl",
"models/player/riot.mdl",
"models/player/swat.mdl",
"models/player/urban.mdl",
"models/player/dod_american.mdl",
"models/player/dod_german.mdl",
                        },
                  description = [[ Devenez le nouveau Joker le cheat ou KennyS ou Faker d'Elysion ]],
                  weapons  = {"weapon_dogswep"},
                  command = "jobgfpr",
                  max = 5,
                  salary = 150,
                  etoiles = 4,
                  admin = 0,
                  vote = false,
                  hasLicense = false,
                  candemote = false,
                  category =  "Gunfight",
                        customCheck = function(ply)
              return ElyConfig.Checks.NeedRank("premium", ply)                          end,
                  PlayerDeath = function(ply, weapon, killer)
                       -- ply:teamBan(TEAM_GFPR,120)
                       -- ply:changeTeam(GAMEMODE.DefaultTeam, true)
                  end
                  })

                  TEAM_GFLEGEND = DarkRP.createJob("*Légende* Joueur Pro", {
                        color = Color(254,0,220),
                        model = {  "models/player/police.mdl",
"models/player/police_fem.mdl",
"models/player/alyx.mdl",
"models/player/p2_chell.mdl",
"models/player/corpse1.mdl",
"models/player/skeleton.mdl",
"models/player/hostage/hostage_04.mdl",
"models/player/guerilla.mdl",
"models/player/gasmask.mdl",
"models/player/leet.mdl", 
"models/player/phoenix.mdl",
"models/player/riot.mdl",
"models/player/swat.mdl",
"models/player/urban.mdl",
"models/player/dod_american.mdl",
"models/player/dod_german.mdl",
                              },
                        description = [[ Devenez le nouveau Joker le cheat ou KennyS ou Faker d'Elysion ]],
                        weapons  = {"weapon_dogswep"},
                        command = "jobgfleg", 
                        max = 10,
                        salary = 150,
                        admin = 0,
                        etoiles = 4,
                        vote = false,
                        hasLicense = false,
                        candemote = false,
                        category =  "Gunfight",
                              customCheck = function(ply)
              return ElyConfig.Checks.NeedRank("legende", ply)                                end,
                        PlayerDeath = function(ply, weapon, killer)
                          --    ply:teamBan(TEAM_GFLEGEND,120)
                            --  ply:changeTeam(GAMEMODE.DefaultTeam, true)
                        end
                        })

*/
        -- AFK FARM --
  
      TEAM_AFK = DarkRP.createJob("AFK FARM", {
            color = Color(0, 0, 0, 255),
            model = {"models/Humans/Group01/Female_01.mdl"},
            description = [[Gagnez de l'argent en étant AFK - Disponible dès 20h]],
            weapons = {},
            command = "jobafkfarm",
            max = 99,
            salary = 0, 
            admin = 0,  
            category = "FARMAFK",
            --customCheck = function(ply)
             -- return IsAfkTime()
            --end,
            --CustomCheckFailMsg = "Vous ne pouvez pas rejoindre ce job à cette heure là",
      })
      --[[ FIN ]] 
      --
      --[[---------------------------------------------------------------------------
  Define which team joining players spawn into and what team you change to if demoted
  ---------------------------------------------------------------------------]]
      GM.DefaultTeam = TEAM_CITIZEN
  
      --[[---------------------------------------------------------------------------
  Define which teams belong to civil protection
  Civil protection can set warrants, make people wanted and do some other police related things
  ---------------------------------------------------------------------------]]
      GM.CivilProtection = {
            [TEAM_POLICE] = true,
            [TEAM_CHIEF] = true,
            [TEAM_CHIEF] = true,
            [TEAM_BAC] = true,
            [TEAM_CPOLICE] = true,
            [TEAM_HCCOMMANDEMENT] = true,
            [TEAM_POLICECHIEN] = true,
            [TEAM_RAID] = true,
            [TEAM_RAIDCHEF] = true,
      }
  
      GM:AddChatTeam("Gang", {TEAM_CHEFGANGSTER, TEAM_GANG})
  
      GM:AddChatTeam("Police", {TEAM_MAYOR, TEAM_POLICE, TEAM_CHIEF, TEAM_BAC, TEAM_RAIDCHEF, TEAM_RAID})
  
      GM:AddChatTeam("Maire", {TEAM_MAYOR, TEAM_BODYMAYOR, TEAM_SECRETARY, TEAM_RAIDCHEF, TEAM_RAID})
      GM:AddChatTeam("RAID", {TEAM_RAIDCHEF, TEAM_RAID})
  
      GM:AddDoorGroup("Hôpital", TEAM_MEDIC)
      GM:AddDoorGroup("Mairie", TEAM_POLICE, TEAM_MAYOR, TEAM_CHIEF, TEAM_BAC, TEAM_BODYMAYOR, TEAM_CPOLICE, TEAM_HCCOMMANDEMENT, TEAM_RAIDCHEF, TEAM_RAID)
      GM:AddDoorGroup("Poste de Police", TEAM_POLICE, TEAM_CPOLICE, TEAM_HCCOMMANDEMENT, TEAM_CHIEF, TEAM_BAC, TEAM_POLICECHIEN, TEAM_RAID, TEAM_RAIDCHEF, TEAM_GOUVERNEUR, TEAM_VGOUVERNEUR, TEAM_GOUVERNEMENT, TEAM_SECRETSERVICE)
      GM:AddDoorGroup("Locaux RAID", TEAM_CHIEF, TEAM_RAID, TEAM_RAIDCHEF, TEAM_GOUVERNEUR, TEAM_VGOUVERNEUR, TEAM_GOUVERNEMENT, TEAM_SECRETSERVICE)
      GM:AddDoorGroup("Bureau Direction", TEAM_CHIEF, TEAM_HCCOMMANDEMENT, TEAM_GOUVERNEUR, TEAM_VGOUVERNEUR, TEAM_GOUVERNEMENT, TEAM_SECRETSERVICE)
      GM:AddDoorGroup("Banque", TEAM_CHIEF, TEAM_BANK, TEAM_CONVOYEUR)
      GM:AddDoorGroup("Boutiques", TEAM_CHIEF, TEAM_BARMANS, TEAM_COOK, TEAM_DIVER, TEAM_GUNR)
      GM:AddDoorGroup("Restaurant", TEAM_COOK)
      GM:AddDoorGroup("Tribunal", TEAM_POLICE, TEAM_MAYOR, TEAM_CHIEF, TEAM_BAC, TEAM_HCCOMMANDEMENT, TEAM_RAIDECHEF, TEAM_RAID)
      GM:AddDoorGroup("Prison", TEAM_POLICE, TEAM_CHIEF, TEAM_BAC, TEAM_HCCOMMANDEMENT, TEAM_CAPSTRAKOV, TEAM_RAIDCHEF, TEAM_RAID)
      GM:AddDoorGroup("Gouvernement", TEAM_CHIEF, TEAM_CPOLICE, TEAM_HCCOMMANDEMENT, TEAM_RAIDCHEF, TEAM_RAID, TEAM_GOUVERNEUR, TEAM_VGOUVERNEUR, TEAM_GOUVERNEMENT, TEAM_SECRETSERVICE)
      GM:AddDoorGroup("Caserne", TEAM_POMPIERCYNO, TEAM_URGENTISTE, TEAM_POMPIERCHEF, TEAM_POMPIERVOL, TEAM_POMPIERPRO, TEAM_POMPIERSAPEUR)
  end)
  
  hook.Add('playerCanChangeTeam', 'cantmayor', function(ply, id, force)
      if id == TEAM_MAYOR then return false, 'Vous devez allez voir la secrétaire pour devenir maire' end
  end)