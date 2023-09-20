module Renderer.CSS.StyleAttributesList

import Data.List

import Renderer.Utils.List
import Renderer.CSS.StyleAttribute
import Renderer.CSS.StyleAttributeValue

public export
StyleAttributes: List StyleAttribute
StyleAttributes = [
    MkStyleAttribute "color" String,
    MkStyleAttribute "border-color" String
]

public export
comparePairs: (String, Type) -> (String, Type) -> Ordering
comparePairs (name1, _) (name2, _) = compare name1 name2

public export
attributesToPairs: List StyleAttribute -> List (String, Type)
attributesToPairs attributes = (qsort comparePairs . map attributeToPair) attributes

public export
valuesToPairs: List StyleAttributeValue -> List (String, Type)
valuesToPairs values = (qsort comparePairs . map valueToPair) values

public export
data StyleAttributesList: List StyleAttributeValue -> Type where
    MkStyleAttributesList: 
        (values: List StyleAttributeValue) -> 
        Equal (attributesToPairs StyleAttributes) (valuesToPairs values) ->
        StyleAttributesList values