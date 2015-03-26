//
//  EAIntroPage.m
//
//  Copyright (c) 2013-2015 Evgeny Aleksandrov. License: MIT.

#import "EAIntroPage.h"

#define DEFAULT_DESCRIPTION_LABEL_SIDE_PADDING 20
#define DEFAULT_TITLE_FONT [UIFont fontWithName:@"AvenirNext-Regular" size:40.f]
#define DEFAULT_LABEL_COLOR [UIColor whiteColor]
#define DEFAULT_BG_COLOR [UIColor clearColor]
#define DEFAULT_DESCRIPTION_FONT [UIFont fontWithName:@"Avenir-Light" size:22.f]
#define DEFAULT_DESCRIPTION [NSString stringWithFormat:@"Dici che il fiume\nTrova la via al mare\nE come il fiume\nGiungerai a me\nOltre i confini\nE le terre assetate\nDici che come fiume"]
#define DEFAULT_TITLE_IMAGE_Y_POSITION 50.0f
#define DEFAULT_TITLE_LABEL_Y_POSITION 260.0f
#define DEFAULT_DESCRIPTION_LABEL_Y_POSITION 200.0f

@interface EAIntroPage ()
@property(nonatomic, strong, readwrite) UIView *pageView;
@end

@implementation EAIntroPage

#pragma mark - Page lifecycle

- (instancetype)init {
    if (self = [super init]) {
        _titleIconPositionY = DEFAULT_TITLE_IMAGE_Y_POSITION;
        _titlePositionY  = DEFAULT_TITLE_LABEL_Y_POSITION;
        _descPositionY   = DEFAULT_DESCRIPTION_LABEL_Y_POSITION;
        _title = @"";
        _titleFont = DEFAULT_TITLE_FONT;
        _titleColor = DEFAULT_LABEL_COLOR;
        _desc = DEFAULT_DESCRIPTION;
        _descFont = DEFAULT_DESCRIPTION_FONT;
        _descColor = DEFAULT_LABEL_COLOR;
        _bgColor = DEFAULT_BG_COLOR;
        _showTitleView = YES;
        _alpha = 1.f;
    }
    return self;
}

+ (instancetype)page {
    return [[self alloc] init];
}

+ (instancetype)pageWithCustomView:(UIView *)customV {
    EAIntroPage *newPage = [[self alloc] init];
    newPage.customView = customV;
    return newPage;
}

+ (instancetype)pageWithCustomViewFromNibNamed:(NSString *)nibName {
    return [self pageWithCustomViewFromNibNamed:nibName bundle:[NSBundle mainBundle]];
}

+ (instancetype)pageWithCustomViewFromNibNamed:(NSString *)nibName bundle:(NSBundle*)aBundle {
    EAIntroPage *newPage = [[self alloc] init];
    newPage.customView = [[aBundle loadNibNamed:nibName owner:newPage options:nil] firstObject];
    return newPage;
}

@end
