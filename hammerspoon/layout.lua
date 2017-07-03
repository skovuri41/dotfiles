local layout = hs.layout

layout.left33 = hs.geometry.rect(0, 0, 0.333, 1)

layout.left66 = hs.geometry.rect(0, 0, 0.666, 1)

layout.right33 = hs.geometry.rect(0.666, 0, 0.333, 1)

layout.right66 = hs.geometry.rect(0.333, 0, 0.666, 1)

layout.topLeftQuad = hs.geometry.rect(0, 0, 0.5, 0.5)

layout.topRightQuad = hs.geometry.rect(0.5, 0, 0.5, 0.5)

layout.bottomLeftQuad = hs.geometry.rect(0, 0.5, 0.5, 0.5)

layout.bottomRightQuad = hs.geometry.rect(0.5, 0.5, 0.5, 0.5)

return layout
