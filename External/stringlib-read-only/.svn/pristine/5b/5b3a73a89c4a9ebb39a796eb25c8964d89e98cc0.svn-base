/*++

Module:

    @file unit_test/unit_test_main.cpp

Abstract:

    @author Joe N. Turner <joe@agavemountain.com>

Modification History:

    Created : Fri Sep  5 21:05:30 2008

 Copyright (C) 2008 Agave Mountain, Inc.; All right reserved.

*/
#include <iostream>
#include <cppunit/extensions/HelperMacros.h>
#include <cppunit/extensions/TestFactoryRegistry.h>
#include <cppunit/ui/text/TestRunner.h>
using namespace std;

int main(int argc, char **argv)
{
  bool                          success;
  CppUnit::TextUi::TestRunner   runner;     // Test runner object

  (void)argc;
  (void)argv;

  runner.addTest( CppUnit::TestFactoryRegistry::getRegistry().makeTest() );

  printf("\n\n--------------- PROGRAM PRINT OUT ---------------\n");
  success = runner.run( ); // Run all tests and do not wait

  return((success) ? 0 : 1);
}


