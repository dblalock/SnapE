/*++

Module:

    @file test_pad.h

Abstract:

    @author Joe N. Turner <joe@agavemountain.com>

Modification History:

    Created : Thu Jul  9 17:57:03 2009

 Copyright (C) 2009 Agave Mountain, Inc.; All right reserved.

*/
#ifndef __PAD_H_
#define __PAD_H_
#include <string>
namespace stringlib
{

/**
 * \brief pad a string to the right
 *
 * This template function uses string's insert and append member
 * functions to pad a string with the character on the end of the
 * string.
 *
 * You pass a string object, and the expected size of the resultant string,
 * and a character to inserted or appended to the string.
 *
 * If the string is larger than the specified number of characters, it
 * will not be modified.
 *
 * This function WILL NOT truncate a string if it is over the specified number of
 * characters.
 *
 * example:
 * <code>
 *     std::string myCheckAmount = "3,000";
 *     pad_right( myCheckAmount, 30, "*");
 *     cout << myCheckAmount << std::endl;
 * </code>
 */
template<typename T>
void pad_right(std::basic_string<T>& s,                      //!< string to pad
               typename std::basic_string<T>::size_type n,   //!< number of characters to pad
               T c                                           //!< character append
               )
{
    if (n > s.length( ))
    {
        s.append(n - s.length( ), c);
    }
}

/**
 * \brief pad a string to the left
 *
 * This template function uses string's insert member
 * function to pad a string with characters at the beginning of the string.
 *
 * You pass a string object, and the number of characters you wish to
 * have in the resultant string, and a character to insert into the string.
 * If the string is larger than the specified number of characters, it is not modified.
 *
 * This function WILL NOT truncate a string over the specified number of
 * characters.
 *
 * example:
 * <code>
 * 		std::string myPoint = "darn";
 *  	pad_left( myPoint, 10, "!" );
 *  	cout << myPoint << std::endl;
 * </code>
 *
 */
template<typename T>
void pad_left(std::basic_string<T>& s,                       //!< string to pad
              typename std::basic_string<T>::size_type n,    //!< number of characters to pad
              T c                                            //!< character to prepend
              )
{
    if (n > s.length( ))
    {
        s.insert(s.begin( ), n - s.length (), c);
    }
}


};

#endif
