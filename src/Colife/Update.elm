module Colife.Update exposing (..)

import Platform.Cmd exposing (none)

import Colife.Model exposing (Grid(Grid), State(Alive, Dead), alive, extend)

update : a -> Grid State -> (Grid State, Cmd c)
update _ grid = (extend rules grid, none)

rules : Grid State -> State
rules (Grid x _ as grid) =
  case (x, alive grid) of
    (Alive, 2) -> Alive
    (_, 3) -> Alive
    _ -> Dead
