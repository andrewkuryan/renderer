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
attributesToPairs: List StyleAttribute -> List StyleAttributeValue -> List (String, Type)
attributesToPairs attributes values = (qsort comparePairs . map attributeToPair) 
    (filter (\attr => containsBy ((== attributeName attr) . valueName) values) attributes)

public export
valuesToPairs: List StyleAttributeValue -> List (String, Type)
valuesToPairs values = (qsort comparePairs . map valueToPair) values

public export
data StyleAttributesList: List StyleAttributeValue -> Type where
    MkStyleAttributesList: 
        (values: List StyleAttributeValue) -> 
        Equal (attributesToPairs StyleAttributes values) (valuesToPairs values) ->
        StyleAttributesList values