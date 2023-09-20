module Renderer.CSS.StyleAttribute

public export
data StyleAttribute: Type where
    MkStyleAttribute: (name: String) -> (type: Type) -> Show type => StyleAttribute

public export
attributeName: StyleAttribute -> String
attributeName (MkStyleAttribute name _) = name

public export
attributeToPair: StyleAttribute -> (String, Type)
attributeToPair (MkStyleAttribute name type) = (name, type)