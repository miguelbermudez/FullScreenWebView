//
//  MBWebViewController.m
//  FullWebView
//
//  Created by Miguel Bermudez on 9/3/13.
//  Copyright (c) 2013 Miguel Bermudez. All rights reserved.
//

#import "MBWebViewController.h"
#import "PreferenceController.h"

@implementation MBWebViewController

- (void) awakeFromNib {
    
    /* load our main webpage.  You'll notice that in that file we
     load all of our images using the 'special':// scheme (which
     generates the image files on the fly in memory).  */
    
    // Load hardcoded URL
	//[[_theWebView mainFrame] loadRequest:[NSURLRequest requestWithURL: [NSURL URLWithString:WEBURL]]];
    //[_theWebView setMainFrameURL:@"www.yahoo.com"];
    
    // Load URL from Preferences
    //Register obbserver
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(preferenceWindowClosing:)
                                                 name:NSWindowWillCloseNotification
                                               object:nil];
    
    [self reloadRequest];
}

- (void)reloadRequest
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *_url = [defaults objectForKey:MBWebURLKey];
	[[_theWebView mainFrame] loadRequest:[NSURLRequest requestWithURL: [NSURL URLWithString:_url]]];
}

//loadRequest from URL in Preferences when its closed
- (void)preferenceWindowClosing:(NSNotification *)aNotification
{
    [self reloadRequest];
}

@end
