//
//  MBWebViewAppDelegate.h
//  FullWebView
//
//  Created by Miguel Bermudez on 9/2/13.
//  Copyright (c) 2013 Miguel Bermudez. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <WebKit/WebKit.h>

@class PreferenceController;

@interface MBWebViewAppDelegate : NSObject <NSApplicationDelegate>
{
    PreferenceController *preferenceController;
}

@property (assign) IBOutlet NSWindow *window;
@property (assign) NSString *screenIndex;

- (IBAction)showPreferencePanel:(id)sender;

@end
