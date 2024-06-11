//////////////////////////////////////////////////////
// Matrix TCL Pro 2.12 Test Program
// Copyright (c) 2000-2003 Techsoft Pvt. Ltd. All Rights Reserved.
// Web: http://www.techsoftpl.com/matrix/
// Email: matrix@techsoftpl.com
//
#include <cstdio>
#include <cstdlib>
#include <iostream>
#include <fstream>
#include <iomanip>
#include "tests.h"
#include <sstream>

#if defined(__BORLANDC__)
#pragma option -w-aus
#endif

//
// Using declarations. 
//
using std::cout;
using std::endl;
using techsoft::epsilon;
using techsoft::isVecEq;
using std::exception;

#ifdef _MSC_VER
using ::rand;
#else
using std::rand;
using std::size_t;
#endif


//
// typedef for different matrix types
//
typedef techsoft::matrix<float>        fMatrix;
typedef std::valarray<float>           fVector;

typedef techsoft::matrix<double>       dMatrix;
typedef std::valarray<double>          dVector;

typedef techsoft::matrix<long double>  ldMatrix;
typedef std::valarray<long double>     ldVector;

typedef std::complex<float>            fComplex;
typedef techsoft::matrix<fComplex>     cfMatrix;
typedef std::valarray<fComplex>        cfVector;

typedef std::complex<double>           dComplex;
typedef techsoft::matrix<dComplex>     cdMatrix;
typedef std::valarray<dComplex>        cdVector;

typedef std::complex<long double>      ldComplex;
typedef techsoft::matrix<ldComplex>    cldMatrix;
typedef std::valarray<ldComplex>       cldVector;

const char *TestFile = "test.txt";

template <class T> T 
mfn (size_t i, size_t j, const T& v)
{
   int k = int(i+j);
   return pow( v, k);
}

void beforeTests(){
}

void afterTests(){
	std::remove(TestFile);
}

void test1 ()    
{
   std::srand( 0x23657876);
   try
   {
      cout << "Testing constructors.....";
      dMatrix m(3,3);
      dMatrix m2(3,3,1.0);

      m = 1.0;
      if (m != m2)
      {
         cout << "failed!\n";
	 check_test_case(0);
      }

      float fv[] = { 1.34f, 2.54f, 8.23f, 
                     7.34f, -2.3f, 2.45f,
                     -1.2f, 4.50f, 7.34f };

      fMatrix mf( 3, 3, fv);
      fMatrix mf2( 3, 3, fv, techsoft::FORTRAN_ARRAY);
      fMatrix mf3 = mf;
      fVector vf( fv,9);
      fMatrix mf4( 3,3,vf);

      if (mf != ~mf2 || mf != mf3 || mf != mf4)
      {
         cout << "failed!\n";
	 check_test_case(0);
      }

      dMatrix ma[5];
      for (size_t i=0; i < 5; i++)
      {
         ma[i].resize( 3, 3);
         if (!ma[i].isNull())
         {
            cout << "failed!\n";
            check_test_case(0);
	 }
      }

      cfMatrix cm(4,4);
      cm.rand();
      cfMatrix cm2 = cm;

#ifndef _TS_NO_MEMBER_TEMPLATES
      dMatrix md = mf;
      cdMatrix mcd = md;
      mcd = 1.0;
      mcd = cm;
#endif
   }
   catch (const exception& e)
   {
      cout << "failed!\nError: " << e.what() << endl;
      check_test_case(0);
   }
   cout << "Ok\n";
}

void test2 ()
{
   using techsoft::abs;

    std::srand( 0x23657876);
   try
   {
      cout << "Testing subscript/submatrix.....";

      dMatrix m(3,3);
      m.rand();
      const dMatrix m2 = m;
      double x,y;
      size_t i=0,j=0;

      x = m2[i][j];
      m[i][j] = x;
      y = m[i][j];
      if (abs(x-y) > epsilon(x))
      {
         cout << "failed!\n";
         check_test_case(0);
      }
      x = m(i,j)++;
      y = ++m(i,j);
      if (abs(y-x-2.0) > epsilon(y))
      {
         cout << "failed!\n";
      	 check_test_case(0);
      }
      x = m(i,j)--;
      y = --m(i,j);
      if (abs(x-y-2.0) > epsilon(x))
      {
         cout << "failed!\n";
         check_test_case(0);
      }
      x = m[i][j]  * m[i+1][j+1];
      x = m2[i][j] / m2[i+1][j+1];
      x = m[i][j]  + m2[i+1][j+1];
      x = m2[i][j] - m[i+1][j+1];

      y = x * m[i][j];
      y = m[i][j] * x;
      y = x / m[i][j];
      y = m[i][j] / x;
      y = x + m[i][j];
      y = m[i][j] + x;
      y = x - m[i][j];
      y = m[i][j] - x;

#if defined(_MSC_VER) && _MSC_VER > 1100     // MS VC++ 5.0 is generating wrong code!!!
      x = m[i][j];
      m[i][j] += m[i+1][j+1];
      m[i][j] -= m[i+1][j+1];
      m[i][j] *= m[i+1][j+1];
      m[i][j] /= m[i+1][j+1];
      y = m[i][j];
      if (abs(y-x) > epsilon(y))
      {
         cout << "failed!\n";
         check_test_case(0);
      }
#endif

      x = -m[i][j];
      y = +m[i][j];
      if (abs(y+x) > epsilon(x+y))
      {
         cout << "failed!\n";
         check_test_case(0);
      }
   }
   catch (const exception& e)
   {
      cout << "failed!\nError: " << e.what() << endl;
      check_test_case(0);
   }
   cout << "Ok\n";
}

void test8 ()
{
   using techsoft::mslice;
   using techsoft::gmslice;
   using techsoft::DIAGONAL;
   using techsoft::TRIDIAGONAL;
   using techsoft::UTRIANG;
   using techsoft::LTRIANG;

   std::srand( 0x23657876);
   try
   {
      cout << "Testing mslice/gmslice.....";
      dMatrix a(6,6);
      a.rand();
      const dMatrix b = a;

      dMatrix sa = b[mslice(1,1,3,3)];
      a[mslice(1,1,3,3)] = sa;
      if (a != b)
      {
         cout << "failed!\n";
         check_test_case(0);
      }

      a[mslice(2,2,1,3)] = b[mslice(2,2,1,3)];
      if (a != b)
      {
         cout << "failed!\n";
         check_test_case(0);
      }

      a[mslice(1,0,2,3)] *= 10.0;
      a[mslice(1,0,2,3)] /= 10.0;
      if (a != b)
      {
         cout << "failed!\n";
         check_test_case(0);
      }

      a[mslice(1,0,2,3)] += b[mslice(1,0,2,3)];
      a[mslice(1,0,2,3)] -= b[mslice(1,0,2,3)];
      if (a != b)
      {
         cout << "failed!\n";
         check_test_case(0);
      }

      a[mslice(0,0,6,6)] = 1.0;
      dMatrix c(6,6,1.0);
      if (a != c)
      {
         cout << "failed!\n";
         check_test_case(0);
      }

      a.resize(4,4);
      a.rand();
      c = a[mslice(1,1,2,2)];
      c = a[gmslice(DIAGONAL)];
      c = a[gmslice(TRIDIAGONAL)];
      c = a[gmslice(UTRIANG)];
      c = a[gmslice(LTRIANG)];

      c = 1.0;
      c[gmslice(DIAGONAL)] += a;   
      c[gmslice(TRIDIAGONAL)] -= a;      
      c[gmslice(UTRIANG)] *= 12.0;
      c[gmslice(LTRIANG)] /= 12.0;

      dMatrix cm = a[gmslice(UTRIANG)];
      const dMatrix ca = a;
      cm = ca[gmslice(UTRIANG)];

      //MODIFIED
      //--------------------
      size_t n = 6, r = 7;
      std::valarray<size_t> indx(n);
      std::valarray<size_t> rndx(r);
      gmslice gm_ut(n,indx,rndx);

      a.resize(6,6);
      a.rand();
      dMatrix matriz = a[gm_ut];

      if (matriz.colsize() != 6 || matriz.rowno() != 6)
      {
         cout << "failed!\n";
         check_test_case(0);
      }

      if (matriz.rowsize() != 6 || matriz.colno() != 6)
      {
         cout << "failed!\n";
         check_test_case(0);
      }    
      //---------------------  
   }
   catch (const exception& e)
   {
      cout << "failed!\nError: " << e.what() << endl;
      check_test_case(0);
   }
   cout << "Ok\n";
}

void test9 ()
{
   using techsoft::mswap;

   std::srand( 0x23657876);
   try
   {
       cout << "Testing mswap.....";
      dMatrix d(4,4), d2(4,4);
      d.rand();
      d2.rand();
      mswap( d[0][0], d[1][1]);
      mswap( d[2], d[3]);
      mswap( d(1), d(2));
      
      mswap( d[0][0], d2[0][0]);
      mswap( d[2], d2[2]);
      mswap( d(1), d2(1));
      mswap( d, d2);      
   }
   catch (const exception& e)
   {
      cout << "failed!\nError: " << e.what() << endl;
      check_test_case(0);
   }
   cout << "Ok\n";
}

void test10 ()
{
   std::srand( 0x23657876);
   try
   {
      cout << "Testing dVector.....";
      dMatrix a(6,6);
      a.rand();
      const dMatrix b = a;
      
      dVector v = b[5];
      a[5] = v;
      v = a(3);
      a(3) = v;
      a[2] += v;
      a[2] -= v;
      a[4] *= v;
      a[4] /= v;
      if (a != b)
      {
         cout << "failed!\n";
         check_test_case(0);
      }

      v = b.diag();
      a.diag() = v;

      dVector v2 = b.diag(-2);
      a.diag(-2) = v2;
      v2 = b.diag(2);
      a.diag(2) = v2;
      if (a != b)
      {
         cout << "failed!\n";
         check_test_case(0);
      }
   }
   catch (const exception& e)
   {
      cout << "failed!\nError: " << e.what() << endl;
      check_test_case(0);
   }
   cout << "Ok\n";
}

void test3 ()
{
    std::srand( 0x23657876);

   try
   {
      cout << "Testing operators.....";
      dMatrix m(6,4);

      m.rand();
      dMatrix m2 = m;
      m2 += m;
      m2 -= m;
      if (m2 != m)
      {
         cout << "failed!\n";
         check_test_case(0);
      }
      double te(1.234567f);
      m2 *= te;
      m2 /= te;
      if (m2 != m)
      {
         cout << "failed!\n";
         check_test_case(0);
      }

      dMatrix a(4,4);
      a.rand();
      dMatrix b = !a;
      a *= b;
      if (!a.isUnit())
      {
         cout << "failed!\n";
         check_test_case(0);
      }
      
      a.rand();
      a /= a;
      if (!a.isUnit())
      {
         cout << "failed!\n";
         check_test_case(0);
      }
   }
   catch (const exception& e)
   {
      cout << "failed!\nError: " << e.what() << endl;
      check_test_case(0);
   }
   cout << "Ok\n";
}

void test11 ()
{
    std::srand( 0x23657876);

   try
   {
      cout << "Testing operators2.....";
      dMatrix a(5,3);
      a.rand();
      dMatrix b = ~a;
      dMatrix c = a * b;
      b = ~b;
      if (a != b)
      {
         cout << "failed!\n";
         check_test_case(0);
      }
      c = a + b;
      b = c - a;
      if (a != b)
      {
         cout << "failed!\n";
         check_test_case(0);
      }

      a.resize(4,4);
      a.rand();
      b = !a;
      c = a * b;
      if (!c.isUnit())
      {
         cout << "failed!\n";
         check_test_case(0);
      }

      double x = 2.045f;
      c = 1/x * a * x;
      if (a != c)
      {
         cout << "failed!\n";
         check_test_case(0);
      }

      c = x * a / x;
      if (a != c)
      {
         cout << "failed!\n";
         check_test_case(0);
      }

      c = x / a;
      b = x * !a;
      if (b != c)
      {
         cout << "failed!\n";
         check_test_case(0);
      }
   }
   catch (const exception& e)
   {
      cout << "failed!\nError: " << e.what() << endl;
      check_test_case(0);
   }
   cout << "Ok\n";
}

void test12 ()
{
    std::srand( 0x23657876);

   try
   {
      cout << "Testing operators with vector.....";
      dMatrix a(4,4);
      a.rand();
      double x = 2.045f;
      dMatrix b = x * !a;

      dVector v(4), v2(4);
      v = b[0];
      a.unit();
      v2 = v * a;
      v = a * v2;
      if (!isVecEq( v, v2))
      {
         cout << "failed!\n";
         check_test_case(0); 
      }
      v2 = v / a;
      v = a / v;
   }
   catch (const exception& e)
   {
      cout << "failed!\nError: " << e.what() << endl;
      check_test_case(0);
   }
   cout << "Ok\n";
}

void test4 ()    // Test utility methods
{
   using techsoft::pow;

   std::srand( 0x23657876);

   try
   {
      cout << "Testing utility methods.....";
      dMatrix m(6,4);

      m.rand();
      dMatrix m2 = m;
      m.unit();
      m.resize( 2, 3);
      m.unit();
      m.resize( 4, 6);
      m.unit();
      m.free();

      m.resize( 4, 4);
      m.rand();
      m2 = m * m * m * m * m * m * m;
      if (m2 != pow( m, 7))
      {
         cout << "failed!\n";
         check_test_case(0);
      }
   }
   catch (const exception& e)
   {
      cout << "failed!\nError: " << e.what() << endl;
      check_test_case(0);
   }
   cout << "Ok\n";

}

void test13()
{
   using techsoft::abs;
   using techsoft::floor;
   using techsoft::ceil;

   std::srand( 0x23657876);

   try
   {
      cout << "Testing floor/ceil.....";
      dMatrix m(4, 4);
      m.rand();
      dMatrix m2 = -m;

      m2 = abs( m2);

      m2 = floor( m2);
      if (!m2.isNull() || m2.trace() != 0.0)
      {
         cout << "failed!\n";
         check_test_case(0);
      }
      m2 = ceil( m);
      if (m2.isNull() || m2.trace() != 1)
      {
         cout << "failed!\n";
         check_test_case(0);
      }
   }
   catch (const exception& e)
   {
      cout << "failed!\nError: " << e.what() << endl;
      check_test_case(0);
   }
   cout << "Ok\n"; 
}

void test14()
{
   std::srand( 0x23657876);

   try
   {
       cout << "Testing norm/rank/det/cond/cofact/adj/rank.....";
      double val;
      size_t rn;

      dMatrix m(4, 4);
      m.rand();
      val = m.norm1();
      val = m.norm2();
      val = m.normI();
      val = m.normF();
      val = m.cond();
      val = m.det();
      rn = m.rank();
      val = m.cofact(0,0);

      dMatrix m2 = m.adj()/m.det();
      if (m2 != !m)
      {
         cout << "failed!\n";
         check_test_case(0); 
      }
   }
   catch (const exception& e)
   {
      cout << "failed!\nError: " << e.what() << endl;
      check_test_case(0);
   }
   cout << "Ok\n"; 
}


void test15()
{
   std::srand( 0x23657876);

   try
   {
      cout << "Testing inv.....";
      dMatrix m(4, 4);
      m.rand();
      dMatrix m2 = m;
      m2.inv_lu();
      if (m2 != !m)
      {
         cout << "failed!\n";
         check_test_case(0);
      }

      m2 = m;
      m2.inv_sv();
      if (m2 != !m)
      {
         cout << "failed!\n";
         check_test_case(0);
      }

      m2 = m;
      m2.inv_qr();
      if (m2 != !m)
      {
         cout << "failed!\n";
         check_test_case(0);
      }

      cdMatrix cm(4,4), cm2(4,4);
      cm.rand();
      cm2 = cm;
      cm2.inv_sv();
      if (cm2 != !cm)
      {
         cout << "failed!\n";
         check_test_case(0);
      }
   }
   catch (const exception& e)
   {
      cout << "failed!\nError: " << e.what() << endl;
      check_test_case(0);
   }
   cout << "Ok\n"; 
}

void test16()
{
   std::srand( 0x23657876);

   try
   {
      cout << "Testing booleans.....";
      dMatrix m(4,4);
      m.rand();
      bool bt = m.isSingular();
      if (bt)
      {
         cout << "failed!\n";
         check_test_case(0);
      }
      m = double(0);
      bt = m.isNull();
      if (!bt)
      {
         cout << "failed!\n";
         check_test_case(0);
      }
      m.diag() = 1.0;
      bt = m.isUnit();
      if (!bt)
      {
         cout << "failed!\n";
         check_test_case(0);
      }
      m.diag() = 3.0;
      bt = m.isScalar();
      if (!bt)
      {
         cout << "failed!\n";
         check_test_case(0);
      }
      m.diag()[0] = 7.0;
      bt = m.isDiagonal();
      if (!bt)
      {
         cout << "failed!\n";
         check_test_case(0);
      }
   }
   catch (const exception& e)
   {
      cout << "failed!\nError: " << e.what() << endl;
      check_test_case(0);
   }
   cout << "Ok\n"; 
}

void test17()
{
   using techsoft::gmslice;
   using techsoft::UTRIANG;
   using techsoft::LTRIANG;

   std::srand( 0x23657876);

   try
   {
      cout << "Testing triangular.....";
      dMatrix m(4,4);
      m.rand();
      dMatrix m2 = m[gmslice(UTRIANG)];
      if (!m2.isUpperTriangular())
      {
         cout << "failed!\n";
         check_test_case(0);
      }
      m2 = m[gmslice(LTRIANG)];
      if (!m2.isLowerTriangular())
      {
         cout << "failed!\n";
         check_test_case(0);
      }

      dMatrix m3 = ~m2;
      m2[gmslice(UTRIANG)] = m3;
      if (!m2.isSymmetric())
      {
         cout << "failed!\n";
         check_test_case(0);
      }
      m2[gmslice(UTRIANG)] = -m3;
      if (!m2.isSkewSymmetric())
      {
         cout << "failed!\n";
         check_test_case(0);
      }
#if defined(_MSC_VER) && _MSC_VER > 1100
      m2 = m.apply( log);
      m2 = m.apply( mfn);
#endif
   }
   catch (const exception& e)
   {
      cout << "failed!\nError: " << e.what() << endl;
      check_test_case(0);
   }
   cout << "Ok\n"; 
}

void test5 ()    
{
   using techsoft::gmslice;
   using techsoft::LTRIANG;

 std::srand( 0x23657876);

   try
   {
      cout << "Testing matrix decomposition.....";
      size_t i, n = 4;
      dMatrix a(n,n);
      dVector v(n),s(n),v2(n), w(n);
      std::valarray<size_t> indx(n);

      a.rand();
      dMatrix b = a;
      v = a[0];
      v *= double(1.2394f);

      b.lud( indx);
      b.lubksb( indx, v, s);
      v2 = a * s;
      if (!isVecEq( v, v2))
      {
         cout << "failed!\n";
         check_test_case(0);
      }

      a.lumpove( b, indx, v, s);
      v2 = a * s;
      if (!isVecEq( v, v2))
      {
         cout << "failed!\n";
         check_test_case(0);
      }

      v /= double(-1.7913f);
      b.lubksb( indx, v, s);
      v2 = a * s;
      if (!isVecEq( v, v2))
      {
         cout << "failed!\n";
         check_test_case(0);
      }

      dMatrix mv(n,3), ms(n,3), mv2(n,3);
      mv.rand();
      a.solve( mv, ms);
      for (i=0; i < 3; i++)
      {
         dVector vx = ms(i);
         mv2(i) = a * vx;
      }
      if (mv != mv2)
      {
         cout << "failed!\n";
         check_test_case(0);
      }

      //MODIFIED
      //-----------------------------
      std::valarray<double> indx2(n);
      for(i=0; i < indx2.size(); i++)
      	indx2[i] = 1;

      a.solve(indx2, indx2);
      double res = 1.43792;
      std::ostringstream os;
      os << indx2[0];
      std::ostringstream os1;
      os1 << res;
      
      if(os.str() != os1.str()){
      	cout << "failed!\n";
      	check_test_case(0);
      }
      //-----------------------------

      b = a[gmslice(LTRIANG)];
      b *= ~b;
      a = b;
      b.chold();
      b.cholbksb( v, s);
      v2 = a * s;
      if (a != (b * ~b) || !isVecEq( v, v2))
      {
         cout << "failed!\n";
         check_test_case(0);
      }

      a.solve_chol( v, s);
      v2 = a * s;
      if (!isVecEq( v, v2))
      {
         cout << "failed!\n";
         check_test_case(0);
      }

      a.rand();
      b = a;
      dMatrix c(n,n);
      b.qrd( c);
      b.qrbksb( c, v, s);
      v2 = a * s;
      if (!b.isRowOrthogonal() || a != (b * c) || !isVecEq( v, v2))
      {
         cout << "failed!\n";
         check_test_case(0);
      }

      a.solve_qr( v, s);
      v2 = a * s;
      if (!isVecEq( v, v2))
      {
         cout << "failed!\n";
         check_test_case(0);
      }

      b = a;
      b.svd( c, w);
      b.svbksb( c, w, v, s);
      v2 = a * s;
      dMatrix d(n,n,0.0);
      d.diag() = w;
      if (!b.isColOrthogonal() || !c.isRowOrthogonal()
          || a != (b * d * ~c) || !isVecEq( v, v2))
      {
         cout << "failed!\n";
         check_test_case(0);
      }

      a.solve_sv( v, s);
      v2 = a * s;
      if (!isVecEq( v, v2))
      {
         cout << "failed!\n";
         check_test_case(0);
      }

      a.resize( n+2,n);
      a.rand();
      b = a;
      b.qrd( c);
      v.resize( n+2);
      for (i=0; i < n+2; i++)
         v[i] = ((double)rand())/RAND_MAX;
      b.qrbksb( c, v, s);
      v2 = a * s;
      if (a != b * c)
      {
         cout << "failed!\n";
         check_test_case(0);
      }

      b = a;
      b.svd( c, w);
      b.svbksb( c, w, v, s);
      d.diag() = w;

      if (a != (b * d * ~c)
          || !b.isColOrthogonal() || !c.isRowOrthogonal())
      {
         cout << "failed!\n";
         check_test_case(0);
      }

      cdMatrix ca(n,n);
      cdVector cv(n),cs(n),cv2(n);

      ca.rand();
      for (i=0; i < n; i++)
      {
         double ta = ((double)rand())/RAND_MAX;
         double tb = ((double)rand())/RAND_MAX;
         dComplex z(ta,tb);
         cv[i] = z;
      }

      cdMatrix cb = ca;
      cdMatrix cd = !ca;
      cs = cd * cv;
      cv2 = ca * cs;
      if (!isVecEq( cv, cv2))
      {
         cout << "failed!\n";
         check_test_case(0);
      }

      cb.lud( indx);
      cb.lubksb( indx, cv, cs);
      cv2 = ca * cs;
      if (!isVecEq( cv, cv2))
      {
         cout << "failed!\n";
         check_test_case(0);
      }
   }
   catch (const exception& e)
   {
      cout << "failed!\nError: " << e.what() << endl;
      check_test_case(0);
   }
   cout << "Ok\n";
}

void test6 ()
{
   using techsoft::gmslice;
   using techsoft::UTRIANG;
   using techsoft::LTRIANG;

   try
   {

      cout << "Testing eigen value.....";

      size_t n = 4;
      dMatrix a(n,n), ev(n,n);
      dVector d(n), e(n);
      bool ret,ret2;

      a.rand();
      a = a[gmslice(UTRIANG)];
      a[gmslice(LTRIANG)] = ~a;

      ret = a.eigen( e);
      ret2 = a.eigen( d, ev);

      if (!ret || !ret2 || !isVecEq( d, e))
      {
         cout << "failed!\n";
         check_test_case(0);
      }

      //MODIFIED
      // ---------------
      ev.rand();
      //std::cout << "Antes de : " << ev;
      ret = a.eigen( e);
      ret2 = a.eigen( d, ev);
      //std::cout << "Despues de : " << ev;

      double res = -0.764271;
      std::ostringstream os;
      os << ev(0,0);
      std::ostringstream os1;
      os1 << res;
      if(os.str() != os1.str()){
         cout << "failed!\n";
         check_test_case(0);
      }
      // ---------------
      
      dMatrix c(n,n,0.0);
      c.diag() = d;
      if ((a * ev) != (ev * c))
      {
         cout << "failed!\n";
         check_test_case(0);
      }

      a.rand();
      ret = a.eigen( d, e);
      ret2 = a.eigen( d, e, ev);
      if (!ret || !ret2)
      {
         cout << "failed!\n";
         check_test_case(0);
      }

      for (size_t i=0; i < n; i++)
      {
         c(i,i) = d[i];
         if (e[i] > double(0) && i < n-1)
            c(i,i+1) = e[i];
         else if (e[i] < double(0) && i > 0)
            c(i,i-1) = e[i];
      }
      if ((a * ev) != (ev * c))
      {
         cout << "failed!\n";
         check_test_case(0);
      }
   }
   catch (const exception& e)
   {
      cout << "failed!\nError: " << e.what() << endl;
      check_test_case(0);
   }
   cout << "Ok\n";
}

void test7 ()
{
   using techsoft::abs;
   #if !defined(_MSC_VER)
   using std::FILE;
   using std::fopen;
   using std::fclose;
   using std::fread;
   using std::fwrite;
   #endif

    std::srand( 0x23657876);

   size_t i,m=4,n=3;
   dMatrix a(m,n), b(m,n);
   dVector v(m), v2(m);
   double tmp;
   cout << "Testing matrix I/O.....";
   a.rand();

   std::ofstream outFile( TestFile);
   if (!outFile)
   {
      std::cerr << "\nError opefing test file.";
      check_test_case(0);
   }
   outFile.clear();

   std::ifstream inFile( TestFile);
   if (!inFile)
   {
	   std::cerr << "\nError opefing test file.";
	   check_test_case(0);
   }
   inFile.tie( &outFile);
   outFile << std::scientific << std::setprecision( 18);

   outFile << a[0][0] << endl;
   inFile >> b[0][0];
   tmp = a[0][0] - b[0][0];
   if (abs( tmp) > epsilon(tmp))
   {
      cout << "failed!\n"; //<< a[0][0] << endl << b[0][0] ;
      check_test_case(0);
   }

   const dMatrix c = a;
   outFile << c(1,1) << endl;
   inFile >> b(1,1);
   tmp = c(1,1) - b(1,1);
   if (abs( tmp) > epsilon( tmp))
   {
      cout << "failed!\n";
      check_test_case(0);
   }

   v = a(0);
   outFile << a(0) << endl;
   inFile >> a(0);
   v2 = a(0);
   a(0) = v;

   if (!isVecEq( v, v2))
   {
      cout << "failed!\n";
      check_test_case(0);
   }

   outFile << a[1] << endl;
   inFile >> b[1];
   for (i=0; i < n; i++)
   {
      tmp = a[1][i] - b[1][i];
      if (abs( tmp) > epsilon(tmp))
      {
         cout << "failed!\n";
         check_test_case(0);
      }
   }

   outFile << c[1] << endl;
   inFile >> b[1];
   for (i=0; i < n; i++)
   {
      tmp = c[1][i] - b[1][i];
      if (abs( tmp) > epsilon(tmp))
      {
         cout << "failed!\n";
         check_test_case(0);
      }
   }

   outFile << a << endl;
   inFile >> b;
   if (a != b)
   {
      cout << "failed!\n";
      check_test_case(0);
   }
   outFile.close();
   inFile.close();

   FILE *fp = fopen( TestFile, "w+b");
   if (fp == NULL)
   {
      std::cerr << "\nError opefing test file.";
      check_test_case(0);
   }
   
   a.rand();
   fwrite( &a[0][0], a.size(), a.typesize(), fp);
   rewind( fp);
   fread( &b[0][0], b.size(), b.typesize(), fp);
   fclose( fp);
   if (a != b)
   {
      cout << "failed!\n";
      check_test_case(0);
   }
	cout << "Ok\n";
}

void test18(){
   //NEW
   using techsoft::mslice;
   using techsoft::gmslice;
   using techsoft::LTRIANG;

   std::srand( 0x23657876);

   try
   {
     cout << "Testing construction mslice/gmslice.....";
     gmslice gms(LTRIANG);
     gmslice gms2(gms);
     if(gms2.getype() != LTRIANG)
     {
         cout << "failed!\n";
         check_test_case(0);
     }

     size_t n = 4;
     std::valarray<size_t> indx(n);
     gmslice gms3(4,indx,indx);

     if(gms3.colno() != n){
         cout << "failed!\n";
         check_test_case(0);
     }

    // std::cout << gms3.end(3) << std::endl;
     if(gms3.end(3) != 0){
         cout << "failed!\n";
         check_test_case(0);
     }

     if(gms3.rowno() != n){
         cout << "failed!\n";
         check_test_case(0);
     }

     n = 6;
     size_t r = 7;
     std::valarray<size_t> indx2(n);
     std::valarray<size_t> rndx(r);
     gmslice gm_ut(n,indx2,rndx);

     if (gm_ut.colsize() != 6 || gm_ut.rowno() != 6)
     {
         cout << "failed!\n";
         check_test_case(0);
     }
     if (gm_ut.rowsize() != 6 || gm_ut.colno() != 6)
     {
        cout << "failed!\n";
        check_test_case(0);
     }
   }
   catch (const exception& e)
   {
      cout << "failed!\nError: " << e.what() << endl;
      check_test_case(0);
   }
   cout << "Ok\n";
}

typedef techsoft::Mref<double>       dMref;

void test19(){
   //NEW
   std::srand( 0x23657876);

   try
   {
     cout << "Testing construction Mref.....";
     dMatrix m(3,3);
     m.rand();
     dMref mr1(m,3);

     double res = mr1++;
     std::ostringstream os;
     os << res;
     //cout << os.str() << endl;
     double res1 = -0.845487;
     std::ostringstream os2;
     os2 << res1;
     if(os.str() != os2.str()){
         cout << "failed!\n";
         check_test_case(0);
     }

     dMref mr2(mr1);
     res = mr2++;
     double res2 = 0.154513;
     os << res;
     os2 << res2;
     if(os.str() != os2.str()){
         cout << "failed!\n";
         check_test_case(0);
     }
   }
   catch (const exception& e)
   {
      cout << "failed!\nError: " << e.what() << endl;
      check_test_case(0);
   }
   cout << "Ok\n";
}

template <class T>
T mmm (T a) {
        return a*2;
}

template <class T>
T mmmc (const T& a) {
        return a*2;
}

template <class T> T
mfn2 (size_t i, size_t j, T v)
{
   int k = int(i+j);
   return pow( v, k);
}

void test20(){
   //NEW
   std::srand( 0x23657876);

   try
   {
     cout << "Testing matrix apply.....";

     double testing = 3;
     dMatrix m(1,1);
     m = testing;

     dMatrix m3 = m.apply(mmm);
     //std::cout << m3(0,0);
     if(m3(0,0) != 6)
     {
         cout << "failed!\n";
         check_test_case(0);
     }

     dMatrix m1 = m.apply(mmmc);
     //std::cout << m1(0,0);
     if(m1(0,0) != 6)
     {
         cout << "failed!\n";
         check_test_case(0);
     }

     m.resize(4,4);
     m.rand();

     dMatrix m2 = m.apply(mfn);
     std::ostringstream os;
     os << m2(1,1);
     double res = 0.1300910;
     std::ostringstream os1;
     os1 << res;
     if(os.str() != os1.str())
     {
        cout << "failed!\n";
        check_test_case(0);
     }

     dMatrix m4 = m.apply(mfn2);
     std::ostringstream os2;
     os2 << m4(1,1);
     //std::cout << "m4 - " << m4(1,1);
     std::ostringstream os3;
     os3 << res;
     if(os2.str() != os3.str())
     {
         cout << "failed!\n";
         check_test_case(0);
     }
   }
   catch (const exception& e)
   {
      cout << "failed!\nError: " << e.what() << endl;
      check_test_case(0);
   }
}

typedef techsoft::Cmat_iter<double>       dCmat_iter;
typedef techsoft::Mat_iter<double>       dMat_iter;

void test21(){
   //NEW
   using techsoft::GENERAL;
   using techsoft::gmslice;
   std::srand( 0x23657876);

   try
   {
        cout << "Testing construction Cmat_iter/Mat_iter.....";
        dMatrix m(4,4);
        m.rand();

        dCmat_iter ci(m, slice(1,2,3));
        //      std::cout << ci.size();
        if(ci.size() != 2)
        {
         cout << "failed!\n";
         check_test_case(0);
        }

        std::ostringstream os;
        os << ci[1];
        double res = 0.483263;
        std::ostringstream os1;
        os1 << res;
        if(os.str() != os1.str())
        {
          cout << "failed!\n";
          check_test_case(0);
        }

        dCmat_iter ci2(ci);
        if(ci2.size() != 2)
        {
         cout << "failed!\n";
         check_test_case(0);
        }

        std::ostringstream os2;
        os2 << ci2[1];
        if(os2.str() != os1.str())
        {
          cout << "failed!\n";
          check_test_case(0);
        }

        dMat_iter mi(m, slice(1,2,3));
        //      std::cout << ci.size();
        if(mi.size() != 2)
        {
         cout << "failed!\n";
         check_test_case(0);
        }

        std::ostringstream os3;
        os3 << mi[1];
        if(os3.str() != os1.str())
        {
          cout << "failed!\n";
          check_test_case(0);
        }

        dMat_iter mi2(mi);
        if(mi2.size() != 2)
        {
         cout << "failed!\n";
         check_test_case(0);
        }

        std::ostringstream os4;
        os4 << mi2[1];
        if(os4.str() != os1.str())
        {
          cout << "failed!\n";
          check_test_case(0);
        }
   }
   catch (const exception& e)
   {
      cout << "failed!\nError: " << e.what() << endl;
      check_test_case(0);
   }
   cout << "Ok\n";
}

typedef techsoft::gmslice_matrix<double>       dGmslice_matrix;

void test22(){
   std::srand( 0x23657876);
   using techsoft::gmslice;
   using techsoft::LTRIANG;
   try
   {
     cout << "Testing matrix operator= gmslice_matrix.....";
     dMatrix m(3,3);
     m.rand();
     double a = 3;
     gmslice gms(LTRIANG);
     dGmslice_matrix s(m,gms);
     s = a;

     dMatrix maux = s.get_ref_mat();
     //std::cout << maux(1,1);    
     double res = 0.483263;
     std::ostringstream os;
     os << maux(1,1);
     std::ostringstream os1;
     os1 << res;
     if(os.str() != os1.str()){
         cout << "failed!\n";
         check_test_case(0);
     }
   }
   catch (const exception& e)
   {
      cout << "failed!\nError: " << e.what() << endl;
      check_test_case(0);
   }
   cout << "Ok\n";
}

typedef techsoft::mslice_matrix<double>       dMslice_matrix;

void test23(){
   std::srand( 0x23657876);
   using techsoft::gmslice;
   using techsoft::mslice;
   using techsoft::LTRIANG;
   try
   {
     cout << "Testing matrix(mslice_matrix)";
     dMatrix m(3,3);
     m.rand();

     dMslice_matrix m_slice(m, mslice(1,1,3,3));
     dMatrix m2(m_slice);
     //std::cout << m2(1,1);

     double res = -0.557739;
     std::ostringstream os;
     os << m2(1,1);
     std::ostringstream os1;
     os1 << res;
     if(os.str() != os1.str()){
         cout << "failed!\n";
         check_test_case(0);
     }
   }
   catch (const exception& e)
   {
      cout << "failed!\nError: " << e.what() << endl;
      check_test_case(0);
   }
   cout << "Ok\n";
}

void test24(){

   std::srand( 0x23657876);
   using techsoft::gmslice;
   using techsoft::mslice;
   using techsoft::LTRIANG;
   try
   {
	cout << "Testing copy constructor gmslice_matrix/mslice_matrix";

	//gmslice_matrix
	dMatrix m(3,3);
     	m.rand();
     	gmslice gms(LTRIANG);
     	dGmslice_matrix s(m,gms);

     	dGmslice_matrix s2(s);
	dMatrix maux1 = s.get_ref_mat();
     	dMatrix maux2 = s2.get_ref_mat();
     	if(maux1 != maux2){
        	cout << "failed!\n";
        	check_test_case(0);
     	}

	//mslice_matrix
	dMslice_matrix m_slice(m, mslice(1,1,3,3));
	dMslice_matrix m_slice2(m_slice);
       	dMatrix maux3 = m_slice.get_ref_mat();   	
	dMatrix maux4 = m_slice2.get_ref_mat();

  	if(maux3 != maux4){
        	cout << "failed!\n";
        	check_test_case(0);
     	}
   }
   catch (const exception& e)
   {
      cout << "failed!\nError: " << e.what() << endl;
      check_test_case(0);
   }
   cout << "Ok\n";
}
