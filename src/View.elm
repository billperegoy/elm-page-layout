module View exposing (view)

import Model exposing (..)
import Html exposing (..)
import Element exposing (..)
import Element.Attributes exposing (..)
import AppStyles


blockAttributes =
    [ width fill, height (px 100) ]


wholePage =
    Element.column AppStyles.PageStyle
        [ width (px 850) ]
        [ headerArea, contentArea, footerArea ]


headerArea =
    el AppStyles.HeaderStyle
        []
        (Element.text "Header")


footerArea =
    el AppStyles.FooterStyle
        []
        (Element.text "Footer")


sidebarArea =
    el AppStyles.SidebarStyle
        [ width (px 200) ]
        (Element.text "Sidebar")


contentArea =
    Element.row AppStyles.ContentStyle
        []
        [ sidebarArea
        , bodyArea
        ]


bodyArea =
    Element.row AppStyles.BodyStyle
        [ padding 10, spacing 7, width (px 600), height (px 300) ]
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
        ]


view : Model -> Html Msg
view model =
    Element.layout AppStyles.stylesheet <|
        wholePage
