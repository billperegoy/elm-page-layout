module View exposing (view)

import Model exposing (..)
import Html exposing (..)
import Element exposing (..)
import Element.Attributes exposing (..)
import AppStyles


blockAttributes : ScreenSize -> List (Element.Internal.Model.Attribute variation msg)
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


wrapper : Model -> Element AppStyles.MyStyles variation Msg
wrapper model =
    Element.row AppStyles.PageStyle
        [ padding 20
        , paddingTop 0
        , paddingBottom 0
        ]
        [ pageArea model ]


pageArea : Model -> Element AppStyles.MyStyles variation Msg
pageArea model =
    Element.column AppStyles.PageStyle
        [ width (percent 100) ]
        [ headerArea
        , contentArea model
        , footerArea
        ]


headerArea : Element AppStyles.MyStyles variation msg
headerArea =
    el AppStyles.HeaderStyle
        []
        (Element.text "Header")


footerArea : Element AppStyles.MyStyles variation msg
footerArea =
    el AppStyles.FooterStyle
        []
        (Element.text "Footer")


sidebarArea : Model -> Element AppStyles.MyStyles variation Msg
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


contentArea : Model -> Element AppStyles.MyStyles variation Msg
contentArea model =
    Element.row AppStyles.ContentStyle
        []
        [ sidebarArea model
        , mainContentArea model
        ]



--bodyWidth : ScreenSize -> Element.Internal.Model.Attribute variation msg


bodyWidth screenSize =
    if screenSize == Phone then
        width (percent 100)
    else
        width (percent 80)


blocks : Model -> List (Element AppStyles.MyStyles variation Msg)
blocks model =
    List.map (\elem -> (singleBlock model elem))
        [ "1", "2", "3", "4", "5", "6", "7", "8", "9", "A", "B", "C", "D", "E", "F" ]


singleBlock : Model -> String -> Element AppStyles.MyStyles variation Msg
singleBlock model value =
    el AppStyles.BlockStyle
        (blockAttributes model.screenSize)
        (Element.text value)


mainContentArea : Model -> Element AppStyles.MyStyles variation Msg
mainContentArea model =
    Element.wrappedRow AppStyles.BodyStyle
        [ padding 10, spacing 7, (bodyWidth model.screenSize) ]
        (blocks model)


view : Model -> Html Msg
view model =
    Element.layout AppStyles.stylesheet <|
        wrapper model
