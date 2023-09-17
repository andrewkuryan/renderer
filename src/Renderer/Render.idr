module Renderer.Render

import Renderer.HTML.Elements

%foreign "browser:lambda: (html) => document.body.setHTML(html)"
prim__render: String -> PrimIO ()

render: HasIO io => HTMLElement -> io ()
render content = primIO $ prim__render (show content)