/*++

Module:

    @file trim.h

Abstract:

    @author Joe N. Turner <joe@agavemountain.com>

Modification History:

    Created : Sat Nov 22 16:36:37 2008

 Copyright (C) 2008 Agave Mountain, Inc.; All right reserved.

*/
#ifndef TRIM_H_
#define TRIM_H_

namespace stringlib
{

/**
 * @TODO Which is faster?  This?
 *
 * inline void trim_right(std::string &source, const std::string &t) {
 * source.erase(source.find_last_not_of(t)+1);
 * }
 * inline void trim_left(std::string &source, const std::string &t) {
 * source.erase(0, source.find_first_not_of(t));
 * }
 */

/**
 * \brief trim some number of characters from the end(s) of a
 * string, usually whitespace.
 *
 * This template function will trim a number of characters
 * from the end of a string.
 */
template<typename T>
void trim_right(std::basic_string<T>& s,        //!< string to trim
                T c                             //!< character to trim
                )
{
    if (s.empty( )) return;

    typename std::basic_string<T>::iterator p;
    for (p = s.end( ); p != s.begin( ) && *--p == c;);

    if (*p != c)  p++;

    s.erase(p, s.end( ));
}

/**
 * \brief trim some number of characters from the beginning
 * of a string, usually whitespace.
 *
 * This template function will trim a number of
 * characters from the beginning of a string.
 *
 *  @TODO refactor.
 */
template<typename T>
void trim_left(std::basic_string<T>& s,      //!< string to trim
                const char *c                //!< characters to trim
                )
{
	typename std::basic_string<T>::size_type pos =
			s.find_first_not_of(c);

	if (pos != std::basic_string<T>::npos)
	{
		s.erase(0,pos);
	}
	else
	{
		s.erase( s.begin() , s.end() ); // make empty
	}
}


/**
 * \brief trim some number of characters from the beginning
 * of a string, usually whitespace.
 *
 * This template function will trim a number of
 * characters from the beginning of a string.
 *
 */
template<typename T>
void trim_left(std::basic_string<T>& s,      //!< string to trim
                T c                          //!< character to trim
                )
{
	typename std::basic_string<T>::size_type pos =
			s.find_first_not_of(c);

	if (pos != std::basic_string<T>::npos)
	{
		s.erase(0,pos);
	}
	else
	{
		s.erase( s.begin() , s.end() ); // make empty
	}
}

/**
 *  \brief trim some number of whitespace characters from the
 *  beginning of a string
 *
 *  This template function will trim a number of whitespace
 *  (tab or space) characters from the beginning of a string.
 *
 *  @todo this only supports char, not wchar due to the string
 *  literal.  This should be a generic template function.
 *
 */
template<typename T>
void trim_ws_left(std::basic_string<T>& s                    //!< string to trim
                  )
{
    if (s.empty( )) return;
    size_t startpos = s.find_first_not_of(" \t");
    if( std::string::npos != startpos )
    {
         s = s.substr( startpos, s.length() );
    }
}

/**
 * \brief trim some number of whitespace characters from the end
 * of a string
 *
 * This template function will trim a number of whitespace
 * (tab or space) characters from the end of a string.
 *
 * @todo this only supports char, not wchar due to the string
 * literal.  This should be a generic template function.
 *
 */
template<typename T>
void trim_ws_right(std::basic_string<T>& s                    //!< string to trim
                  )
{
    if (s.empty( )) return;
    size_t endpos = s.find_last_not_of(" \t");
    if( std::string::npos != endpos )
    {
         s = s.substr( 0, endpos+1 );
    }
}

/**
 * \brief trim whitespace from beginning and end of the string.
 */
template<typename T>
void trim(std::basic_string<T>& s		// string to trim
		)
{
	trim_ws_left(s);
	trim_ws_right(s);
}

};

#endif /* TRIM_H_ */

