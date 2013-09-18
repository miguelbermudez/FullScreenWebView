//
//  PreferenceController.m
//  FullWebView
//
//  Created by Miguel Bermudez on 9/6/13.
//  Copyright (c) 2013 Miguel Bermudez. All rights reserved.
//

#import "PreferenceController.h"

NSString *const MBWebURLKey = @"URL";
NSString *const MBWebURL = @"http://www.yahoo.com";
NSString *const MBUrlChangedNotification = @"MBURLChanged";

@interface PreferenceController ()

@end

@implementation PreferenceController

- (id)init
{
    self = [super initWithWindowNibName:@"Preferences"];
    
    return self;
}

- (id)initWithWindow:(NSWindow *)window
{
    self = [super initWithWindow:window];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

- (void)windowDidLoad
{
    [super windowDidLoad];
    
    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
    [urlField setStringValue:[PreferenceController  url]];
}

- (void)changeURL
{
    NSString *_url = [urlField stringValue];
    [PreferenceController setUrl:_url];
    NSLog(@"URL changed to %@", _url);
}

+ (NSString *)url
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    return [defaults objectForKey:MBWebURLKey];
}

+ (void)setUrl:(NSString *)aURL
{
    [[NSUserDefaults standardUserDefaults] setObject:aURL forKey:MBWebURLKey];
}

- (void)windowWillClose:(NSNotification *)notification
{
    [self changeURL];
//    [[NSNotificationCenter defaultCenter] postNotification:notification];
    [[NSNotificationCenter defaultCenter] postNotificationName:MBUrlChangedNotification object:self];
}

@end
