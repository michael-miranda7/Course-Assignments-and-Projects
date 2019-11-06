//Bash: g++ -o bayerAssignment.exe bayerAssignment.cpp -lX11 -pthread
//MinGW: g++ -o bayerAssignment.exe bayerAssignment.cpp -O2 -lgdi32
//Mac OS: g++ -o bayerAssignment.exe bayerAssignment.cpp -O2 -lm -lpthread -I/usr/X11R6/include -L/usr/X11R6/lib -lm -lpthread -lX11
//Linux: g++ -o bayerAssignment.exe bayerAssignment.cpp -O2 -L/usr/X11R6/lib -lm -lpthread -lX11

//REMINDER: cd directly to folder with code in it in terminal

#include <iostream>
#include "CImg.h"

using namespace cimg_library;
using namespace std;

int main() {
  CImg<unsigned char> orig("wasp.bmp");
  //Create empty image to fill in with colored Bayer Filter
  CImg<unsigned char> bayerFilter(orig.width(), orig.height(), 1, 3, 0);
  
  //Copy over green intensities (every other pixel)
  for (int i = 0; i < orig.width(); i++){
	  for(int j = i%2; j < orig.height(); j+=2){
		 //Copy over green channel intensity for this pixel 
		 bayerFilter(i,j,0,1) = orig(i,j,0,1); 
		 //red and blue are zero
		 bayerFilter(i,j,0,0) = 0.0;
		 bayerFilter(i,j,0,2) = 0.0;
	  }
  }
  
  //Copy over blue intensities (every other pixel of every other row)
  //Fill in here//
  
	for (int i = 1; i < orig.width(); i+=2){
	  for(int j = 0; j < orig.height(); j+=2){ 
		 bayerFilter(i,j,0,2) = orig(i,j,0,2); 
		 bayerFilter(i,j,0,0) = 0.0;
		 bayerFilter(i,j,0,1) = 0.0;
	  }
  }
  //Copy over red intensities (every other pixel of every other row)
  //Fill in here//  

  for (int i = 0; i < orig.width(); i+=2){
	  for(int j = 1; j < orig.height(); j+=2){
		 bayerFilter(i,j,0,0) = orig(i,j,0,0); 
		 bayerFilter(i,j,0,1) = 0.0;
		 bayerFilter(i,j,0,2) = 0.0;
	  }
  }
  //Display and save filtered image
  CImgDisplay disp(bayerFilter); 
  while (!disp.is_closed())
      disp.wait(); 
  
  bayerFilter.save("bayerFilter2.bmp");
  
  //Reconstruct image from filter
  //Fill in here//

  CImg<unsigned char> reconstructed(orig.width(), orig.height(),1,3,0);
  
  for (int i = 0; i < orig.width(); i+=2){
    for (int j = 0; j < orig.height(); j+=2){
        double r = bayerFilter(i,j+1,0,0);
        double g = (bayerFilter(i,j,0,1)+bayerFilter(i+1,j+1,0,1))/2;
        double b = bayerFilter(i+1,j,0,2);

        reconstructed(i,j,0,0) = r;
        reconstructed(i,j,0,1) = g;
        reconstructed(i,j,0,2) = b;

        reconstructed(i+1,j,0,0) = r;
        reconstructed(i+1,j,0,1) = g;
        reconstructed(i+1,j,0,2) = b;

        reconstructed(i,j+1,0,0) = r;
        reconstructed(i,j+1,0,1) = g;
        reconstructed(i,j+1,0,2) = b;

        reconstructed(i+1,j+1,0,0) = r;
        reconstructed(i+1,j+1,0,1) = g;
        reconstructed(i+1,j+1,0,2) = b;
    }
  }


  
  //Display and save reconstructed image  
  //Fill in here//
  CImgDisplay disp2(reconstructed);
  while (!disp2.is_closed())
  	disp2.wait();

  reconstructed.save("reconstructed2.bmp");
  
  return 0;
}
