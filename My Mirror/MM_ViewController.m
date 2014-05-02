//
//  MM_ViewController.m
//  My Mirror
//
//  Created by Benjamin Myers on 5/1/14.
//  Copyright (c) 2014 AppGuys. All rights reserved.
//

#import "MM_ViewController.h"
#import <MobileCoreServices/UTCoreTypes.h>
#import <AVFoundation/AVFoundation.h>

@interface MM_ViewController ()

@end

@implementation MM_ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    CGRect screenBound = [[UIScreen mainScreen] bounds];
    CGSize screenSize = screenBound.size;
    CGFloat screenHeight = screenSize.height;
    
    if (screenHeight < 568) {
        _bannerView = [[ADBannerView alloc] initWithFrame:CGRectMake(0,430, 320, 50)];
        _backgroundImageView.image = [UIImage imageNamed:@"launchScreen640x960"];
        
    } else {
        _bannerView = [[ADBannerView alloc] initWithFrame:CGRectMake(0, 518, 320, 50)];
    }
    _bannerView.delegate = self;
}

- (void)viewDidAppear:(BOOL)animated
{
    
	// Do any additional setup after loading the view, typically from a nib.
    if (([UIImagePickerController isCameraDeviceAvailable:UIImagePickerControllerCameraDeviceFront])) {
        [self startCameraControllerFromViewController:self usingDelegate:self];
    }
    else{
        _lblApologie.text = @"We apologize but your device is not supported.";
    }
}

- (void)startCameraControllerFromViewController:(UIViewController *)controller usingDelegate:(id)delegate
{
    _cameraUI = [[UIImagePickerController alloc] init];
    _cameraUI.sourceType = UIImagePickerControllerSourceTypeCamera;
    _cameraUI.mediaTypes = [[NSArray alloc] initWithObjects:(NSString *)kUTTypeMovie, nil];
    _cameraUI.allowsEditing = NO;
    _cameraUI.showsCameraControls = NO;
    _cameraUI.cameraDevice = UIImagePickerControllerCameraDeviceFront;
    _cameraUI.delegate = delegate;
    
    [controller presentViewController:_cameraUI animated:YES completion:nil];
    [self.view addSubview:_cameraUI.view];
    [_cameraUI.view addSubview:_bannerView];
}

-(void)bannerView:(ADBannerView *)banner didFailToReceiveAdWithError:(NSError *)error
{
    _bannerView.hidden = YES;
}

- (BOOL)prefersStatusBarHidden
{
    return YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
