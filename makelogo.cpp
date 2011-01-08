#include <iostream>
#include </home/morfic/NSDEV/logo/trinity2.h>
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
