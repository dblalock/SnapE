/*++

Module:

    @file test_pad.cpp

Abstract:

    @author Joe N. Turner <joe@agavemountain.com>

Modification History:

    Created : Thu Jul  9 17:57:03 2009

 Copyright (C) 2009 Agave Mountain, Inc.; All right reserved.

*/
#include "test_pad.h"
#include "include/pad.h"

// Registers the fixture
using namespace stringlib;

CPPUNIT_TEST_SUITE_REGISTRATION ( test_pad );

void test_pad::check_pad_left()
{
	// if the size specified is less than the size of the
	// string; the string should remain umodified.
	std::string tmp = "helloworld";
	pad_left(tmp, 5, '!');
	CPPUNIT_ASSERT_MESSAGE("pad_left broken", \
			tmp == "helloworld");

	// check the results
	pad_left(tmp, 12, '!');
	CPPUNIT_ASSERT_MESSAGE("pad_left broken", \
			tmp == "!!helloworld");

}

void test_pad::check_pad_right()
{
	// if the size specified is less than the size of the
	// string; the string should remain umodified.
	std::string tmp = "hello";
	pad_right(tmp, 5, '!');
	CPPUNIT_ASSERT_MESSAGE("pad_right broken", \
			tmp == "hello");

	// check the results
	pad_right(tmp, 12, '!');
	CPPUNIT_ASSERT_MESSAGE("pad_left broken", \
			tmp == "hello!!!!!!!");

}


