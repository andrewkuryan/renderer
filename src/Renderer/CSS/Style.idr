module Renderer.CSS.Style

import Data.String

import Renderer.CSS.StyleAttributeValue
import Renderer.CSS.StyleAttribute
import Renderer.CSS.StyleAttributesList

public export
data Style: Type where
     MkStyle: (values: List StyleAttributeValue) -> {auto prf: StyleAttributesList values} -> Style

public export
Show Style where
     show (MkStyle values) = joinBy ";" (map show values)