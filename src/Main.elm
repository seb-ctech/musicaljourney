module Main exposing (..)
import Browser
import Html
import Css exposing (..)
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (css, href, src)

main = 
  Browser.sandbox
        { init = init
        , view = view >> toUnstyled
        , update = update
        }

type alias Model = Int

init : Model
init = 
  0


view _ = 
  div 
    []
    [ 
      ul 
        [ css 
            [ displayFlex
             ,flexDirection row
             ,listStyle none
            ]
        ]
        (List.map (\name -> 
          li 
            [ css 
              [ margin (px 5)]
          ] [a [] [text name]]) 
          ["TidalCycles", "Euterpea", "Kulitta"])
    ]
  
update model _ = model