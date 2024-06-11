CXX= g++ 
CXXFLAGS= -std=c++11 -fPIE

all: matrix.o tests.o execution_tests.o

matrix.o: matrix.cc matrix2.h
	$(CXX) $(CXXFLAGS) -c matrix.cc -DDEBUG

tests.o: tests.cpp tests.h matrix2.h test_functions.h
	$(CXX) $(CXXFLAGS) -c tests.cpp -DDEBUG

execution_tests.o: execution_tests.cpp test_functions.h tests.h matrix2.h matrix.cc
	$(CXX) $(CXXFLAGS) -c execution_tests.cpp -DDEBUG

TestLib.a: matrix.o tests.o execution_tests.o
	ar rcs $@ $^
	ranlib $@
    
test: tests.o matrix.o execution_tests.o 
	$(CXX) $(CXXFLAGS) -o $@ $^ TestLib.a

execute:
	./test > /dev/null 2>&1

clean:
	rm -f test *.o *~
