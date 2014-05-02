//
//  MM_ViewController.h
//  My Mirror
//
//  Created by Benjamin Myers on 5/1/14.
//  Copyright (c) 2014 AppGuys. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <iAd/iAd.h>

@interface MM_ViewController : UIViewController <ADBannerViewDelegate>

@property (strong, nonatomic)UIImagePickerController *cameraUI;

@property (strong, nonatomic) IBOutlet ADBannerView *bannerView;
@property (strong, nonatomic) IBOutlet UILabel *lblApologie;
@property (strong, nonatomic) IBOutlet UIImageView *backgroundImageView;
@end
