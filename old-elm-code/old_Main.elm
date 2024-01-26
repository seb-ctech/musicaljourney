module oldMain exposing (Model, Msg(..), frameworkNav, init, main, update, view)

import Browser


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
        [ frameworkNav [ "TidalCycles", "Euterpea", "Kulitta" ]
        , h1 [] [ text ("You are looking at -> " ++ model.framework) ]
        ]



-- sum type


type Msg
    = SwitchFramework String
    | NextStage Int




update : Msg -> Model -> Model
update msg model =
    case msg of
        SwitchFramework name ->
            { model | framework = name }

        NextStage offset ->
            { model | progressStage = model.progressStage + offset }
