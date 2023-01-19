-- Simulation de la batterie du Régiolis

TEMPS_BATTERIE = 15 -- 15 * 60
TENSION_NORMINALE = 72
TENSION_EN_UTILISATION = 84

function etat_batterie()
  temps_allumee = os.time() - TEMPS_ALLUMAGE_BATTERIE 
  if (allumee and (temps_allumee < TEMPS_BATTERIE)) then
    tension = TENSION_NORMINALE
    return allumee, tension
  elseif (not allumee) then
    tension = 0
    return allumee, tension
  else
    allumee = false
    tension = 0
    return allumee, tension
  end
end
    
function toogle_batterie()
  allumee = not allumee
  if allumee then
    TEMPS_ALLUMAGE_BATTERIE = os.time()
  else
    TEMPS_EXTINCTION_BATERIE = os.time()
  end
end
  
-- Allumage batterie
toogle_batterie()
allumee, tension = etat_batterie()
print(allumee, tension)

-- Extinction batterie
toogle_batterie()
allumee, tension = etat_batterie()
print(allumee, tension)

-- Verification de l'extinction auto
toogle_batterie()
while(1) 
  do
    allumee, tension = etat_batterie()
    if (allumee == false and tension == 0) then
      print("Batterie éteinte !")
      break
    end
end