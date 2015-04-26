//
//  Events.m
//  OCR-Example
//
//  Created by DB on 4/12/15.
//  Copyright (c) 2015 DB. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <EventKit/EventKit.h>
#import <EventKitUI/EventKitUI.h>

#import "Events.h"

//void requestCalendarAccees(AccessRequestCompletionHandler completion) {
//	EKEventStore* eventStore = [[EKEventStore alloc] init];
//	[eventStore requestAccessToEntityType:EKEntityTypeEvent
//							   completion:completion];
////		[self performSelectorOnMainThread:
////		 @selector(presentEventEditViewControllerWithEventStore:)
////							   withObject:eventStore
////							waitUntilDone:NO];
//}
//
//(void) presentEventEditViewControllerWithEventStore:(EKEventStore*)eventStore {
//	EKEventEditViewController* vc = [[EKEventEditViewController alloc] init];
//	vc.eventStore = eventStore;
//	
//	EKEvent* event = [EKEvent eventWithEventStore:eventStore];
//	event.title = @"New Event Title";
//	event.startDate = [NSDate date];
//	event.endDate = [NSDate date];
//	event.URL = [NSURL URLWithString:@"http://www.apple.com/"];
//	event.notes = @"This event will be awesome!";
//	event.allDay = YES;
//	vc.event = event;
//	
//	vc.editViewDelegate = self;
//	
//	[self presentViewController:vc animated:YES completion:nil];
//}