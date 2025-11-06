{-# LANGUAGE GADTs, NoImplicitPrelude #-}

import qualified Prelude as P

data Bool where
  True :: Bool
  False :: Bool
  deriving (P.Show)

data List a where
  Nil :: List a
  Cons :: a -> List a -> List a
  deriving (P.Show)

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

ifElse :: Bool -> a -> a -> a
ifElse True a b = a 
ifElse False a b = b
