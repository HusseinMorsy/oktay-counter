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
    ul []
        [ viewHello "Oktay"
        , viewHello "Ugur"
        , viewHello "Esma"
        , br [] []
        , button [ onClick Eksi ] [ text "-" ]
        , span [ counterStyle model ] [ text (toString model) ]
        , button [ onClick Arti ] [ text "+" ]
        , br [] []
        , button [ onClick Reset ] [ text "Reset" ]
        ]


viewHello : String -> Html.Html a
viewHello name =
    li [] [ text ("Merhaba " ++ name) ]


counterStyle : Model -> Html.Attribute Msg
counterStyle model =
    style
        [ ( "font-size", "18px" )
        , ( "padding", "10px" )
        , ( "font-weight", "bold" )
        , ( "color"
          , if model >= 10 then
                "red"
            else
                "black"
          )
        ]
