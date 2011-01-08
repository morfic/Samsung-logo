#include <iostream>
#include </home/morfic/NSDEV/logo/trinity2.h> //this is the logo, saved in gimp as "C header" change this to include yours, don't try to build it with my path
using namespace std;

int main( )
{
	int totalpixels = 480 * 800;
	int breakcount=1;
	for( int i = 0; i < totalpixels; i++ )
        {
		unsigned char pixel[6]="";
                HEADER_PIXEL(header_data,pixel);
		
		cout << "0x00";
		for (int j = 0; j <3 ; j++)
		{
			if ( pixel[j] < 16)
		   		cout << "0";	
			cout << std::hex << (int)pixel[j];
		}
			if ( breakcount == 10) {	
					breakcount = 1;
					cout << ",\n";
			}
			else {
					breakcount++;
					cout << ",";
			}
	}
	return 0;
}
