module Main exposing (..)

import Html exposing (Html, button, div, text)
import Html.Attributes exposing (class)
import Html.Events exposing (onClick)
import Animation exposing (..)

main : Program Never Model Msg
main =
    Html.program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }



-- MODEL


type alias Card =
    { q : String

    -- whether the card is true or false
    , a : Bool
    }



-- all questions


questions : List Card
questions =
    [ { q = "My middle name is Paul."
      , a = True
      }
    , { q = "I'm a Global Elite in the game Couter-Strike Global Offensive"
      , a = False
      }
    ]


type alias Model =
    { -- holds questions that user got correct
      correct : List Card

    -- holds questions that user got incorrect
    , incorrect : List Card

    -- initial set of cards
    , cards : List Card
    }


init : ( Model, Cmd Msg ) 
init =
    ( { correct = []
    , incorrect = []
    , cards = questions
    }
    , Cmd.none
    )



-- UPDATE


type Msg
    = SwipeRight Card
    | SwipeLeft Card


update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
    case msg of
        SwipeRight card ->
            if card.a then
                ({ model
                    | correct = List.append model.correct [ card ]
                }, Cmd.none)
            else
                ({ model
                    | incorrect = List.append model.incorrect [ card ]
                }, Cmd.none)

        SwipeLeft card ->
            if not card.a then
                ({ model
                    | correct = List.append model.correct [ card ]
                }, Cmd.none)
            else
                ({ model
                    | incorrect = List.append model.incorrect [ card ]
                }, Cmd.none)

-- SUBS

subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none


-- VIEW


view : Model -> Html Msg
view model =
    div [ class "swiper" ]
        [ viewCards model ]


viewCards : Model -> Html Msg
viewCards model =
    div []
        (List.map viewCard model.cards)


viewCard : Card -> Html Msg
viewCard card =
    div [ class "card", onClick (SwipeRight card) ]
        [ text card.q ]
