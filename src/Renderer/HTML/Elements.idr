module Renderer.HTML.Elements

import Data.List
import Data.String

import public Renderer.Utils.List
import public Renderer.HTML.HTMLAttributeValue
import public Renderer.HTML.HTMLAttribute
import public Renderer.HTML.HTMLAttributesList
import public Renderer.CSS.StyleAttributeValue
import public Renderer.CSS.StyleAttribute
import public Renderer.CSS.StyleAttributesList
import public Renderer.CSS.Style

public export
data HTMLElement = 
    MkHTMLElement String (List HTMLAttributeValue) (List HTMLElement) 
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
    MkHTMLAttribute "class" String False,
    MkHTMLAttribute "style" Style False
]

buildElement: String -> (attributes: List HTMLAttribute) -> 
    (
        (values: List HTMLAttributeValue) -> 
        (children: List HTMLElement) -> 
        {auto prf: HTMLAttributesList attributes values} -> 
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

p = buildElement "p" HTMLElementAttributes

em = buildElement "em" HTMLElementAttributes
i = buildElement "i" HTMLElementAttributes
strong = buildElement "strong" HTMLElementAttributes
b = buildElement "b" HTMLElementAttributes

AElementAttributes = HTMLElementAttributes ++ [MkHTMLAttribute "href" String True]
a = buildElement "a" AElementAttributes

ImgElementAttributes = HTMLElementAttributes ++ [
    MkHTMLAttribute "src" String True,
    MkHTMLAttribute "alt" String False
]
img = buildElement "img" ImgElementAttributes