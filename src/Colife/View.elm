module Colife.View exposing (view)

import Html exposing (Html)
import Svg exposing (Svg, g, rect, svg)
import Svg.Attributes exposing
  ( fill, height, stroke, strokeWidth, viewBox, width, x, y
  )

import Colife.Model exposing (Grid(Grid), State(Alive, Dead))

view : Grid State -> Html a
view (Grid _ grid) =
  svg [viewBox "-50 -50 1000 1000"]
    (List.indexedMap row grid)

row : Int -> List State -> Svg a
row m vect =
  g []
    (List.indexedMap (cell m) vect)

cell : Int -> Int -> State -> Svg a
cell m n state =
  rect
    [ fill (cellFill state)
    , height "10"
    , stroke "#aaa"
    , strokeWidth "1"
    , width "10"
    , x (toString (10 * n))
    , y (toString (10 * m))
    ]
    []

cellFill : State -> String
cellFill state =
  case state of
    Alive -> "black"
    Dead -> "none"
