/*++ 

Module:

    @file test_chomp.h

Abstract:

    @author Joe N. Turner <joe@agavemountain.com>

Modification History:

    Created : Fri Jul 10 17:39:38 2009

 Copyright (C) 2009 Agave Mountain, Inc.; All right reserved.

*/
#include <cppunit/extensions/HelperMacros.h>


/**
 * @brief unit test: test_chomp
 *
 * @TODO fill in documentation
 */
class test_chomp : public CppUnit::TestFixture
{

public:
   test_chomp();
   virtual ~test_chomp();

   void check();

public:
// CPPUNIT test configuration via helper macros

   CPPUNIT_TEST_SUITE( test_chomp );
   CPPUNIT_TEST( check );
   CPPUNIT_TEST_SUITE_END();

};

