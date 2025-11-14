{-# LANGUAGE GADTs,  NoImplicitPrelude #-}

import qualified Prelude as P

data Bool where
  True :: Bool
  False :: Bool
  deriving (P.Show)

data Maybe a where
  Nothing :: forall a. Maybe a
  Just :: forall a. a -> Maybe a
  deriving (P.Show)

maybe :: forall a b.  b -> (a -> b) -> Maybe a -> b
maybe n _ Nothing  = n
maybe _ f (Just x) = f x

data List a where
  Nil :: forall a. List a
  Cons :: forall a. a -> List a -> List a
  deriving (P.Show)

foldl :: (b -> a -> b) -> b -> List a -> b
foldl f z [] = z
foldl f z (x:xs) = foldl f (f z x) xs

data Nat where
  Zero :: Nat
  Succ :: Nat -> Nat
  deriving (P.Show)

plus :: Nat -> Nat -> Nat
plus Zero n = n
plus (Succ m) n = Succ (plus m n)

not :: Bool -> Bool
not False = True
not True = False

ifElse :: forall a. Bool -> a -> a -> a
ifElse True a b = a 
ifElse False a b = b

main = do 
  P.print (ifElse True 1 2) --1
  P.print (ifElse False 1 2) --2
