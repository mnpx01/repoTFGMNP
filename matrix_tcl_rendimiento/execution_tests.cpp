#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <assert.h>
#include <unistd.h>
#include "test_functions.h"
#include "tests.h"
#include <map>
#include <iostream>

int main(){
	try{
		beforeTests();
		cout << "Ejecución de las pruebas:" << endl;
		TestFunctions tf(true,2,true);
		std::map<unsigned int, TPrueba> myMap;
		myMap[1] = test1;
		myMap[2] = test2;
		myMap[3] = test3;
		myMap[4] = test4;
		myMap[5] = test5;
		myMap[6] = test6;
		myMap[7] = test7;

                myMap[8] = test8;
                myMap[9] = test9;
                myMap[10] = test10;
                myMap[11] = test11;
                myMap[12] = test12;
                myMap[13] = test13;
                myMap[14] = test14;
                myMap[15] = test15;
                myMap[16] = test16;
                myMap[17] = test17;
                myMap[18] = test18;
                myMap[19] = test19;
                myMap[20] = test20;
                myMap[21] = test21;
                myMap[22] = test22;
                myMap[23] = test23;
                myMap[24] = test24;
		
		for(int i=1; i<=myMap.size(); i++){
			tf.test_case(myMap[i]);
			if(tf.has_failed()){
			//	cout << "Test fallado: " << i << endl;
			}
		}
		
		afterTests();
		cout << "Fin de las pruebas." << endl;
	} 
	catch(char *s){                 
		cout << "Excepción " << s << endl;
	}
	catch(...){
		cout << "Excepción en las pruebas" << endl;
	}
	return 0;
}
