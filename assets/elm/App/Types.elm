module App.Types exposing (..)

import GraphQL.Client.Http as GraphQLClient
import Html exposing (Html)


type Msg
    = ReceiveQueryResponse PostsResponse
    | ReceiveCreateMutationResponse PostResponse
    | ReceieveDeleteMutationResponse DeletePostResponse
    | ReceieveDeleteAllMutationResponse DeleteAllPostResponse
    | OpenCreateView
    | CreatePost NewPost
    | NewTitleChange String
    | NewBodyChange String
    | DeletePost PostId
    | OpenPost PostId
    | ClosePost
    | DeleteAllPosts
    | TimerTick


type alias PostsResponse =
    Result GraphQLClient.Error (List Post)


type alias PostResponse =
    Result GraphQLClient.Error Post


type alias DeletePostResponse =
    Result GraphQLClient.Error PostId


type alias DeleteAllPostResponse =
    Result GraphQLClient.Error Int


type alias PostId =
    String


type alias Model =
    { posts : List Post
    , openedPost : Maybe Post
    , newPost : Maybe NewPost
    , showToast : Bool
    , toastTimerCounter : Int
    , toastMsg : Maybe String
    }


type alias Post =
    { id : PostId
    , title : String
    , body : String
    }


type alias NewPost =
    { title : String
    , body : String
    }


type alias DialogConfig =
    { closeMessage : Maybe Msg
    , containerClass : Maybe String
    , header : Maybe (Html Msg)
    , body : Maybe (Html Msg)
    , footer : Maybe (Html Msg)
    }
