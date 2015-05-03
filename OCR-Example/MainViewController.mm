//
//  MainViewController.m
//  OCR-Example
//
//  Created by DB on 4/12/15.
//  Copyright (c) 2015 Christopher Constable. All rights reserved.
//

#import "MainViewController.h"

#import "Tesseract.h"
#import "ImageProcessing.h"
#import "TextProcessor.hpp"
#import "ImageUtils.h"
#import "EventManager.h"
#import "NSString+CppString.h"

#import <EventKit/EventKit.h>
#import <EventKitUI/EventKitUI.h>

@interface MainViewController () <UINavigationControllerDelegate,
	UIImagePickerControllerDelegate,EKEventEditViewDelegate>
@property (nonatomic, strong) UIImage *selectedImage;
@property (nonatomic, strong) UIView *loadingView;

@property (weak, nonatomic) IBOutlet UIImageView *selectedImageView;

@property (nonatomic, strong) EventManager *eventManager;
@property(nonatomic) BOOL didShowCamera;

@end

@implementation MainViewController {
	Tesseract* tesseract;
}

//- (id)initWithNibName:(NSString*)nibNameOrNil bundle:(NSBundle*)nibBundleOrNil {
//	self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
-(void) awakeFromNib {
	[super awakeFromNib];
	NSLog(@"initing mainViewController");
	if (self) {
		self.didShowCamera = NO;
		self.eventManager = [[EventManager alloc] init];
		
		NSLog(@"eventMgr: %@, eventStore: %@", self.eventManager, self.eventManager.eventStore);
		
		tesseract = [[Tesseract alloc] initWithDataPath:@"/tessdata" language:@"eng"];
		// Only search for alpha-numeric characters.
		[tesseract setVariableValue:@"-/0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ" forKey:@"tessedit_char_whitelist"];
	}
//	return self;
}

- (void)viewDidAppear:(BOOL)animated {
	[super viewDidAppear:animated];
	if (! self.didShowCamera) {
		self.didShowCamera = YES;
		// view needs to have shown up or we get "an empty snapshot" (?)
		// EDIT: nope, still complaining; not clear whether it's a problem though
//		[self performSelector:@selector(choosePhoto) withObject:nil afterDelay:0.3];
		[self choosePhoto];
	}
}

-(void) choosePhoto {
	UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
	imagePickerController.delegate = self;
	
	if ([UIImagePickerController isCameraDeviceAvailable:UIImagePickerControllerCameraDeviceRear]) {
		imagePickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
		imagePickerController.cameraCaptureMode = UIImagePickerControllerCameraCaptureModePhoto;
		// attempted fixes to "empty snapshot" message, from internet
		// http://stackoverflow.com/questions/18890003/uiimagepickercontroller-error-snapshotting-a-view-that-has-not-been-rendered-re
//		imagePickerController.modalPresentationStyle = UIModalPresentationFullScreen;
//		imagePickerController.modalPresentationStyle = UIModalPresentationCurrentContext;
	} else {
		imagePickerController.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
	}
	
	[self presentViewController:imagePickerController
					   animated:YES
					 completion:nil];
}

- (IBAction)choosePhotoWasTapped:(id)sender {
	[self choosePhoto];
}

// ================================================================
#pragma mark UIImagePickerControllerDelegate
// ================================================================

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
	[self dismissViewControllerAnimated:YES completion:nil];
	self.selectedImage = [info objectForKey:UIImagePickerControllerOriginalImage];
	if (self.selectedImage) {
		[self.selectedImageView setImage:self.selectedImage];
		[self createEventFromImage:self.selectedImageView.image];
	}
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
	[self dismissViewControllerAnimated:YES completion:nil];
}

// ================================================================
#pragma mark OCR stuff
// ================================================================

-(void) createEventFromImage:(UIImage*)img {
	dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
		NSString* text = ocrImage(tesseract, img);
		
		dispatch_async(dispatch_get_main_queue(), ^{
			[UIView animateWithDuration:0.3
							 animations:^{
								 self.loadingView.alpha = 0.0;
							 }
							 completion:^(BOOL finished) {
								 self.loadingView.hidden = YES;
								 NSString* txt = [self processText:text];
								 NSLog(@"recognized text: %@", txt);
								 [self presentEventEditViewControllerWithEventStore:self.eventManager.eventStore];
							 }];
		});
	});
}

-(NSString*) processText:(NSString*)text {
	if (text == nil) { return @""; }
	TextProcessor tp;
	std::string cppProcText = tp.processText([text toCppString]);
	NSString* procText = [NSString stringWithstring:cppProcText];
	NSLog(@"processing text: %@", procText);
	return procText;
//	[self.resultsTextView setText:[tesseract recognizedText]];
}

// ================================================================
#pragma mark Event stuff
// ================================================================

- (void)presentEventEditViewControllerWithEventStore:(EKEventStore*)eventStore
{
	if (!self.eventManager.eventsAccessGranted) {
		[self requestAccessToEvents];
	}
	
	EKEventEditViewController* vc = [[EKEventEditViewController alloc] init];
	vc.eventStore = eventStore;
	
	EKEvent* event = [EKEvent eventWithEventStore:eventStore];
	// Prepopulate all kinds of useful information with you event.
	event.title = @"New Event Title";
	event.startDate = [NSDate date];
	event.endDate = [NSDate date];
	event.URL = [NSURL URLWithString:@"http://www.apple.com"];
	event.notes = @"This event has some notes";
	event.allDay = YES;
	vc.event = event;
	
	vc.editViewDelegate = self;
	
	[self presentViewController:vc animated:YES completion:nil];
}

-(void)requestAccessToEvents {
	NSLog(@"requesting access to events using eventStore %@", self.eventManager.eventStore);
	[self.eventManager.eventStore requestAccessToEntityType:EKEntityTypeEvent
												 completion:^(BOOL granted, NSError *error) {
		if (error == nil) {
			NSLog(@"was granted access? %d", granted);
			// Store the returned granted value.
			self.eventManager.eventsAccessGranted = granted;
		} else{
			NSLog(@"%@", [error localizedDescription]);
		}
	}];
	NSLog(@"finished requesting access to events");
}

#pragma EKEventEditViewDelegate

- (void)eventEditViewController:(EKEventEditViewController*)controller
		  didCompleteWithAction:(EKEventEditViewAction)action
{
	[controller dismissViewControllerAnimated:YES completion:nil];
	//    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
