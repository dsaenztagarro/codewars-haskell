module ISO where

import Data.Void

-- A type of `Void` have no value.
-- So it is impossible to construct `Void`,
-- unless using undefined, error, unsafeCoerce, infinite recursion, etc
-- And there is a function
-- absurd :: Void -> a
-- That get any value out of `Void`
-- We can do this becuase we can never have void in the zeroth place.

-- so, when are two type, `a` and `b`, considered equal?
-- a definition might be, it is possible to go from `a` to `b`,
-- and from `b` to `a`.
-- Going a roundway trip should leave you the same value.
-- Unfortunately it is virtually impossible to test this in Haskell.
-- This is called Isomorphism.

type ISO a b = (a -> b, b -> a)

-- given ISO a b, we can go from a to b
substL :: ISO a b -> (a -> b)
substL = fst

-- and vice versa
substR :: ISO a b -> (b -> a)
substR = snd

-- There can be more than one ISO a b
isoBool :: ISO Bool Bool
isoBool = (id, id)

isoBoolNot :: ISO Bool Bool
isoBoolNot = (not, not)

-- isomorphism is reflexive
refl :: ISO a a
refl = (id, id)

-- isomorphism is symmetric
symm :: ISO a b -> ISO b a
symm (ab, ba) = (ba, ab)

-- isomorphism is transitive
trans :: ISO a b -> ISO b c -> ISO a c
trans (ab, ba) (bc, cb) = (bc . ab, ba . cb)

-- We can combine isomorphism:
isoTuple :: ISO a b -> ISO c d -> ISO (a, c) (b, d)
isoTuple (ab, ba) (cd, dc) =
  (\(a, c) -> (ab a, cd c), (\(b, d) -> (ba b, dc d)))

isoList :: ISO a b -> ISO [a] [b]
isoList (ab, ba) = (map ab, map ba)

isoMaybe :: ISO a b -> ISO (Maybe a) (Maybe b)
isoMaybe (ab, ba) = (mab, mba)
  where mab (Just a) = Just (ab a)
        mab Nothing = Nothing
        mba (Just b) = Just (ba b)
        mba Nothing = Nothing

isoEither :: ISO a b -> ISO c d -> ISO (Either a c) (Either b d)
isoEither (ab, ba) (cd, dc) = (acbd, bdac)
  where acbd (Left a) = Left (ab a)
        acbd (Right c) = Right (cd c)
        bdac (Left b) = Left (ba b)
        bdac (Right d) = Right(dc d)

isoFunc :: ISO a b -> ISO c d -> ISO (a -> c) (b -> d)
isoFunc (ab, ba) (cd, dc) = (acbd, bdac)
  where acbd ac = cd . ac . ba
        bdac bd = dc . bd . ab

-- Going another way is hard (and is generally impossible)
-- Remember, for all valid ISO, converting and converting back
-- Is the same as the original value.
-- You need this to prove some case are impossible.
isoUnMaybe :: ISO (Maybe a) (Maybe b) -> ISO a b
isoUnMaybe (mab, mba) = (ab, ba)
  where ab a = case mab (Just a) of
                 Just b -> b
                 Nothing -> case mab Nothing of
                              Just b' -> b'
                              Nothing -> error "impossible case"

        ba b = case mba (Just b) of
                  Just a -> a
                  Nothing -> case mba Nothing of
                               Just a' -> a'
                               Nothing -> error "impossible case"

-- We cannot have
-- isoUnEither :: ISO (Either a b) (Either c d) -> ISO a c -> ISO b d.

-- Note that we have
isoEU :: ISO (Either [()] ()) (Either [()] Void)
isoEU = (ab, ba)
  where ab (Left a) = Left (a <> [()])
        ab (Right ()) = Left []
        ba (Left []) = Right ()
        ba (Left a) = Left (drop 1 a)
        ba _ = error "impossible case"
-- where (), the empty tuple, has 1 value, and Void has 0 value
-- If we have isoUnEither,
-- We have ISO () Void by calling isoUnEither isoEU
-- That is impossible, since we can get a Void by substL on ISO () Void
-- So it is impossible to have isoUnEither

-- And we have isomorphism on isomorphism!
isoSymm :: ISO (ISO a b) (ISO b a)
isoSymm = (\(ab, ba) -> (ba, ab), \(ba, ab) -> (ab, ba))

