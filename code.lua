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
                turtle.turnLeft()
                turtle.dig()
                turtle.forward()
                turtle.turnLeft()
            else
                turtle.turnRight()
                turtle.dig()
                turtle.forward()
                turtle.turnRight()
            end
        end
        print(_iz)
    end
end

DownUntilStop()

local sx, sy, sz = gps.locate()
print(sx)
-- MineSquare(3, 3)
-- turtle.turnLeft()
-- turtle.turnLeft()
-- turtle.digDown()
-- turtle.down()
-- MineSquare(3, 3)
