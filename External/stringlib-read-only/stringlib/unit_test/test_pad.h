/*++

Module:

    @file test_pad.h

Abstract:

    @author Joe N. Turner <joe@agavemountain.com>

Modification History:

    Created : Thu Jul  9 17:57:03 2009

 Copyright (C) 2009 Agave Mountain, Inc.; All right reserved.

*/
#include <cppunit/extensions/HelperMacros.h>


/**
 * @brief unit test: test_pad
 *
 * @TODO fill in documentation
 */
class test_pad : public CppUnit::TestFixture
{

public:
   test_pad() {};
   virtual ~test_pad() {};

   void check_pad_left();
   void check_pad_right();

public:
// CPPUNIT test configuration via helper macros

   CPPUNIT_TEST_SUITE( test_pad );
   CPPUNIT_TEST( check_pad_left );
   CPPUNIT_TEST( check_pad_right );
   CPPUNIT_TEST_SUITE_END();

};

