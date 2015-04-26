/*++

Module:

    @file case.h

Abstract:

    @author Joe N. Turner <joe@agavemountain.com>

Modification History:

    Created : Sat Nov 22 16:26:53 2008

 Copyright (C) 2008 Agave Mountain, Inc.; All right reserved.

*/
#ifndef _STRING_CASE_H_
#define _STRING_CASE_H_
#include <string>
#include <iostream>
#include <algorithm>
#include <iterator>
#include <cctype>

namespace stringlib
{

/// \brief Convert a string to upper case.
///
/// This template function will convert all characters in a string to upper case.
///
/// @param string to convert
///
template<typename T>
void upper_case(std::basic_string<T> &str)
{
	std::transform(str.begin(), str.end(), str.begin(), (int (*)(int))std::toupper);
}

/// \brief convert the contents of a string to lower case characters
///
/// This template function will convert all characters in a string to lower case.
///
template<typename T>
void lower_case(std::basic_string<T> &str)
{
	std::transform(str.begin(), str.end(), str.begin(), (int (*)(int))std::tolower);
}


/// \brief case insensitive character comparison
///
/// This helper function will compare two characters in a case insensitive
/// manner.
inline bool caseInsCharCompareN(wchar_t a, wchar_t b)
{
    return(towupper(a) == towupper(b));
}

inline bool caseInsCharCompareW(wchar_t a, wchar_t b)
{
    return(towupper(a) == towupper(b));
}

/// \brief case insensitive string comparison
///
/// This helper function will compare two strings in a case insensitive
/// manner.
template<typename T>
bool caseInsCompare(const std::basic_string<T>& s1, const std::basic_string<T>& s2)
{
	return ( (s1.size()==s2.size()) &&
			std::equal(s1.begin(), s1.end(), s2.begin(), caseInsCharCompareN));
}

bool caseInsCompare(const std::string& s1, const std::string& s2);

bool caseInsCompare(const std::wstring& s1, const std::wstring& s2);

inline bool caseInsCharCompSingle(char a, char b)
{
   return(toupper(a) == b);
}

std::string::const_iterator caseInsFind(std::string& s, const std::string& p);


};

#endif


