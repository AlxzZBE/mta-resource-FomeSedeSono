local fomeTotalValue = 100
local fomeValueLessPerMinute = 1
local fomeSeconds = 10

function playerWastedOfFome(player)
    outputChatBox("Você morreu de Fome!", player, 200, 0, 0)
    setElementHealth(player, 0)
    setElementData(player, "Status", "Morto", true)
    setElementData(player, "Fome", 10, true)
end

function lessAllPlayersOnlineFome()
    local players = getElementsByType("player")

    if #players ~= 0 then
        for _, player in ipairs(players) do
            if getElementData(player, "Status") ~= "Morto" then
                local currentPlayerFome = getElementData(player, "Fome")
                local newPlayerFome = currentPlayerFome - 1
                setElementData(player, "Fome", newPlayerFome, true)

                if newPlayerFome == 10 then
                    outputChatBox("Você está com fome!", player, 200, 0, 0)
                elseif newPlayerFome == 5 then
                    outputChatBox("Você está com muita fome!", player, 200, 0, 0)
                elseif newPlayerFome == 0 then
                    playerWastedOfFome(player)
                end
            end
        end
    end
end

setTimer(lessAllPlayersOnlineFome, fomeSeconds * 1000, 0)
