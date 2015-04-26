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
#include "include/format.h"
#include <stdio.h>
#include <stdarg.h>

std::string format( std::string &format, ... )
{
	va_list args;
	va_start(args, format);

	// use snprintf to get the number of characters required
	// to allocate.  This will keep us from having to
	// have a local buffer on the stack and hitting vsprintf
	// multiple times.  However, some embedded systems do
	// not have snprintf.
	int size = snprintf(NULL, 0, format.c_str(), args);
	char *ptr = new char[size];

	vsnprintf(ptr, size, format.c_str(), args);
	va_end(args);

	std::string retVal = ptr;
	delete ptr;

	return retVal;
}

