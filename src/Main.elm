module Main exposing (..)

import Html exposing (..)
import Model exposing (..)
import Update
import View
import Initialize
import Subscriptions


main : Program Never Model Msg
main =
    Html.program
        { init = Initialize.init
        , view = View.view
        , update = Update.update
        , subscriptions = Subscriptions.subscriptions
        }
