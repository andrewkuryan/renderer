module Renderer.HTML.AttributeValue

public export
data AttributeValue: Type where
    MkAttributeValue: (name: String) -> (type: Type) -> Show type => (value: type) -> AttributeValue 

public export
Show AttributeValue where
    show (MkAttributeValue name type value) = "\{name}=\{show value}"

public export
(@=): {t: Type} -> Show t => (name: String) -> (a: t) -> AttributeValue
(@=) name value = MkAttributeValue name t value

infixr 10 @=

public export
valueName: AttributeValue -> String
valueName (MkAttributeValue name _ _) = name

public export
valueToPair: AttributeValue -> (String, Type)
valueToPair (MkAttributeValue name type _) = (name, type)