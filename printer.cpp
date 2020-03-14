#include <iostream>
#include <stdio.h>
#include <string>
using namespace std;

int main(int argc, char *argv[]) {

	//in0 is our 1, nw0 is our 0
	char* row0[] = {"in0", "nw0"};
	char* row1[] = {"in1", "nw1"};
	char* row2[] = {"in2", "nw2"};
	char* row3[] = {"in3", "nw3"};
	char* row4[] = {"in4", "nw4"};
	char* row5[] = {"in5", "nw5"};

	for (int i = 0; i <= 63; i++) {
		//if even,
		bool choose0 = i % 2;
		//bool choose1 = i % 6;
		char* rowO = row0[choose0];
		//char* rowI = row1[choose1];
		printf("	and #4 (out[%d], in#, in#, in#, in#, in#, %s);", i, rowO);
		cout << endl;

	}
	return 0;
}
