module AppStyles exposing (..)

import Style exposing (..)
import Style.Font as Font
import Style.Color as Color
import Color exposing (..)


type MyStyles
    = BlockStyle
    | BodyStyle
    | PageStyle
    | ContentStyle
    | HeaderStyle
    | FooterStyle
    | SidebarStyle


sansSerif =
    Font.typeface [ Font.font "Helvetica" ]


stylesheet : StyleSheet MyStyles variation
stylesheet =
    Style.styleSheet
        [ Style.style BodyStyle
            [ Color.background grey
            ]
        , Style.style BlockStyle
            [ sansSerif
            , Color.text black
            , Color.background yellow
            , Font.size 50
            ]
        , Style.style HeaderStyle
            [ sansSerif
            , Font.size 50
            , Color.background darkGrey
            ]
        , Style.style FooterStyle
            [ sansSerif
            , Font.size 50
            , Color.background darkGrey
            ]
        , Style.style SidebarStyle
            [ sansSerif
            , Font.size 20
            , Color.background grey
            ]
        , Style.style PageStyle []
        , Style.style ContentStyle []
        ]
