module Update exposing (update)

import Model exposing (..)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            model ! []

        SetScreenSize size ->
            { model | screenSize = getScreenSize size } ! []


getScreenSize size =
    if size.width <= 600 then
        Phone
    else if size.width <= 1200 then
        Tablet
    else if size.width <= 1800 then
        Desktop
    else
        BigDesktop
