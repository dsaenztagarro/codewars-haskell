import qualified ISOSpec
import qualified DictionariesSpec
import qualified SumStringSpec

import Test.Hspec.Runner (configFailFast, defaultConfig, hspecWith)

main :: IO ()
main = hspecWith defaultConfig {configFailFast = True} specs

specs = do
  ISOSpec.specs
  DictionariesSpec.specs
  SumStringSpec.specs
