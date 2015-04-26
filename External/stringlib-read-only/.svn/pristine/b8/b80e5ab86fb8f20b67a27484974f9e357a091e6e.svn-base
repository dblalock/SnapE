/*++
    @file format.h
    @author Joe Turner <joe@agavemountain.com>
	@copyright Copyright (C) 2009 Joe Turner

    This file is part of stringlib.

    stringlib is free software: you can redistribute it and/or modify it
    under the terms of the GNU General Public License as published by the
    Free Software Foundation, either version 3 of the License, or (at
    your option) any later version.

    stringlib is distributed in the hope that it will be useful, but WITHOUT
    ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
    FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
    for more details.

    You should have received a copy of the GNU General Public License along
    with stringlib. If not, see http://www.gnu.org/licenses/.
*/

#ifndef FORMAT_H_
#define FORMAT_H_
#include <string>

/**
 * \brief Format a string with printf specifiers
 *
 * One of the most glaring omissions in the standard string
 * object is the lack of a printf type formatter, leaving
 * you to rely on devices for formatting text.
 *
 * Given that I was spoiled the Microsoft's Format method,
 * I decided to write my own.
 *
 * This utility function will format your string with the
 * standard printf specifiers.
 *
 * Example:
 * <code>
 * 		std::string myString;
 * 		format(myString, "hello %d", 1);
 * </code>
 *
 * See @see printf for the format specifiers and usage.
 *
 * Note: boost::format also has some formatting code you
 * may be interested in.
 *
 * @TODO create a version for wide character strings.
 */
std::string format( std::string &format, ... );


#endif /* FORMAT_H_ */
