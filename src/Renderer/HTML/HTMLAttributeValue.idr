module Renderer.HTML.HTMLAttributeValue

public export
data HTMLAttributeValue: Type where
    MkHTMLAttributeValue: (name: String) -> (type: Type) -> Show type => (value: type) -> HTMLAttributeValue 

public export
Show HTMLAttributeValue where
    show (MkHTMLAttributeValue name type value) = "\{name}=\{show value}"

public export
(@=): {t: Type} -> Show t => (name: String) -> (a: t) -> HTMLAttributeValue
(@=) name value = MkHTMLAttributeValue name t value

infixr 10 @=

public export
valueName: HTMLAttributeValue -> String
valueName (MkHTMLAttributeValue name _ _) = name

public export
valueToPair: HTMLAttributeValue -> (String, Type)
valueToPair (MkHTMLAttributeValue name type _) = (name, type)