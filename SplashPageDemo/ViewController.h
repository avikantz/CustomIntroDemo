//
//  ViewController.h
//  SplashPageDemo
//
//  Created by Avikant Saini on 3/26/15.
//  Copyright (c) 2015 avikantz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EAIntroView.h"
#import "EAIntroPage.h"

@interface ViewController : UIViewController <EAIntroDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *backgroundImageView;

- (IBAction)replayIntro:(id)sender;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *replayIntroButton;

@end

