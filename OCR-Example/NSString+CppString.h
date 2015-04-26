//
//  NSString+CppString.h
//  OCR-Example
//
//  Created by DB on 11/16/14.
//  Copyright (c) 2014 Christopher Constable. All rights reserved.
//

#ifndef OCR_Example_NSString_CppString_h
#define OCR_Example_NSString_CppString_h

#include <string>

@interface NSString (cppstring)
+(NSString*) stringWithwstring:(const std::wstring&)string;
+(NSString*) stringWithstring:(const std::string&)string;
-(std::wstring) toCppWstring;
-(std::string) toCppString;
@end

#endif
