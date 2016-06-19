module Colife.Main exposing (..)

import Html.App exposing (program)
import Platform.Cmd exposing (Cmd, none)
import Platform.Sub exposing (Sub)
import Time exposing (every, millisecond)

import Colife.Pattern as Pattern
import Colife.Model exposing (Grid(Grid), State(Dead))
import Colife.Update exposing (update)
import Colife.View exposing (view)

main : Program Never
main =
  program
    { init = init
    , update = update
    , view = view
    , subscriptions = subscriptions
    }

init : (Grid State, Cmd a)
init =
  (Grid Dead Pattern.init, none)

subscriptions : a -> Sub ()
subscriptions _ =
  every (100 * millisecond) (always ())
