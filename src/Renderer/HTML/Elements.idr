module Renderer.HTML.Elements

import Data.List
import Data.String

import Renderer.Utils.List
import Renderer.HTML.HTMLAttribute
import Renderer.HTML.AttributeValue
import Renderer.HTML.AttributesList

public export
data HTMLElement = 
    MkHTMLElement String (List AttributeValue) (List HTMLElement) 
    | MkText String

public export
Show HTMLElement where
     show (MkText text) = text
     show (MkHTMLElement tagName values children) = 
          "<\{tagName}" ++ joinBy "" (map ((" " ++) . show) values) ++
            case children of
                [] => "/>"
                _ => ">" ++ joinBy "" (map (assert_total show) children) ++ "</\{tagName}>"

public export
HTMLElementAttributes: List HTMLAttribute
HTMLElementAttributes = [
    MkHTMLAttribute "id" String False,
    MkHTMLAttribute "class" String False
]

buildElement: String -> (attributes: List HTMLAttribute) -> 
    (
        (values: List AttributeValue) -> 
        (children: List HTMLElement) -> 
        {auto prf: AttributesList attributes values} -> 
        HTMLElement
    )
buildElement tagName _ = (\values, children => MkHTMLElement tagName values children)    

div = buildElement "div" HTMLElementAttributes
section = buildElement "section" HTMLElementAttributes

h1 = buildElement "h1" HTMLElementAttributes
h2 = buildElement "h2" HTMLElementAttributes
h3 = buildElement "h3" HTMLElementAttributes
h4 = buildElement "h4" HTMLElementAttributes
h5 = buildElement "h5" HTMLElementAttributes
h6 = buildElement "h6" HTMLElementAttributes