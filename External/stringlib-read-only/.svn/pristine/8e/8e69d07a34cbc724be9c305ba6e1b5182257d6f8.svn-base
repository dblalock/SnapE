/*++

Module:

    @file replace.h

Abstract:

	Various search and replace template functions

    @author Joe N. Turner <joe@agavemountain.com>

Modification History:

    Created : Sat Oct 18 10:46:31 2008

 Copyright (C) 2008 Agave Mountain, Inc.; All right reserved.

*/
#ifndef _FIND_AND_REPLACE_H_
#define _FIND_AND_REPLACE_H_

#include <string>
#include <iostream>

namespace stringlib
{

/**
 @brief specialized template function for string - find and replace template function

 @param src
 This string (either basic_string<char> or basic_string<wchar_t>, which
 contains the source we wish to search and replace.  This will also contain
 the finished result of our search and replace operation.

 @param find
 This string contains the text that we want to search for and replace.

 @param replace
 The string contains text that we want to substituted.

 */
template <typename T>
void replace(basic_string<T>& src,
					const basic_string<T>& find,
					const basic_string<T>& replace)
{
	size_t j;
	for (; (j=src.find(find)) != T::npos;)
	{
		src.replace( j, find.length(), replace);
	}
}

/**
 @brief find and replace template function

 @param src
 This source (can be an stl collection or string), data that we
 wish to search and replace.  This will also contain
 the finished result of our search and replace operation.

 @param find
 This string contains the data that we want to search for and replace.

 @param replace
 The string contains data that we want to substituted.

 */
template <typename T>
void replace(T& src,
					const T& find,
					const T& replace)
{
	size_t j;
	for (; (j=src.find(find)) != T::npos;)
	{
		src.replace( j, find.length(), replace);
	}
}

};

#endif

