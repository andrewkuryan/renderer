module Renderer.CSS.StyleAttribute

public export
data StyleAttribute: Type where
    MkStyleAttribute: (name: String) -> (type: Type) -> Show type => StyleAttribute

public export
attributeToPair: StyleAttribute -> (String, Type)
attributeToPair (MkStyleAttribute name type) = (name, type)