//
//  ResultsViewController.m
//  OCR-Example
//
//  Created by Christopher Constable on 5/10/13.
//  Copyright (c) 2013 Christopher Constable. All rights reserved.
//

#import "ResultsViewController.h"
#import "Tesseract.h"
#import "ImageProcessing.h"
#import "TextProcessor.hpp"
#import "ImageUtils.h"
#import "NSString+CppString.h"

@interface ResultsViewController ()
- (void) processText:(NSString*)text;
@end

@implementation ResultsViewController {
//	__block Tesseract* tesseract;
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
}


//-(void)takePhoto {
//	UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
//	if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
//		[imagePickerController setSourceType:UIImagePickerControllerSourceTypeCamera];
//	}
//	// image picker needs a delegate,
//	[imagePickerController setDelegate:self];
//	// Place image picker on the screen
//	[self presentViewController:imagePickerController animated:YES completion:nil];
//}
//
//-(void)chooseFromLibrary {
//	UIImagePickerController *imagePickerController= [[UIImagePickerController alloc]init];
//	[imagePickerController setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
//	// image picker needs a delegate so we can respond to its messages
//	[imagePickerController setDelegate:self];
//	// Place image picker on the screen
//	[self presentViewController:imagePickerController animated:YES completion:nil];
//}
//
////delegate methode will be called after picking photo either from camera or library
//- (void)imagePickerController:(UIImagePickerController *)picker
//didFinishPickingMediaWithInfo:(NSDictionary *)info {
//	[self dismissViewControllerAnimated:YES completion:nil];
//	UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
//	[myImageView setImage:image];    // "myImageView" name of any UImageView.
//}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
	[self ocrMyImage];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) ocrMyImage {
	dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
		NSString* text = ocrImage(tesseract, self.selectedImage);
		
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

- (void) processText:(NSString*)text {
	if (text == nil) { return; }
	TextProcessor tp;
	tp.processText([text toCppString]);
	NSLog(@"processing text: %@", text);
	[self.resultsTextView setText:[tesseract recognizedText]];
}

@end
