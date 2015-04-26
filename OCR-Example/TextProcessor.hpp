//
//  TextProcessor.h
//  OCR-Example
//
//  Created by DB on 11/16/14.
//  Copyright (c) 2014 Christopher Constable. All rights reserved.
//

#ifndef OCR_Example_TextProcessor_h
#define OCR_Example_TextProcessor_h

#include <string>

class TextProcessor {
private:
	class impl;
	impl* _pimpl;
public:
	std::string processText(std::string text);
	std::string getDate();
};

#endif
