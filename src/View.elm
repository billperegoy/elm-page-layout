module View exposing (view)

import Model exposing (..)
import Html exposing (..)
import Element exposing (..)
import Element.Attributes exposing (..)
import AppStyles


blockAttributes =
    [ width (percent 33), height (px 100) ]


wrapper =
    Element.row AppStyles.PageStyle
        [ padding 20
        , paddingTop 0
        , paddingBottom 0
        ]
        [ wholePage ]


wholePage =
    Element.column AppStyles.PageStyle
        [ width (percent 100) ]
        [ headerArea
        , contentArea
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


sidebarArea =
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


contentArea =
    Element.row AppStyles.ContentStyle
        []
        [ sidebarArea
        , bodyArea
        ]


bodyArea =
    Element.wrappedRow AppStyles.BodyStyle
        [ padding 10, spacing 7, width (percent 80) ]
        [ el AppStyles.BlockStyle blockAttributes (Element.text "1")
        , el AppStyles.BlockStyle blockAttributes (Element.text "2")
        , el AppStyles.BlockStyle blockAttributes (Element.text "3")
        , el AppStyles.BlockStyle blockAttributes (Element.text "4")
        , el AppStyles.BlockStyle blockAttributes (Element.text "5")
        , el AppStyles.BlockStyle blockAttributes (Element.text "6")
        , el AppStyles.BlockStyle blockAttributes (Element.text "7")
        , el AppStyles.BlockStyle blockAttributes (Element.text "8")
        , el AppStyles.BlockStyle blockAttributes (Element.text "9")
        , el AppStyles.BlockStyle blockAttributes (Element.text "A")
        , el AppStyles.BlockStyle blockAttributes (Element.text "B")
        , el AppStyles.BlockStyle blockAttributes (Element.text "C")
        , el AppStyles.BlockStyle blockAttributes (Element.text "D")
        , el AppStyles.BlockStyle blockAttributes (Element.text "E")
        , el AppStyles.BlockStyle blockAttributes (Element.text "F")
        ]


view : Model -> Html Msg
view model =
    Element.layout AppStyles.stylesheet <|
        wrapper
