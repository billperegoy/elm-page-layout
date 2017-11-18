module Initialize exposing (init)

import Model exposing (..)


init : ( Model, Cmd Msg )
init =
    Model "world" ! []
