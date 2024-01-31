version = [ "v"," ","0",".","0",".","1"];
//pozor, rozměry jsou zatím vycucané z prstů
//prumer a polomer si mozna pletu

baterka_prumer=39.6;
baterka_polomer=baterka_prumer/2;

baterka_vule=.08;
tloustka_steny=1.5;

delka_trubky=40; //cista trubka
delka_zapacky=5;
vyska_zapacky=2;
sirka_zapacky=3;
$fn=200;

plexi_prostor=3 + 0.5;
plexi_radius=5000;

x_dole =3; //+-
y_dole=(baterka_polomer)+tloustka_steny;
z_dole=delka_zapacky;

z_nahore=delka_zapacky+delka_trubky;
x_nahore_osa=(baterka_polomer)+2*tloustka_steny -1;

x_nahore=3;//+2*tloustka_steny; //+-
y_nahore=(baterka_polomer)*2;


y_spicka=y_nahore-10;
z_spicka=delka_zapacky+delka_trubky+30;
x_spicka=x_nahore;


hPoints = [
  [  x_dole,y_dole,z_dole ],  
  [  -x_dole,y_dole,z_dole ],  
  [  x_nahore,y_nahore,z_nahore ],  
  [  -x_nahore,y_nahore,z_nahore ],  
  [  x_nahore_osa,0,z_nahore ],  
  [  -x_nahore_osa,0,z_nahore ],
  [  x_spicka,y_spicka,z_spicka ],  
  [  -x_spicka,y_spicka,z_spicka ],  
  [  x_spicka,0,z_spicka ],  
  [  -x_spicka,0,z_spicka ],  
  ]; //7
  
hFaces = [
  [0,2,3,1], 
  [1,3,5], 
  [0,4,2],  
  //[2,4,5,3], 
  [0,1,5,4],
  
  [6,7,3,2],
  [8,6,2,4],
  [9,8,4,5],
  [9,5,3,7],
  
  [9,7,6,8]
];

difference(){
       union(){
translate([0,0,delka_trubky+delka_zapacky]) 
           cylinder(z_spicka - (delka_trubky+delka_zapacky),baterka_polomer +tloustka_steny*2,x_nahore-2, false);                             


           
cylinder(delka_trubky+delka_zapacky,baterka_polomer +2*tloustka_steny,baterka_polomer +2*tloustka_steny, false);                             
           
           
  polyhedron( hPoints, hFaces );
  mirror([0,1,0]) polyhedron( hPoints, hFaces );

           
           
       }
       
union(){    
    
     translate ([0,0,
    
    ((z_spicka- z_nahore)/2)
    +z_nahore
    
    
    ]) rotate([0,-90,0])   cylinder(30,3,3, center=false,  $fn=16);  // Otvor na sroub
    
    
    
      translate([0,0,plexi_radius+delka_trubky+delka_zapacky]) rotate([0,90,0])
        cylinder(plexi_prostor,plexi_radius,plexi_radius, center=true,  $fn=300);  // Otvor na plexi
    
    
    translate([0,0,-.5]) 
        cylinder(delka_trubky+1+delka_zapacky,baterka_polomer,baterka_polomer -baterka_vule, false,$fn=200);   //telo baterky
    
    translate([baterka_polomer +tloustka_steny,sirka_zapacky/2+.25,delka_trubky/2-.01])
        scale([tloustka_steny*3,0.5,delka_trubky])
            cube(1,true); //vyrez na packu
    translate([baterka_polomer +tloustka_steny,-.25-sirka_zapacky/2,delka_trubky/2 -.01])
        scale([tloustka_steny*3,0.5,delka_trubky]) 
            cube(1,true);    //druhy symetricky
    
    for(i=[0:1:len(version)]){
  rotate([0,0,180  -(i - (len(version)/2) ) *8]){
    translate( [baterka_polomer+.01,0,5])
      rotate([90,0,-90])
        linear_extrude(1)
          text(version[i],size=5,valign="center",halign="center"); //vnitrni cislo verze
    }
  }


    

  
    
}

}



translate([baterka_polomer,0,+delka_zapacky])
    rotate([90,0,0])
        scale([.3,1,1]) 
            cylinder(sirka_zapacky,delka_zapacky,delka_zapacky,true,$fn=50);         




  
  










