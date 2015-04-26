//
//  ImageUtils.h
//  OCR-Example
//
//  Created by DB on 4/26/15.
//  Copyright (c) 2015 DB. All rights reserved.
//

// this file is separate from ImageProcessing because these are my own functions

#ifndef OCR_Example_ImageUtils_h
#define OCR_Example_ImageUtils_h

UIImage* downsampleImageBy(UIImage* img, int factor);
UIImage* thresholdImage(UIImage* img);
NSString* extractText(Tesseract* tess, UIImage* img);
NSString* ocrImage(Tesseract* tess, UIImage* img);

#endif
