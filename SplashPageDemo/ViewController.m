//
//  ViewController.m
//  SplashPageDemo
//
//  Created by Avikant Saini on 3/26/15.
//  Copyright (c) 2015 avikantz. All rights reserved.
//

#import "ViewController.h"
#import "SMPageControl.h"

#define SWidth self.view.frame.size.width
#define SHeight self.view.frame.size.height

@interface ViewController ()

@end

@implementation ViewController {
	EAIntroView *intro;
	EAIntroPage *page0, *page1, *page2, *page3, *page4, *page5, *page6;
	UIView *page0View;
	UILabel *page0Label;
	UIImageView *page0ImageView;
}

-(void)viewWillAppear:(BOOL)animated {
	[self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
	self.navigationController.navigationBar.shadowImage = [UIImage new];
	self.navigationController.navigationBar.translucent = YES;
	self.navigationController.navigationBar.backgroundColor = [UIColor clearColor];
	self.navigationController.view.backgroundColor = [UIColor clearColor];
	self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor whiteColor],
																	NSFontAttributeName : [UIFont fontWithName:@"AvenirNext-Regular" size:22.0f]};
	self.navigationItem.title = @"Main View";
	[self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
	[self.navigationController.navigationBar setBarTintColor:[UIColor whiteColor]];
}

- (void)viewDidLoad {
	[super viewDidLoad];
	
	[_replayIntroButton setTitleTextAttributes: @{NSForegroundColorAttributeName : [UIColor whiteColor],
												  NSFontAttributeName : [UIFont fontWithName:@"AvenirNext-Regular" size:22.0f]} forState:UIControlStateNormal];
	[_replayIntroButton setTitleTextAttributes: @{NSForegroundColorAttributeName : [UIColor whiteColor],
												  NSFontAttributeName : [UIFont fontWithName:@"AvenirNext-Medium" size:22.0f]} forState:UIControlStateHighlighted];
	
	dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
		// Do background tasks like fetching and saving data and shit.
	});
	
	if ([[NSUserDefaults standardUserDefaults] boolForKey:@"ShowIntro"])
		[self loadIntroAtIndex:0];
}

-(void)loadIntroAtIndex: (NSInteger)index {
	page0View = [[UIView alloc] initWithFrame:self.view.bounds];
	page0Label = [[UILabel alloc] initWithFrame:CGRectMake(0, 40, page0View.frame.size.width, 48)];
	page0Label.text = @"Welcome to Custom Intro View.";
	page0Label.font = [UIFont fontWithName:@"AvenirNext-UltraLight" size:24.f];
	page0Label.textColor = [UIColor whiteColor];
	page0Label.textAlignment = NSTextAlignmentCenter;
	[page0View addSubview:page0Label];
	page0ImageView =  [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"apple"]];
	page0ImageView.frame = CGRectMake(0, 0, 120, 120);
	page0ImageView.center = page0View.center;
	page0ImageView.contentMode = UIViewContentModeScaleAspectFill;
	page0ImageView.clipsToBounds = YES;
	[page0View addSubview:page0ImageView];
	page0 = [EAIntroPage pageWithCustomView:page0View];
	page0.bgImage = self.backgroundImageView.image;
	
	page1 = [[EAIntroPage alloc] init];
	[page1 setTitle:@"Stark"];
	[page1 setDesc:@"\"In a world this vulnerable, we need something more powerful than any of us.\""];
	[page1 setBgImage:[UIImage imageNamed:@"IronMan.jpg"]];
	[page1 setTitleIconView:[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Icon01"]]];
	page1.onPageDidAppear = ^{
		NSLog(@"Page one is SHOWN!");
	};
	
	page2 = [[EAIntroPage alloc] init];
	[page2 setTitle:@"Rogers"];
	[page2 setDesc:@"\"I'm sick of watching people pay for our mistakes.\""];
	[page2 setBgImage:[UIImage imageNamed:@"CaptainAmerica.jpg"]];
	[page2 setTitleIconView:[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Icon02"]]];
	[page2 setTitleIconPositionY:60.f];
	
	page3 = [[EAIntroPage alloc] init];
	[page3 setTitle:@"Thor"];
	[page3 setDesc:@"\"You've meddeled with something you don't understand\""];
	[page3 setBgImage:[UIImage imageNamed:@"Thor.jpg"]];
	[page3 setTitleIconView:[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Icon03"]]];
	[page3 setTitleIconPositionY:70.f];
	
	page4 = [[EAIntroPage alloc] init];
	[page4 setTitle:@"Hulk"];
	[page4 setDesc:@"\"That's my secret Cap, I'm always angry.\""];
	[page4 setBgImage:[UIImage imageNamed:@"Hulk.jpg"]];
	[page4 setTitleIconView:[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Icon04"]]];
	[page4 setTitleIconPositionY:80.f];
	
	page5 = [[EAIntroPage alloc] init];
	[page5 setTitle:@"Ultron"];
	[page5 setDesc:@"\"I've got no strings to hold me down,\nto make me fret, or make me frown,\nI had strings, but now I'm free,\nThere are no strings on me!\""];
	[page5 setBgImage:[UIImage imageNamed:@"Ultron.jpg"]];
	[page5 setTitleIconView:[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Icon05"]]];
	[page5 setTitleIconPositionY:90.f];
	
	if (SWidth > SHeight) {
		page1.titleIconView = nil;
		page2.titleIconView = nil;
		page3.titleIconView = nil;
		page4.titleIconView = nil;
		page5.titleIconView = nil;
	}
	
	UIView *viewForPage6 = [[[NSBundle mainBundle] loadNibNamed:@"IntroViewX" owner:self options:nil] objectAtIndex:0];
	[viewForPage6 setFrame:intro.frame];
	page6 = [EAIntroPage pageWithCustomView:viewForPage6];
	[page6 setBgImage:self.backgroundImageView.image];
	
	UIButton *pssssstButton = (UIButton *)[viewForPage6 viewWithTag:1];
	pssssstButton.transform = CGAffineTransformMakeRotation(M_PI_2);
	if (pssssstButton)
		[pssssstButton addTarget:self action:@selector(psssssstAction:) forControlEvents:UIControlEventTouchUpInside];
	
	intro = [[EAIntroView alloc] initWithFrame:self.navigationController.view.bounds];
	[intro setDelegate:self];
	
	SMPageControl *pageControl = [[SMPageControl alloc] init];
	pageControl.pageIndicatorImage = [UIImage imageNamed:@"pageDot"];
	pageControl.currentPageIndicatorImage = [UIImage imageNamed:@"pageDotS"];
	[pageControl sizeToFit];
	intro.pageControl = (UIPageControl *)pageControl;
	intro.pageControlY = 20;

	UIButton *skipButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	[skipButton setFrame:CGRectMake(0, 0, 200, 44)];
	[skipButton setTitle:@"Frak This Shit!" forState:UIControlStateNormal];
	[skipButton.titleLabel setFont:[UIFont fontWithName:@"Avenir-Light" size:18.f]];
	[skipButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
	skipButton.layer.borderWidth = 0.3f;
	skipButton.layer.cornerRadius = 12.f;
	skipButton.layer.borderColor = [UIColor whiteColor].CGColor;
	intro.skipButton = skipButton;
	intro.skipButtonY = 60.f;
	intro.skipButtonAlignment = EAViewAlignmentCenter;
	
	[intro setPages:[NSArray arrayWithObjects: page0, page1, page2, page3, page4, page5, page6, nil]];
	
	[intro showInView:self.navigationController.view animateDuration:0.2 withInitialPageIndex:index];
	
	// Handle rotation frame
	[[NSNotificationCenter defaultCenter] addObserverForName:UIApplicationDidChangeStatusBarOrientationNotification object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification *note) {
		NSInteger pageIndex = intro.currentPageIndex;
		intro.frame = self.navigationController.view.frame;
		intro.bgImage = self.backgroundImageView.image;
		[intro removeFromSuperview];
		if (SWidth > SHeight) {
			page1.titleIconView = nil;
			page2.titleIconView = nil;
			page3.titleIconView = nil;
			page4.titleIconView = nil;
			page5.titleIconView = nil;
		}
		else {
			page1.titleIconView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Icon01"]];
			page2.titleIconView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Icon02"]];
			page3.titleIconView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Icon03"]];
			page4.titleIconView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Icon04"]];
			page5.titleIconView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Icon05"]];
		}
		page0View.frame = self.view.bounds;
		[page0Label setFrame:CGRectMake(5, 40, SWidth - 10, 48)];
		page0ImageView.center = page0View.center;
		[intro setPages:[NSArray arrayWithObjects: page0, page1, page2, page3, page4, page5, page6, nil]];
		[intro showInView:self.navigationController.view animateDuration:0.1 withInitialPageIndex:pageIndex];
	}];
}

-(void)introDidFinish:(EAIntroView *)introView {
	page1 = nil;
	page2 = nil;
	page3 = nil;
	page4 = nil;
	page5 = nil;
	page6 = nil;
	intro = nil;
	[intro removeFromSuperview];
	NSLog(@"Intro finished...");
}

- (IBAction)replayIntro:(id)sender {
	[UIView animateWithDuration:0.5 delay:0.0 options:UIViewAnimationOptionCurveEaseOut animations:^{
		self.view.transform = CGAffineTransformMakeScale(0.9, 0.9);
		self.view.alpha = 0.0f;
	} completion:^(BOOL finished) {
		[[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"ShowIntro"];
		[self viewDidLoad];
		[UIView animateWithDuration:0.5 delay:0.0 options:UIViewAnimationOptionCurveEaseIn animations:^{
			self.view.transform = CGAffineTransformIdentity;
			self.view.alpha = 1.0f;
		} completion:^(BOOL finished) {
		}];
	}];
}

-(IBAction)psssssstAction:(id)sender {
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"..." message:@"\"Cut off one head and two more shall take it's place.\"" delegate:self cancelButtonTitle:@"Hail Hydra!" otherButtonTitles:nil, nil];
	[alert show];
}

@end
