#include <iostream>
/*
 * Below is the charge logo, saved in gimp as type "C source code header".
 * Change this to include your file's path.
 * Don't try to build it with my path.
*/
#include </home/nubecoder/android/projects/Samsung-logo/charge_logo_gimp.h>
using namespace std;

int main()
{
	int totalpixels = width * height;
	int breakcount = 1;
	// Begin charge_logo
	cout << "const unsigned long charging[] = {\n";
	for (int i = 0; i < totalpixels; i++)
	{
		unsigned char pixel[6] = "";
		HEADER_PIXEL(header_data, pixel);
		cout << "0x00";
		for (int j = 0; j < 3; j++)
		{
			if (pixel[j] < 16)
			{
				cout << "0";
			}
			cout << std::hex << (int)pixel[j];
		}
		if (breakcount == 10)
		{
			breakcount = 1;
			cout << ",\n";
		}
		else
		{
			breakcount++;
			cout << ",";
		}
	}
	cout << "};\n";
	// End charge_logo
	return 0;
}

