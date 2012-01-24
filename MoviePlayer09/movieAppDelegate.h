//
//  movieAppDelegate.h
//  MoviePlayer09
//
//  Created by 泰治 宮部 on 12/01/24.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class movieViewController;

@interface movieAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) movieViewController *viewController;

@end
