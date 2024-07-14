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

local POSITIVE_X = EAST
local NEGATIVE_X = WEST

local POSITIVE_Z = SOUTH
local NEGATIVE_Z = NORTH

NUMBER_OF_CARDINALS = 4

TurnCounter = NORTH

function ClampIntBin(num)
    if num > 0 then
        return 1
    elseif num < 0 then
        return -1
    end
end

function MoveRelative(dx, dy, dz)
    if dx ~= 0 then
        if dx > 0 then
            TurnToCardinal(POSITIVE_X)
        elseif dx < 0 then
            TurnToCardinal(NEGATIVE_X)
        end

        for i = 1, math.abs(dx) do
            turtle.forward()
        end
    end

    if dz ~= 0 then
        if dz > 0 then
            TurnToCardinal(POSITIVE_Z)
        elseif dz < 0 then
            TurnToCardinal(NEGATIVE_Z)
        end

        for i = 1, math.abs(dz) do
            turtle.forward()
        end
    end


    if dy > 0 then
        for i = 1, dy do
            turtle.up()
        end
    elseif dy < 0 then
        for i = 1, -1 * dy do
            turtle.down()
        end
    end
end

function ToCardinalSpace(dir)
    dir = dir % NUMBER_OF_CARDINALS

    if dir < 0 then
        return dir + NUMBER_OF_CARDINALS
    end
end

function TurnToCardinal(dir)
    dir = ToCardinalSpace(dir)
    local ddir = (dir - TurnCounter) % NUMBER_OF_CARDINALS
    if ddir > 0 then
        for i = 1, ddir do
            Right()
        end
    elseif ddir < 0 then
        for i = 1, -ddir do
            Left()
        end
    end
end

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
    end
end

function ReturnHome(sx, sy, sz)
    local x, y, z = gps.locate()
end

local sx, sy, sz = gps.locate()


turtle.forward()


local x, y, z = gps.locate()

MoveRelative(sx - x, sy - y, sz - z)


-- while true do
--     MineSquare(3, 3)/
--     Left()
--     Left()
--     turtle.digDown()
--     turtle.down()
--     MineSquare(3, 3)
-- end
