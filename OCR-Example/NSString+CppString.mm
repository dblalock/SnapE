//
//  NSString+CppString.m
//  OCR-Example
//
//  Created by DB on 11/16/14.
//  Copyright (c) 2014 Christopher Constable. All rights reserved.
//

#import <Foundation/Foundation.h>

#include <string>

@implementation NSString (cppstring)

#if TARGET_RT_BIG_ENDIAN
const NSStringEncoding kEncoding_wchar_t = CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingUTF32BE);
#else
const NSStringEncoding kEncoding_wchar_t = CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingUTF32LE);
#endif

+(NSString*) stringWithwstring:(const std::wstring&)ws
{
	char* data = (char*)ws.data();
	unsigned size = ws.size() * sizeof(wchar_t);
	
	NSString* result = [[NSString alloc] initWithBytes:data length:size encoding:kEncoding_wchar_t];
	return result;
}
+(NSString*) stringWithstring:(const std::string&)s
{
	NSString* result = [[NSString alloc] initWithUTF8String:s.c_str()];
	return result;
}

-(std::wstring) toCppWstring
{
	NSData* asData = [self dataUsingEncoding:kEncoding_wchar_t];
	return std::wstring((wchar_t*)[asData bytes], [asData length] / sizeof(wchar_t));
}
-(std::string) toCppString
{
	return [self UTF8String];
}

@end