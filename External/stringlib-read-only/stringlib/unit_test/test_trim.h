/*++

Module:

    @file test_trim.h

Abstract:

    @author Joe N. Turner <joe@agavemountain.com>

Modification History:

    Created : Fri Jul 10 16:52:18 2009

 Copyright (C) 2009 Agave Mountain, Inc.; All right reserved.

*/
#include <cppunit/extensions/HelperMacros.h>


/**
 * @brief unit test: test_trim
 *
 * @TODO fill in documentation
 */
class test_trim : public CppUnit::TestFixture
{

public:
   test_trim();
   virtual ~test_trim();

   void check_trim_right();
   void check_trim_left();
   void check_trim_ws_right();
   void check_trim_ws_left();
   void check_trim();

public:
// CPPUNIT test configuration via helper macros

   CPPUNIT_TEST_SUITE( test_trim );
   CPPUNIT_TEST( check_trim_right );
   CPPUNIT_TEST( check_trim_left );
   CPPUNIT_TEST( check_trim_ws_right );
   CPPUNIT_TEST( check_trim_ws_left );
   CPPUNIT_TEST( check_trim );
   CPPUNIT_TEST_SUITE_END();

};

