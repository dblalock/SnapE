//
//  ImageUtils.m
//  OCR-Example
//
//  Created by DB on 4/26/15.
//  Copyright (c) 2015 Christopher Constable. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ImageProcessing.h"
#import "Tesseract.h"
#import "Timer.h"

UIImage* downsampleImageBy(UIImage* img, int factor) {
	CGSize newSize = CGSizeMake(img.size.width / factor,
								img.size.height / factor);
	UIGraphicsBeginImageContextWithOptions(newSize, NO, 0.0);
	[img drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
	UIImage *resizedImage = UIGraphicsGetImageFromCurrentImageContext();
	UIGraphicsEndImageContext();
	return resizedImage;
}

UIImage* thresholdImage(UIImage* img) {
	ImageWrapper *greyScale=Image::createImage(img,
											   img.size.width,
											   img.size.height);
	ImageWrapper *edges = greyScale.image->autoLocalThreshold();
	return edges.image->toUIImage();
}

NSString* extractText(Tesseract* tess, UIImage* img) {
	[tess setImage:img];
	[tess recognize];
	return [tess recognizedText];
}

NSString* ocrImage(Tesseract* tess, UIImage* img) {
	int SCALE_DOWN_BY = 4;	// strongly affects execution time
	
	Timer* timer = [[Timer alloc] init];
	
	UIImage* resizedImage = downsampleImageBy(img, SCALE_DOWN_BY);
	[timer logCheckPoint:@"render / shrink image...?"];		// 1873ms
	
	UIImage* quantizedImage = thresholdImage(resizedImage);
	[timer logCheckPoint:@"create wrapper image + threshold"]; // 1640ms
	
	NSString* text = extractText(tess, quantizedImage);
	[timer logCheckPoint:@"recognition"];	// 80ms
	
	return text;
}
