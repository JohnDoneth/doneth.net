module Landing exposing (Model, Msg, init, update, view)

import Html exposing (..)
import Html.Attributes exposing (..)
import Markdown
import Static exposing (..)


type Model
    = None


type Msg
    = None2


init : Model
init =
    None


update : Msg -> Model -> Model
update msg model =
    None


downFab : Html msg
downFab =
    div
        [ class "rounded-full h-12 w-12 mx-auto my-12"
        , class "flex items-center justify-center"
        , class "bg-white"
        , class "hover:shadow-lg"
        , class "active:bg-black"
        ]
        [ img [ src "/img/arrow-down.svg", width 24, height 24 ] [] ]


heroText : String -> Html Msg
heroText textContent =
    div
        [ style "font-family" "Pacifico"
        , class "m-auto"
        , class "text-6xl"
        ]
        [ text textContent ]


heroContainer : Html Msg -> Html Msg
heroContainer input =
    div
        [ class "m-auto"
        , class "text-center"
        ]
        [ input ]


hero : Model -> Html Msg
hero model =
    div
        [ class "bg-blue-600"
        , class "h-screen"
        , class "text-white"
        , class "flex"
        ]
        [ heroContainer
            (div
                []
                [ heroText "John C. Doneth"
                , div [] [ text "Professional Software Developer" ]
                , div [] [ text "Grand Rapids, Michigan" ]
                , downFab
                ]
            )
        ]


madeWithElm : Html Msg
madeWithElm =
    div
        [ class "text-sm"
        , class "italic"
        , class "flex"
        , class "m-4"
        ]
        [ text "This website was written using"
        , a [ href "https://elm-lang.org/", class "mx-1", class "underline" ] [ text "Elm" ]
        , img
            [ class "text-red-700"
            , class "ml-1"
            , src "/img/heart.svg"
            , width 16
            , height 16
            ]
            []
        ]


aboutMe : Html Msg
aboutMe =
    div
        [ class "m-4"
        , class "px-4"
        , class "max-w-xl"
        , class "mx-auto"
        , class "leading-normal"
        ]
    <|
        Markdown.toHtml Nothing """
# Hello!

My name is John Doneth and I've been programming ever since I received my first computer as a child. To me, programming is more than ***just*** my job, it's my *passion*. 

I find it a joy to take on real world problems by creating solutions though code. With the skills I've learned I can bring project ideas into reality.
    
Feel free to checkout the projects I've worked on, as well as the skills I've learned along the way, below.
"""


renderList : List String -> Html msg
renderList lst =
    ul []
        (List.map (\l -> li [] [ text l ]) lst)


skills : Html Msg
skills =
    renderList languages


projects : Html Msg
projects =
    div [] []


contactMe : Html Msg
contactMe =
    div [] []


view : Model -> Html Msg
view model =
    div
        []
        [ hero model
        , aboutMe
        , madeWithElm
        ]
