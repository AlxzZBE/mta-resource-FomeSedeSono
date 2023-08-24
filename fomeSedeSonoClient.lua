local screenW, screenH = guiGetScreenSize()
local resW, resH = 1366, 768
local x, y = (screenW/resW), (screenH/resH)
local baseX, baseY, baseW, baseH = x*1276, y*678, x*50, y*50
------ TexTures--------
local baseImg = dxCreateTexture("images/baseHud.png", "dxt3", true, "clamp")
local fomeFundoImg = dxCreateTexture("images/fomeFundoHud.png", "dxt3", true, "wrap")
local fomeIcon = dxCreateTexture("images/fomeIconHud.png", "dxt3", true, "clamp")

function fome()
    local fome = getElementData(localPlayer, "Fome")

    dxDrawImage(baseX, baseY, baseW, baseH, baseImg, 0, 0, 0, tocolor(255, 255, 255, 180), false)
    dxDrawImage(baseX, baseY+baseH, baseW, -(baseH*(fome/100)), fomeFundoImg, 180, 0, 0, tocolor(255, 255, 255, 180), false)
    dxDrawImage(baseX+10, baseY+10, baseW-20, baseH-20, fomeIcon, 0, 0, 0, tocolor(255, 255, 255, 180), false)
end

function sede()
    local sede = getElementData(localPlayer, "Sede")

    dxDrawImage(baseX-baseW - 10, baseY, baseW, baseH, baseImg, 0, 0, 0, tocolor(255, 255, 255, 180), false)
    dxDrawImage(baseX-baseW - 10, baseY+baseH, baseW, -(baseH*(sede/100)), fomeFundoImg, 180, 0, 0, tocolor(255, 255, 255, 180), false)
    dxDrawImage(baseX-baseW - 10 +10, baseY+10, baseW-20, baseH-20, fomeIcon, 0, 0, 0, tocolor(255, 255, 255, 180), false)
end

function sono()
    local sono = getElementData(localPlayer, "Sono")

    dxDrawImage(baseX-baseW*2 - 20, baseY, baseW, baseH, baseImg, 0, 0, 0, tocolor(255, 255, 255, 180), false)
    dxDrawImage(baseX-baseW*2 - 20, baseY+baseH, baseW, -(baseH*(sono/100)), fomeFundoImg, 180, 0, 0, tocolor(255, 255, 255, 180), false)
    dxDrawImage(baseX-baseW*2 - 20 +10, baseY+10, baseW-20, baseH-20, fomeIcon, 0, 0, 0, tocolor(255, 255, 255, 180), false)
end

function drawInUi()
    fome()
    sede()
    sono()
end
addEventHandler("onClientRender", root, drawInUi)