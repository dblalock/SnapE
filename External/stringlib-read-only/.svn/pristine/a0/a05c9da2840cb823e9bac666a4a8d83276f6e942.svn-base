/*++

Module:

    @file split.h

Abstract:

    @author Joe N. Turner <joe@agavemountain.com>

Modification History:

    Created : Fri Jul 10 17:53:43 2009

 Copyright (C) 2009 Agave Mountain, Inc.; All right reserved.

*/

/*++

Module:

    @file stringSplit.h

Abstract:

    split a deliminated string into a vector of strings

    @author Joe N. Turner <joe@agavemountain.com>

Modification History:

    Created : Mon Oct 20 22:48:30 2008

 Copyright (C) 2008 Agave Mountain, Inc.; All right reserved.

*/
#ifndef _STRINGSPLIT_H_
#define _STRINGSPLIT_H_

#include <string>
#include <vector>
#include <functional>
#include <iostream>

namespace stringlib
{

/**
 * \brief split a deliminated string into a vector of strings
 *
 * Java has a convenient split method for tokenizing:
 *
 * <code>
 * 	String[] results = string("the quick brown fox).split(" ");
 * </code>
 *
 * This function splits a string using basic_string's find member function to
 * advance from one occurrence of the delimiter to the next,
 * and substr to copy each substring out of the original
 * string. You can use any standard sequence to hold the
 * results.
 *
 * @param src - source deliminiated string to split up
 * @param c - delimiter character
 * @param vector - vector to store split up string
 *
 */
template<typename T>
void split( const std::basic_string<T> &src, T c, std::vector< std::basic_string<T> >& v)
{
	unsigned int i = 0;
	unsigned int j = src.find(c);

	while (j != std::basic_string<T>::npos)
	{
		v.push_back(src.substr(i, j-i));
		i = ++j;
		j = src.find(c, j);

		if (j== std::basic_string<T>::npos)
		{
			v.push_back(src.substr(i, src.length()));
		}

	}
}

//
//
//template<typename T>
//int nthSubstring(int n, const std::basic_string<T>& s,
//               const std::basic_string<T>& p,
//               bool repeats = false) {
//   std::string::size_type i = s.find(p);
//   std::string::size_type adv = (repeats) ? 1 : p.length( );
//
//   int j;
//   for (j = 1; j < n && i != std::basic_string<T>::npos; ++j)
//      i = s.find(p, i+adv);
//
//   if (j == n)
//     return(i);
//   else
//     return(-1);
//}

void
split( vector<string> & theStringVector,  /* Altered/returned value */
       const  string  & theString,
       const  string  & theDelimiter )
{
  // UASSERT( theDelimiter.size(), >, 0 ); // My own ASSERT macro.

  size_t  start = 0, end = 0;

  while ( end != string::npos )
  {
    end = theString.find( theDelimiter, start );

      // If at end, use length=maxLength.  Else use length=end-start.
    theStringVector.push_back( theString.substr( start,
                   (end == string::npos) ? string::npos : end - start ) );

      // If at end, use start=maxSize.  Else use start=end+delimiter.
    start = (   ( end > (string::npos - theDelimiter.size()) )
              ?  string::npos  :  end + theDelimiter.size()    );
  }
}

};

#endif

