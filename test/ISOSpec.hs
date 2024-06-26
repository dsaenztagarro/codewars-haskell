module ISOSpec (specs) where

import ISO

import Test.Hspec
import Test.QuickCheck
import Data.Either

bISO :: ISO Bool Bool
bISO = (not, not)

lrl :: ISO a b -> (a -> a)
lrl (ab, ba) = ba . ab

f :: Maybe a -> Maybe a
f Nothing  = Nothing   -- If input is Nothing, return Nothing
f (Just x) = Just x    -- If input is Just x, return Just x

specs = do
  describe "subst" $ do
    it "substL" $ do
      substL bISO    True  `shouldBe` False
      substL bISO    False `shouldBe` True
      substL isoBool False `shouldBe` False
      substL isoBool True  `shouldBe` True
    it "substR" $ do
      substR bISO    True  `shouldBe` False
      substR bISO    False `shouldBe` True
      substR isoBool True  `shouldBe` True
      substR isoBool False `shouldBe` False
    it "isoEU" $ do
      isLeft (substL isoEU (Right ())) `shouldBe` True
    it "lrl isoEU (Left (replicate n ())) == Left (replicate n ())" $
      property $ \(NonNegative n) ->
        lrl isoEU (Left (replicate n ())) == Left (replicate n ())
