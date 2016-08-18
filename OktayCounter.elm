module Main exposing (..)

import Html exposing (..)
import Html.Events exposing (onClick)
import Html.Attributes exposing (style)
import Html.App


main : Program Never
main =
    Html.App.beginnerProgram { model = model, view = view, update = update }



-- MODEL


type alias Model =
    Int


model : Int
model =
    0



-- UPDATE


type Msg
    = Arti
    | Eksi
    | Reset


update : Msg -> Model -> Model
update msg model =
    case msg of
        Arti ->
            model + 1

        Eksi ->
            if model > 0 then
                model - 1
            else
                0

        Reset ->
            0



-- VIEW


view : Model -> Html Msg
view model =
    div [ mainStyle ]
        [ viewTitle "Oktay's Counter"
        , br [] []
        , button [ onClick Eksi, buttonStyle ] [ text "-" ]
        , span [ counterStyle model ] [ text (toString model) ]
        , button [ onClick Arti, buttonStyle ] [ text "+" ]
        , br [] []
        , button [ onClick Reset, buttonStyle ] [ text "Reset" ]
        ]


viewTitle : String -> Html.Html a
viewTitle title =
    h2 [ style [ ( "text-align", "center" ) ] ] [ text (title) ]


mainStyle : Html.Attribute Msg
mainStyle =
    style
        [ ( "display", "flex" )
        , ( "flex-direction", "column" )
        , ( "align-items", "center" )
        , ( "justify-content", "center" )
        ]


buttonStyle : Html.Attribute Msg
buttonStyle =
    style [ ( "font-size", "40px" ), ( "margin", "0 10px" ) ]


counterStyle : Model -> Html.Attribute Msg
counterStyle model =
    style
        [ ( "font-size", "30px" )
        , ( "padding", "10px" )
        , ( "font-weight", "bold" )
        , ( "color"
          , if model >= 10 then
                "red"
            else
                "black"
          )
        ]
