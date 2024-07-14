local NORTH = 0
local WEST = 1
local SOUTH = 2
local EAST = 3

local DIRS = {
    [NORTH] = "NORTH",
    [WEST] = "WEST",
    [SOUTH] = "SOUTH",
    [EAST] = "EAST"
}

NUMBER_OF_CARDINALS = 4

TurnCounter = NORTH

function PrintDir()
    print(DirToString(TurnCounter))
end

function Left()
    turtle.turnLeft()
    TurnCounter = (TurnCounter + 1) % NUMBER_OF_CARDINALS

    PrintDir()
end

function Right()
    turtle.turnRight()
    TurnCounter = (TurnCounter - 1) % NUMBER_OF_CARDINALS

    if TurnCounter < 0 then
        print("hit less than check")
        TurnCounter = TurnCounter + NUMBER_OF_CARDINALS
    end

    PrintDir()
end

function DirToString(dir)
    return DIRS[dir]
end

function DownUntilStop()
    while turtle.down() do
    end
end

function DropAll()
    for i = 1, 16 do
        turtle.select(i)
        turtle.drop()
    end
end

function MineSquare(x, z)
    for _iz = 1, z do
        for _ix = 1, x - 1 do
            turtle.dig()
            turtle.forward()
        end
        if _iz ~= z then
            if (_iz) % 2 == 0 then
                Left()
                turtle.dig()
                turtle.forward()
                Left()
            else
                Right()
                turtle.dig()
                turtle.forward()
                Right()
            end
        end
        print(_iz)
    end
end

function ReturnHome(sx, sy, sz)
    local x, y, z = gps.locate()
    local dx = x - sx
end

sx, sy, sz = gps.locate()

while true do
    MineSquare(3, 3)
    Left()
    Left()
    turtle.digDown()
    turtle.down()
    MineSquare(3, 3)
end
