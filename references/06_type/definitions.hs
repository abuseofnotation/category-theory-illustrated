{-# LANGUAGE GADTs,  NoImplicitPrelude #-}

import qualified Prelude as P

data Bool where
  True :: Bool
  False :: Bool
  deriving (P.Show)

ifElse :: forall a. Bool -> a -> a -> a
ifElse True a b = a 
ifElse False a b = b

data Either a b where
  Left   :: forall a b. a -> Either a b
  Right  :: forall a b. b -> Either a b
  deriving (P.Show)

foldEither :: forall a b c. (a -> c) -> (b -> c) -> Either a b -> c
foldEither fa fb (Left  val) = fa val
foldEither fa fb (Right val) = fb val

data Tuple a b where
  Tuple :: forall a b. a -> b -> Tuple a b 
  deriving (P.Show)

first  :: Tuple a b -> a
first    (Tuple a b) = a

second :: Tuple a b -> b
second   (Tuple a b) = b

data Maybe a where
  Nothing :: forall a. Maybe a
  Just :: forall a. a -> Maybe a
  deriving (P.Show)

foldMaybe :: forall a b.  b -> (a -> b) -> Maybe a -> b
foldMaybe n _ Nothing  = n
foldMaybe _ f (Just x) = f x

data List a where
  Nil :: forall a. List a
  Cons :: forall a. a -> List a -> List a
  deriving (P.Show)

foldList :: (b -> a -> b) -> b -> List a -> b
foldList f z Nil = z
foldList f z (Cons x xs) = foldList f (f z x) xs

data Nat where
  Zero :: Nat
  Succ :: Nat -> Nat
  deriving (P.Show)

foldNat :: Nat -> a -> (a -> a) -> a
foldNat Zero z s = z
foldNat (Succ a) z s  = s (foldNat a z s)

plus :: Nat -> Nat -> Nat
plus Zero n = n
plus (Succ m) n = Succ (plus m n)

not :: Bool -> Bool
not False = True
not True = False

type MaybeL = forall m a. a -> (a -> m) -> m -> m
nothingL :: MaybeL
nothingL val just nothing = nothing

justL :: MaybeL
justL val just nothing = just val

foldL :: MaybeL -> m



main = do 
  P.print (ifElse True 1 2) --1
  P.print (ifElse False 1 2) --2
  P.print (foldNat (Succ (Succ Zero)) 0 (P.+ 1)) -- 2
