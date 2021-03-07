local tunaColor = tocolor(0, 0, 0, 255)

function SonidoEdotensei ()
    local sound = playSound("edoo.mp3",false)
    setSoundVolume(sound, 0.9)
end
addEvent ("SonidoEdo", true)
addEventHandler ("SonidoEdo", root, SonidoEdotensei)


function Edotenseitext(p)
		addEventHandler ("onClientRender", getRootElement(), textDxEdo)
	    setTimer(function() removeEventHandler("onClientRender",getRootElement(),textDxEdo) end,8000,1)
end
addEvent ("TextoEdo", true)
addEventHandler ("TextoEdo", root, Edotenseitext)

function textDxEdo ()
		dxDrawText("!Kuchiyose Edo tensei¡", 212, 611, 820, 646, tunaColor, 0.90, "pricedown", "center", "center", false, false, true, false, false)
end



------------------------------------------------Texturas---------------------------------------------------



function importTextures1()
	txd = engineLoadTXD ( "gedo/des_n-2.txd" )
		engineImportTXD ( txd, 2255 )
	col = engineLoadCOL ( "gedo/montala-2.col" )
	dff = engineLoadDFF ( "gedo/n_bit_07-2.dff", 0 )
	engineReplaceCOL ( col, 2255 )
	engineReplaceModel ( dff, 2255 )
	engineSetModelLODDistance(2255, 2000)
end

function importTextures2()
	txd = engineLoadTXD ( "gedo/des_n.txd" )
		engineImportTXD ( txd, 2256 )
	col = engineLoadCOL ( "gedo/montala.col" )
	dff = engineLoadDFF ( "gedo/n_bit_07.dff", 0 )
	engineReplaceCOL ( col, 2256 )
	engineReplaceModel ( dff, 2256 )
	engineSetModelLODDistance(2256, 2000)
end

setTimer ( importTextures1, 3000, 1)
setTimer ( importTextures2, 3000, 1)


addEventHandler("onClientResourceStop", getResourceRootElement(getThisResource()),
	function()
		engineRestoreCOL(2256)
		engineRestoreModel(2256)
	end
)

addEventHandler("onClientResourceStop", getResourceRootElement(getThisResource()),
	function()
		engineRestoreCOL(2255)
		engineRestoreModel(2255)
	end
)