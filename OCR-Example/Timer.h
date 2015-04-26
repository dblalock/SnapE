//
//  Timer.h
//  OCR-Example
//
//  Created by DB on 11/16/14.
//  Copyright (c) 2014 Christopher Constable. All rights reserved.
//

#ifndef OCR_Example_Timer_h
#define OCR_Example_Timer_h

#import <Foundation/Foundation.h>

@interface Timer : NSObject {
	NSDate *start;
	NSDate *end;
}

- (void) start;
- (void) stop;
- (double) elapsedSecs;
- (double) elapsedMillis;
- (double) elapsedMinutes;
- (void) logElapsed;
- (void) logCheckPoint:(NSString*)name;

@end

#endif
