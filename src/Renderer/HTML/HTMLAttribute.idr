module Renderer.HTML.HTMLAttribute

public export
data HTMLAttribute: Type where
    MkHTMLAttribute: (name: String) -> (type: Type) -> Show type => (isRequired: Bool) -> HTMLAttribute

public export
attributeName: HTMLAttribute -> String
attributeName (MkHTMLAttribute name _ _) = name

public export
attributeIsRequired: HTMLAttribute -> Bool
attributeIsRequired (MkHTMLAttribute _ _ isRequired) = isRequired

public export
attributeToPair: HTMLAttribute -> (String, Type)
attributeToPair (MkHTMLAttribute name type _) = (name, type)