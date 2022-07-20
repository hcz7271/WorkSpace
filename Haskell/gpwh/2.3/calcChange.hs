calcChange owed given =
  if change > 0
    then change
    else 0
  where
    change = given - owed

doublePlusTwo x = doubleX + 2
  where
    doubleX = x * 2