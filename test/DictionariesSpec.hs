module DictionariesSpec (specs) where

import Dictionaries (sortDict)

import Test.Hspec

specs = do
  describe "sortDict" $ do
    it "should handle dictionaries with numbers as keys" $ do
      sortDict [(1,3),(2,2),(3,1)] `shouldBe` [(1,3),(2,2),(3,1)]
      sortDict [(3,1),(2,2),(1,3)] `shouldBe` [(1,3),(2,2),(3,1)]
      sortDict [(1,2),(2,4),(3,6)] `shouldBe` [(3,6),(2,4),(1,2)]
      sortDict [(0,0),(0,6),(1,6)] `shouldBe` [(0,6),(1,6),(0,0)]
      sortDict [(0,3),(1,3),(0,0)] `shouldBe` [(0,3),(1,3),(0,0)]
      sortDict [(0,1),(1,1)] `shouldBe` [(0,1),(1,1)]

    it "should handle dictionaries with strings as keys" $ do
      sortDict [("a", 6), ("b", 2), ("c",4)] `shouldBe` [("a", 6), ("c", 4), ("b",2)]


