messyMain :: IO()

toPart :: [Char] -> [Char]
toPart recipient = "Dear " ++ recipient ++ ",\n"

bodyPart :: [Char] -> [Char]
bodyPart bookTitle = "Thanks for buying " ++ bookTitle ++ ".\n"

fromPart :: [Char] -> [Char]
fromPart author = "Thanks,\n" ++ author


messyMain = do
  print " "
    
