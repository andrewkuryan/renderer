module Renderer.CSS.StyleAttributeValue

public export
data StyleAttributeValue: Type where
    MkStyleAttributeValue: (name: String) -> (type: Type) -> Show type => (value: type) -> StyleAttributeValue 

public export
Show StyleAttributeValue where
    show (MkStyleAttributeValue name String value) = "\{name}:\{value}"
    show (MkStyleAttributeValue name type value) = "\{name}:\{show value}"

public export
(@=): {t: Type} -> Show t => (name: String) -> (a: t) -> StyleAttributeValue
(@=) name value = MkStyleAttributeValue name t value

infixr 10 @=

public export
valueToPair: StyleAttributeValue -> (String, Type)
valueToPair (MkStyleAttributeValue name type _) = (name, type)