module Renderer.HTML.AttributesList

import Data.List

import Renderer.Utils.List
import Renderer.HTML.HTMLAttribute
import Renderer.HTML.AttributeValue

public export
comparePairs: (String, Type) -> (String, Type) -> Ordering
comparePairs (name1, _) (name2, _) = compare name1 name2

public export
attributesToPairs: List HTMLAttribute -> List AttributeValue -> List (String, Type)
attributesToPairs attributes values =
    let (usedAttrs, unusedAttrs) = 
        partition (\attr => containsBy ((== attributeName attr) . valueName) values) attributes in
        (qsort comparePairs . map attributeToPair) usedAttrs ++ 
            (map attributeToPair . filter attributeIsRequired) unusedAttrs

public export
valuesToPairs: List AttributeValue -> List (String, Type)
valuesToPairs values = (qsort comparePairs . map valueToPair) values

public export
data AttributesList: List HTMLAttribute -> List AttributeValue -> Type where
    MkAttributesList: 
        (attributes: List HTMLAttribute) -> 
        (values: List AttributeValue) -> 
        Equal (attributesToPairs attributes values) (valuesToPairs values) ->
        AttributesList attributes values