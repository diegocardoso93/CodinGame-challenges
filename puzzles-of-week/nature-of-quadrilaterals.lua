function calculate_distance(xa,ya,xb,yb)
    return math.sqrt( (xa-xb)^2 + (ya - yb)^2 )
end

function angle_two_sides(d1,d2,d3)
    return d1^2+d2^2-d3^2 - 2*d1*d2
end

n = tonumber(io.read())

for i=0, n-1 do
    next_token = string.gmatch(io.read(), "[^%s]+")
    A = next_token()
    xA = tonumber(next_token())
    yA = tonumber(next_token())
    B = next_token()
    xB = tonumber(next_token())
    yB = tonumber(next_token())
    C = next_token()
    xC = tonumber(next_token())
    yC = tonumber(next_token())
    D = next_token()
    xD = tonumber(next_token())
    yD = tonumber(next_token())

    io.write(A, B, C, D .. " is a ")

    d1 = calculate_distance(xA,yA,xB,yB)
    d2 = calculate_distance(xB,yB,xC,yC)
    d3 = calculate_distance(xC,yC,xD,yD)
    d4 = calculate_distance(xD,yD,xA,yA)
    h1 = calculate_distance(xC,yC,xA,yA)
    h2 = calculate_distance(xB,yB,xD,yD)

    tcos1 = angle_two_sides(d1,d2,h1)
    tcos2 = angle_two_sides(d2,d3,h2)
    tcos3 = angle_two_sides(d3,d4,h1)
    tcos4 = angle_two_sides(d1,d4,h2)
    
    if d1 == d2 and d3 == d4 then
        
        res = 0
        if calculate_distance(xB,yB,xC,yC) == calculate_distance(xC,yC,xD,yD)
            and calculate_distance(xA,yA,xB,yB) == calculate_distance(xD,yD,xA,yA) then
            res = 1
        end
        
        if (tcos1==tcos2 and tcos2==tcos3 and tcos3==tcos4 and tcos4==tcos1) then
            res = res + 2
        end
        
        if res == 1 then
            io.write("rhombus")
        elseif res == 2 then
            io.write("rectangle")
        elseif res == 3 then
            io.write("square")
        end
        
    elseif (tcos1==tcos2 and tcos2==tcos3 and tcos3==tcos4 and tcos4==tcos1) then
            io.write("rectangle")
    elseif ((d1 == d3 or d2==d4) and (tcos1==tcos3 and tcos2==tcos4)) then
        io.write("parallelogram")
    else
        io.write("quadrilateral")
    end
    io.write(".\n")
end