module Colife.Model exposing (..)

import Exts.Maybe exposing (catMaybes)
import List.Extra exposing (getAt)
import List.Missing exposing (getAts)

type State
  = Alive
  | Dead

type Grid a
  = Grid a (List (List a))

-- Not a lawful `extend` since we only look at immediate neighbors.
extend : (Grid a -> b) -> Grid a -> Grid b
extend f (Grid _ xs as grid) =
  Grid
    (f grid)
    (List.indexedMap (\m -> List.indexedMap (\n y -> f (neighbors xs m n y))) xs)

neighbors : List (List a) -> Int -> Int -> a -> Grid a
neighbors xs m n y =
  Grid y (catMaybes
    [ Maybe.map (getAts [n - 1, n, n + 1]) (getAt (m - 1) xs)
    , Maybe.map (getAts [n - 1,    n + 1]) (getAt m       xs)
    , Maybe.map (getAts [n - 1, n, n + 1]) (getAt (m + 1) xs)
    ])

alive : Grid State -> Int
alive (Grid _ xs) =
  List.foldr (\ys acc -> List.foldr (\state z -> aliveBit state + z) acc ys) 0 xs

aliveBit : State -> Int
aliveBit state =
  case state of
    Alive -> 1
    Dead -> 0
