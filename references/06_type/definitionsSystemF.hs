{-# LANGUAGE GADTs,  NoImplicitPrelude #-}

import qualified Prelude as P

--Boolean

type Bool = forall a. a-> a -> a

false :: Bool
false a b = b

true :: Bool
true a b = a

ifElse :: forall a. Bool -> a -> a -> a
ifElse bool a b  = bool a b

--Maybe

type Maybe a = forall b. b -> (a -> b)  -> b

nothing :: Maybe a
nothing n j = n

just :: a -> Maybe a
just val n j = (j val)

foldMaybe :: forall a b. b -> (a -> b) -> Maybe a -> b
foldMaybe n j maybe = maybe n j

--Nat

type Nat = forall b. b -> (b -> b) -> b

zero :: Nat
zero z s = z

succ :: Nat -> Nat
succ nat z s = s (nat z s)

foldNat:: forall a b. b -> (b -> b) -> Nat -> b
foldNat z s nat = nat z s

main = do 
  P.print (foldMaybe "nothing" (\a -> "just " P.++ a ) (just "foo"))-- "justfoo"
  P.print (foldMaybe "nothing" (\a -> "just " P.++ a ) nothing) -- "nothing"
  P.print (ifElse true "True" "False")-- "True"
  P.print (ifElse false "True" "False") -- "False"
  P.print (foldNat 0 (P.+ 1) (succ zero)) --1
  P.print (foldNat 0 (P.+ 1) (succ (succ zero))) --2
