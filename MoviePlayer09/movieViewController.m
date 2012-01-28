//
//  movieViewController.m
//  MoviePlayer09
//
//  Created by 泰治 宮部 on 12/01/24.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "movieViewController.h"
#import <Foundation/Foundation.h>

@implementation movieViewController
@synthesize moviePlayer;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

-(void)decode:(NSString*)ifilepath :(NSString*)ofilepath
{
    NSData *idat = [NSData dataWithContentsOfFile:ifilepath];
    NSData *odat= [NSData alloc];  
    NSUInteger size;

    size = [idat length];
    unsigned char ibuff[size];
    unsigned char obuff[size];

    [idat getBytes:ibuff];
    for (int i = 0; i < size; i++) {
        obuff[i] = (ibuff[i] >> 2) | (ibuff[i] << 6);
    }
    
    [odat initWithBytes:obuff length:size];
    [odat writeToFile:ofilepath atomically:YES];
}

-(void)playMovie
{
    NSString *ifilepath = [NSString stringWithFormat:@"%@/Documents/%@", NSHomeDirectory(), @"testi.mp4"];
    NSString *ofilepath = [NSString stringWithFormat:@"%@/tmp/%@", NSHomeDirectory(), @"testo.mp4"];
    NSLog(@"ifilepath=%@", ifilepath);
    NSLog(@"ofilepath=%@", ofilepath);

    [self decode:ifilepath :ofilepath];
    
    //NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle] 
    //                                     pathForResource:@"testo" ofType:@"mp4"]];
    NSURL *url = [NSURL fileURLWithPath:ofilepath];
    
    moviePlayer =  [[MPMoviePlayerController alloc]
                    initWithContentURL:url];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(moviePlayBackDidFinish:)
                                                 name:MPMoviePlayerPlaybackDidFinishNotification
                                               object:moviePlayer];
    
    moviePlayer.controlStyle = MPMovieControlStyleDefault;
    moviePlayer.shouldAutoplay = YES;
    [self.view addSubview:moviePlayer.view];
    [moviePlayer setFullscreen:YES animated:YES];
}

- (void) moviePlayBackDidFinish:(NSNotification*)notification {
    MPMoviePlayerController *player = [notification object];
    [[NSNotificationCenter defaultCenter] 
     removeObserver:self
     name:MPMoviePlayerPlaybackDidFinishNotification
     object:player];
    
    if ([player
         respondsToSelector:@selector(setFullscreen:animated:)])
    {
        [player.view removeFromSuperview];
    }
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
