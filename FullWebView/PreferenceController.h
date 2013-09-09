//
//  PreferenceController.h
//  FullWebView
//
//  Created by Miguel Bermudez on 9/6/13.
//  Copyright (c) 2013 Miguel Bermudez. All rights reserved.
//

#import <Cocoa/Cocoa.h>

extern NSString *const MBWebURLKey;
extern NSString *const MBWebURL;

@interface PreferenceController : NSWindowController <NSWindowDelegate>
{
    IBOutlet NSTextField *urlField;
}

- (void)changeURL;

+ (NSString *)url;
+ (void)setUrl:(NSString *)aURL;


@end
