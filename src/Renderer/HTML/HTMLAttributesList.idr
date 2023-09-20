module Renderer.HTML.HTMLAttributesList

import Data.List

import Renderer.Utils.List
import Renderer.HTML.HTMLAttribute
import Renderer.HTML.HTMLAttributeValue

public export
comparePairs: (String, Type) -> (String, Type) -> Ordering
comparePairs (name1, _) (name2, _) = compare name1 name2

public export
attributesToPairs: List HTMLAttribute -> List HTMLAttributeValue -> List (String, Type)
attributesToPairs attributes values =
    let (usedAttrs, unusedAttrs) = 
        partition (\attr => containsBy ((== attributeName attr) . valueName) values) attributes in
        (qsort comparePairs . map attributeToPair) usedAttrs ++ 
            (map attributeToPair . filter attributeIsRequired) unusedAttrs

public export
valuesToPairs: List HTMLAttributeValue -> List (String, Type)
valuesToPairs values = (qsort comparePairs . map valueToPair) values

public export
data HTMLAttributesList: List HTMLAttribute -> List HTMLAttributeValue -> Type where
    MkHTMLAttributesList: 
        (attributes: List HTMLAttribute) -> 
        (values: List HTMLAttributeValue) -> 
        Equal (attributesToPairs attributes values) (valuesToPairs values) ->
        HTMLAttributesList attributes values