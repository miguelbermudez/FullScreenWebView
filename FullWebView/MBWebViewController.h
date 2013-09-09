//
//  MBWebViewController.h
//  FullWebView
//
//  Created by Miguel Bermudez on 9/3/13.
//  Copyright (c) 2013 Miguel Bermudez. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <WebKit/WebKit.h>

@interface MBWebViewController : NSObject

@property (weak) IBOutlet WebView *theWebView;

- (void)reloadRequest;

@end
