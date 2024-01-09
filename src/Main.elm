module Main exposing (..)
import Browser
import Html
import Css exposing (..)
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (css, href, src)
import Html.Styled.Events exposing (onClick)

main = 
  Browser.sandbox
        { init = init
        , view = view >> toUnstyled
        , update = update
        }

type alias Model = 
  { framework : String
  , progressStage : Int
  }

-- product type
init : Model
init = 
  { framework = "something"
  , progressStage = 0
  }

view : Model -> Html Msg
view model = 
  div 
    []
    [ 
      frameworkNav ["TidalCycles", "Euterpea", "Kulitta"]
    , h1 [] [text ("You are looking at -> " ++ model.framework)]
    ]


-- sum type
type Msg = 
    SwitchFramework String
  | NextStage Int


frameworkNav : List String -> Html Msg
frameworkNav fws = 
  ul 
    [ 
      css 
        [ displayFlex
        , flexDirection row
        , listStyle none
        ]
    ]
    (List.map (\name -> 
      li 
        [ 
          css 
          [ margin (px 5)]
        ] 
        [a [onClick (SwitchFramework name)] [text name]
        ]) 
      fws)


update : Msg -> Model -> Model
update msg model = 
  case msg of
    
    SwitchFramework name -> 
      { model | framework = name}

    NextStage offset ->
      { model | progressStage = model.progressStage + offset}
