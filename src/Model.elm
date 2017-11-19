module Model exposing (..)

import Window


type ScreenSize
    = Phone
    | Tablet
    | Desktop
    | BigDesktop


type alias Model =
    { screenSize : ScreenSize
    }


type Msg
    = NoOp
    | SetScreenSize Window.Size
