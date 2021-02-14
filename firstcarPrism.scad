 //fps = 15
 //steps = 100
 //$t is a time-constant from 0 to .99 and rounds over
 module prism(l, w, h){
    polyhedron(
        points=[[0,0,0], [l,0,0], [l,w,0], [0,w,0], [0+1,w,h], [l-1,w,h]],
        faces=[[0,1,2,3],[5,4,3,2],[0,4,5,1],[0,3,4],[5,2,1]]
    );
}
//preview of the data at hand
echo($t);
echo($vpr);
$vpr = [55+sin(90*$t),0,55+$t*360];//view point angel controller
echo($vpt);
$vpt = [20,0,0];//viepoint offeset (traslate)
//
rotate([0+$t*60*0,20,-10])translate([-5,-10,]){
    translate([5,0,0]){
        color("white")translate([0,3,2])rotate([90,$t*1000,90])cylinder(h=2,d=10,center=true);  
        color("white")translate([0,22,2])rotate([90,$t*720,80])cylinder(h=2,d=10,center=true);  
    }
    color("blue",0.5)cube([10,25,5]);
    color("red",1)translate([0,0,5-0.0999])prism(10,10,5);
    color("red",1)translate([0,25,5-0.0999])prism(10,-10,5);
    CubePoints = [
        [  0,  0,  0 ],  //0
        [ 10,  0,  0 ],  //1
        [ 10,  5, 0 ],  //2
        [  0,  5, 0 ],  //3
        [0+1,  0,  5-.0999 ],  //4
        [10-1,  0,  5-.0999 ],  //5
        [10-1,  5,  5-.0999 ],  //6
        [0+1,  5,  5-.0999 ] //7
    ];
    
    CubeFaces = [
        [0,1,2,3],  // bottom
        [4,5,1,0],  // front
        [7,6,5,4],  // top
        [5,6,2,1],  // right
        [6,7,3,2],  // back
        [7,4,0,3] // left
    ];
    color("red",1)translate([0,10,5])polyhedron( CubePoints, CubeFaces );
}