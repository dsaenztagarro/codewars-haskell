import qualified ISOSpec
import qualified KatasSpec.DictionariesSpec
import qualified KatasSpec.SumStringSpec

import Test.Hspec.Runner (configFailFast, defaultConfig, hspecWith)

main :: IO ()
main = hspecWith defaultConfig {configFailFast = True} specs

specs = do
  ISOSpec.specs
  KatasSpec.DictionariesSpec.specs
  KatasSpec.SumStringSpec.specs
