module View exposing (view)

import Model exposing (..)
import Html exposing (..)
import Element exposing (..)
import Element.Attributes exposing (..)
import AppStyles


blockAttributes screenSize =
    case screenSize of
        Phone ->
            [ width (percent 100), height (px 100) ]

        Tablet ->
            [ width (percent 50), height (px 100) ]

        Desktop ->
            [ width (percent 33), height (px 100) ]

        BigDesktop ->
            [ width (percent 25), height (px 100) ]


wrapper model =
    Element.row AppStyles.PageStyle
        [ padding 20
        , paddingTop 0
        , paddingBottom 0
        ]
        [ wholePage model ]


wholePage model =
    Element.column AppStyles.PageStyle
        [ width (percent 100) ]
        [ headerArea
        , contentArea model
        , footerArea
        ]


headerArea =
    el AppStyles.HeaderStyle
        []
        (Element.text "Header")


footerArea =
    el AppStyles.FooterStyle
        []
        (Element.text "Footer")


sidebarArea model =
    if model.screenSize == Phone then
        Element.empty
    else
        Element.column AppStyles.SidebarStyle
            [ paddingLeft 20
            , paddingTop 50
            , width (percent 20)
            ]
            [ Element.text "Sidebar"
            , Element.text "Sidebar"
            , Element.text "Sidebar"
            , Element.text "Sidebar"
            , Element.text "Sidebar"
            ]


contentArea model =
    Element.row AppStyles.ContentStyle
        []
        [ sidebarArea model
        , bodyArea model
        ]


bodyWidth screenSize =
    if screenSize == Phone then
        width (percent 100)
    else
        width (percent 80)


bodyArea model =
    Element.wrappedRow AppStyles.BodyStyle
        [ padding 10, spacing 7, (bodyWidth model.screenSize) ]
        [ el AppStyles.BlockStyle (blockAttributes model.screenSize) (Element.text "1")
        , el AppStyles.BlockStyle (blockAttributes model.screenSize) (Element.text "2")
        , el AppStyles.BlockStyle (blockAttributes model.screenSize) (Element.text "3")
        , el AppStyles.BlockStyle (blockAttributes model.screenSize) (Element.text "4")
        , el AppStyles.BlockStyle (blockAttributes model.screenSize) (Element.text "5")
        , el AppStyles.BlockStyle (blockAttributes model.screenSize) (Element.text "6")
        , el AppStyles.BlockStyle (blockAttributes model.screenSize) (Element.text "7")
        , el AppStyles.BlockStyle (blockAttributes model.screenSize) (Element.text "8")
        , el AppStyles.BlockStyle (blockAttributes model.screenSize) (Element.text "9")
        , el AppStyles.BlockStyle (blockAttributes model.screenSize) (Element.text "A")
        , el AppStyles.BlockStyle (blockAttributes model.screenSize) (Element.text "B")
        , el AppStyles.BlockStyle (blockAttributes model.screenSize) (Element.text "C")
        , el AppStyles.BlockStyle (blockAttributes model.screenSize) (Element.text "D")
        , el AppStyles.BlockStyle (blockAttributes model.screenSize) (Element.text "E")
        , el AppStyles.BlockStyle (blockAttributes model.screenSize) (Element.text "F")
        ]


view : Model -> Html Msg
view model =
    Element.layout AppStyles.stylesheet <|
        wrapper model
