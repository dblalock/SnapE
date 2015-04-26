//
//  Timer.m
//  OCR-Example
//
//  Created by DB on 11/16/14.
//  Copyright (c) 2014 Christopher Constable. All rights reserved.
//

#import "Timer.h"

@implementation Timer

- (id) init {
	self = [super init];
	if (self != nil) {
		start = nil;
		end = nil;
		[self start];
	}
	return self;
}

- (void) start {
	start = [NSDate date];
}

- (void) stop {
	end = [NSDate date];
}

- (double) elapsedSecs {
	return [end timeIntervalSinceDate:start];
}

- (double) elapsedMillis {
	return [self elapsedSecs] * 1000.0f;
}

- (double) elapsedMinutes {
	return [self elapsedSecs] / 60.0f;
}

- (void) logElapsed {
	NSLog(@"Elapsed ms: %g", [self elapsedMillis]);
}

- (void) logCheckPoint:(NSString*)name {
	[self stop];
	NSLog(@"Completed \"%@\" in %gms", name, [self elapsedMillis]);
	[self start];
}

@end