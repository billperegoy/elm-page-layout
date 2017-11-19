module Subscriptions exposing (subscriptions)

import Window exposing (resizes)
import Model exposing (..)


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.batch [ Window.resizes SetScreenSize ]
