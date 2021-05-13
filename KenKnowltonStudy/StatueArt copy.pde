void setup(){
size(500,375);
noLoop();
}
void draw(){
  statue();
}

void statue(){
 
  background(255);
  Statue statue = new Statue();
  String[][] clrs = statue.getColors();
  String[][] comprs = statue.getColorsCompressed();

  //fill(0);
  //text(clrs[0][0], 10, 10);
  //fill(0);
  //text(clrs[0][1], 10, 20);
  
  for(int i = 10; i < statue.getImgL(); i++){
     for(int j = 10; j < statue.getImgW(); j++){
       fill(0);
       //size 4 || 5 works really well
       textSize(4);
       text(comprs[j][i],float(j),float(i));
     }
   }
   saveFrame("result.jpeg");
  
}

class Statue{
 PImage bw = loadImage("stress.jpg");
 
 int imgW = 500;
 int imgL = 375;
 String[][] pixls = new String[imgW][imgL];
 
 color c = bw.get(100,100);
 
 String[][] getColorsCompressed(){
   for(int i = 0; i < imgL; i++){
     for(int j = 0; j < imgW; j++){
       if( bw.get(j,i) < -15000000 && j % 5 == 0 && i % 10 == 0){
         pixls[j][i] = "#";
         //pixls[j][i] = "0";
       }
       else if( bw.get(j,i) < -12000000 && j % 5 == 0 && i % 10 == 0){
         pixls[j][i] = "%";
         //pixls[j][i] = "8";
       }
       else if( bw.get(j,i) < -10000000 && j % 5 == 0 && i % 10 == 0){
         pixls[j][i] = "$";
         //pixls[j][i] = "9";
       }
       else if( bw.get(j,i) < -7000000 && j % 5 == 0 && i % 10 == 0){
         pixls[j][i] = "+";
         //pixls[j][i] = "7";
       }
       else if( bw.get(j,i) < -5000000 && j % 5 == 0 && i % 10 == 0){
         pixls[j][i] = "-";
         //pixls[j][i] = "2";
       }
       else if( bw.get(j,i) < -1000000 && j % 5 == 0 && i % 10 == 0){
         pixls[j][i] = ".";
         //pixls[j][i] = "1";
       }
       else{
         pixls[j][i] = "";
       }
     }
   }
   return pixls;
 }
 
 
 String[][] getColors(){
   for(int i = 0; i < imgL; i++){
     for(int j = 0; j < imgW; j++){
       if( bw.get(j,i) < -15000000 || j % 5 == 0 && i % 10 == 0){
         pixls[j][i] = "#";
         //pixls[j][i] = "0";
       }
       else if( bw.get(j,i) < -12000000 || j % 5 == 0 && i % 10 == 0){
         pixls[j][i] = "%";
         //pixls[j][i] = "8";
       }
       else if( bw.get(j,i) < -10000000 || j % 5 == 0 && i % 10 == 0){
         pixls[j][i] = "$";
         //pixls[j][i] = "9";
       }
       else if( bw.get(j,i) < -7000000 || j % 5 == 0 && i % 10 == 0){
         pixls[j][i] = "+";
         //pixls[j][i] = "7";
       }
       else if( bw.get(j,i) < -5000000 || j % 5 == 0 && i % 10 == 0){
         pixls[j][i] = "-";
         //pixls[j][i] = "2";
       }
       else if( bw.get(j,i) < -1000000 || j % 5 == 0 && i % 10 == 0){
         pixls[j][i] = ".";
         //pixls[j][i] = "1";
       }
       else{
         pixls[j][i] = "";
       }
     }
   }
   return pixls;
 }
 
 int getImgL(){
 return imgL;
 }
 
 int getImgW(){
 return imgW;
 }

}
