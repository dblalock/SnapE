/*++

Module:

    @file test_trim.cpp

Abstract:

    @author Joe N. Turner <joe@agavemountain.com>

Modification History:

    Created : Fri Jul 10 16:52:18 2009

 Copyright (C) 2009 Agave Mountain, Inc.; All right reserved.

*/
#include <string>
#include "test_trim.h"
#include "include/trim.h"

using namespace stringlib;
using namespace std;

// Registers the fixture

CPPUNIT_TEST_SUITE_REGISTRATION ( test_trim );


test_trim::test_trim()
{
}


test_trim::~test_trim()
{
}

void test_trim::check_trim_right()
{
	std::string tmp = "helloworlddd";
	trim_right(tmp, 'd');
	CPPUNIT_ASSERT_MESSAGE("trim_right broken", \
			tmp == "helloworl");

	trim_right(tmp,' ');
	CPPUNIT_ASSERT_MESSAGE("trim_right broken", \
			tmp == "helloworl");
}

void test_trim::check_trim_left()
{
	std::string tmp = "helloworlddd";

	trim_left(tmp, 'd');

	CPPUNIT_ASSERT_MESSAGE("trim_left broken", \
			tmp == "helloworlddd");

	trim_left(tmp,' ');
	CPPUNIT_ASSERT_MESSAGE("trim_left broken", \
			tmp == "helloworlddd");

	trim_left(tmp,'h');
	CPPUNIT_ASSERT_MESSAGE("trim_left broken", \
			tmp == "elloworlddd");
}

void test_trim::check_trim_ws_right()
{
	string tmp = "   helloworld   ";

	trim_ws_right(tmp);

	CPPUNIT_ASSERT_MESSAGE("trim_ws_right broken", \
			tmp == "   helloworld");

	trim_ws_right(tmp);
	CPPUNIT_ASSERT_MESSAGE("trim_ws_right broken", \
			tmp == "   helloworld");
}

void test_trim::check_trim_ws_left()
{
	string tmp = "   helloworld   ";

	trim_ws_left(tmp);

	CPPUNIT_ASSERT_MESSAGE("trim_ws_left broken", \
			tmp == "helloworld   ");

	trim_ws_left(tmp);
	CPPUNIT_ASSERT_MESSAGE("trim_ws_left broken", \
			tmp == "helloworld   ");
}

void test_trim::check_trim()
{
	string tmp = "   helloworld   ";
	trim(tmp);
	CPPUNIT_ASSERT_MESSAGE("trim broken", \
			tmp == "helloworld");

	trim(tmp);
	CPPUNIT_ASSERT_MESSAGE("trim broken", \
			tmp == "helloworld");
}
