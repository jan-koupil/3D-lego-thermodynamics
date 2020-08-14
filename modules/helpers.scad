module make_ring_of(radius, count)
{
    for (a = [0 : count - 1]) {
        angle = a * 360 / count;
        translate(radius * [sin(angle), -cos(angle), 0])
            rotate([0, 0, angle])
                children();
    }
}    


module turnAround(count)
{
    for (a = [0 : count - 1]) {
        angle = a * 360 / count;
            rotate([0, 0, angle])
                children();
    }
} 


function parametric_points(fx, fy, t0=0, t1=10, delta=0.01) 
= [for(i = [t0:delta:t1]) [fx(i), fy(i)]];