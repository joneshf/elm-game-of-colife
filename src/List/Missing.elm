module List.Missing exposing (..)

import List.Extra exposing (getAt)

getAts : List Int -> List a -> List a
getAts ns xs =
  List.filterMap (\n -> getAt n xs) ns
