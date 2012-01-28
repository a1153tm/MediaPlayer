//
//  movieViewController.h
//  MoviePlayer09
//
//  Created by 泰治 宮部 on 12/01/24.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>

@interface movieViewController : UIViewController {
    MPMoviePlayerController *moviePlayer;
}
@property (strong, nonatomic) MPMoviePlayerController *moviePlayer;
-(IBAction) playMovie;
-(void)decode:(NSString*)ifilepath:(NSString*)ofilepath;
@end
