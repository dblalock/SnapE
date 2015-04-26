/*++

Module:

    @file join.h

Abstract:

    @author Joe N. Turner <joe@agavemountain.com>

Modification History:

    Created : Mon Oct 20 22:48:30 2008

 Copyright (C) 2009 Agave Mountain, Inc.; All right reserved.

*/
#ifndef _JOIN_H_
#define _JOIN_H_

namespace stringlib
{

/**
 *  \brief Join a sequence of strings into one string.
 *
 * When given a vector of strings, this function will
 * take the strings and append them to the specified string.
 *
 * @param v vector of strings
 * @param c character to inject between the strings
 * @param s reference to resultant string object
 */
inline
void join(const std::vector<std::string>& v, char c, std::string& s) {

   s.clear( );
   std::vector<std::string>::const_iterator p;
   for (p = v.begin( ); p != v.end( ); ++p) {
      s.append( *p );
      if (p != v.end( ) - 1)
        s += c;
   }
}

};

#endif

