local tiempo = 3500
 
addCommandHandler("edo",
function( sourcePlayer )
if isPedInVehicle(sourcePlayer) then outputChatBox("Estas en un vehiculo no puedes usar jutsus.",sourcePlayer,0,0,0,false) return end
if isObjectInACLGroup("user." .. getAccountName(getPlayerAccount(sourcePlayer)), aclGetGroup("Jutsus.prohibidos")) then
if (getTickCount ( ) - tiempo > 10000) then
if exports["Chacrka_system"]:ischakraSuficientePara(sourcePlayer,80) then
exports["Chacrka_system"]:Diminuirchakra(sourcePlayer,80)
tiempo = getTickCount ( )
local x, y, z = getElementPosition ( sourcePlayer )
local team = getPlayerTeam( sourcePlayer )
local obtenerdi = getElementDimension ( sourcePlayer )
objeto = createObject( 2256, x + 2, y + 3, z - 10, 0, 0, 270)
objeto1 = createObject( 2255, x + 2, y + 3, z - 10, 0, 0, 270)
setElementDimension (objeto,obtenerdi)
setElementDimension (objeto1,obtenerdi)
setTimer (destroyElement, 20000, 1, objeto)
setTimer (destroyElement, 20000, 1, objeto1)
moveObject ( objeto, 6500, x + 2, y + 3, z - 1)
moveObject ( objeto1, 6500, x + 2, y + 2.5, z - 1)
outputChatBox ( "!Kuchiyose Edo tensei¡", sourcePlayer, 0, 0, 0, false )
triggerClientEvent (sourcePlayer, "TextoEdo", sourcePlayer)
triggerClientEvent (sourcePlayer, "SonidoEdo", sourcePlayer)
setPedAnimation( sourcePlayer , "freeweights", "gym_free_pickup", -1, true, false, false )
setTimer (
        function ( )
			local myPed = exports.slothbot:spawnBot( x + 2.2, y + 3, z, 90, 68, 0, 0, team, 4, "chasing", true )
			setElementDimension (myPed,obtenerdi)
			setTimer(destroyElement, 60000, 1, myPed)
        end
        ,7900, 1
    )	
setTimer (
        function ( )
            setPedAnimation ( sourcePlayer )
        end
        ,2200, 1
    )
setTimer (
        function ( )
            moveObject ( objeto1, 2000, x + 2, y + 2.5, z - 0.9, 0, 78, 0)
		end
        ,8000, 1
    )
setTimer (
        function ( )
			moveObject ( objeto, 4000, x + 2, y + 3, z - 10)
            moveObject ( objeto1, 4000, x + 2, y + 2.5, z - 10, 0, 0, 0)
			objeto7 = createObject( 2780, x + 2, y + 2.5, z - 2, 0, 0, 0)
			setTimer(destroyElement, 900, 1, objeto7)
        end
        ,19000, 1
    )
setTimer (
        function ( )
            moveObject ( objeto1, 3000, x + 2, y + 2.5, z - 1.01, 0, -78, 0)
        end
        ,15000, 1
    )
setTimer (
        function ( )
            objeto6 = createObject( 2780, x + 2, y + 2.5, z - 2, 0, 0, 0)
			setTimer(destroyElement, 900, 1, objeto6)
        end
        ,4000, 1
    )
else
outputChatBox("No tiene chakra suficiente!",sourcePlayer,0,0,0,false)
end
else
outputChatBox("Debes esperar 10 segundos para poder utilizar este jutsu!",sourcePlayer,255,0,0,false)
end
else
outputChatBox("No puedes usar los jutsus prohibidos",sourcePlayer,0,0,0,false)
end end)