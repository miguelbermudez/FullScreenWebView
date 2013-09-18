//
//  MBWebViewAppDelegate.m
//  FullWebView
//
//  Created by Miguel Bermudez on 9/2/13.
//  Copyright (c) 2013 Miguel Bermudez. All rights reserved.
//

#import "MBWebViewAppDelegate.h"
#import "PreferenceController.h"

@implementation MBWebViewAppDelegate

+ (void)initialize
{
    NSMutableDictionary *defaultValues = [NSMutableDictionary dictionary];
    [defaultValues setObject:MBWebURL forKey:MBWebURLKey];
    
    //register defaults
    [[NSUserDefaults standardUserDefaults] registerDefaults:defaultValues];
    NSLog(@"registered defaults: %@", defaultValues);
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
    NSArray *args = [[NSProcessInfo processInfo] arguments];
    self.screenIndex = [args objectAtIndex:1];
}

- (IBAction)showPreferencePanel:(id)sender
{
    //is preferencecController nil?
    if (!preferenceController) {
        preferenceController = [[PreferenceController alloc] init];
    }

    NSLog(@"showing %@", preferenceController);
    [preferenceController showWindow:self];
}

@end
