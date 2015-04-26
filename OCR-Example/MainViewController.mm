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
#import "NSString+CppString.h"

@interface MainViewController () <UINavigationControllerDelegate, UIImagePickerControllerDelegate>
@property (nonatomic, strong) UIImage *selectedImage;
@property (nonatomic, strong) UIView *loadingView;

@property (weak, nonatomic) IBOutlet UIImageView *selectedImageView;
@end

@implementation MainViewController {
	Tesseract* tesseract;
}

- (id)initWithNibName:(NSString*)nibNameOrNil bundle:(NSBundle*)nibBundleOrNil {
	self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
	if (self) {
		tesseract = [[Tesseract alloc] initWithDataPath:@"/tessdata" language:@"eng"];
		// Only search for alpha-numeric characters.
		[tesseract setVariableValue:@"-/0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ" forKey:@"tessedit_char_whitelist"];
	}
	return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
	[self choosePhoto];
}

-(void) choosePhoto {
	UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
	imagePickerController.delegate = self;
	
	if ([UIImagePickerController isCameraDeviceAvailable:UIImagePickerControllerCameraDeviceRear]) {
		imagePickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
		imagePickerController.cameraCaptureMode = UIImagePickerControllerCameraCaptureModePhoto;
	} else {
		imagePickerController.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
	}
	
	[self presentViewController:imagePickerController
					   animated:YES
					 completion:nil];
}

// ================================================================
#pragma mark UIImagePickerControllerDelegate
// ================================================================

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
	[self dismissViewControllerAnimated:YES completion:nil];
	self.selectedImage = [info objectForKey:UIImagePickerControllerOriginalImage];
	if (self.selectedImage) {
//		[self.selectedImageView setImage:self.selectedImage];
		[self createEventFromImage:self.selectedImage];
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
								 [self processText:text];
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

@end
