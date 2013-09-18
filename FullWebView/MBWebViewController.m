//
//  MBWebViewController.m
//  FullWebView
//
//  Created by Miguel Bermudez on 9/3/13.
//  Copyright (c) 2013 Miguel Bermudez. All rights reserved.
//

#import "MBWebViewController.h"
#import "MBWebViewAppDelegate.h"
#import "PreferenceController.h"

@implementation MBWebViewController

- (void) awakeFromNib {
    
    /* load our main webpage.  You'll notice that in that file we
     load all of our images using the 'special':// scheme (which
     generates the image files on the fly in memory).  */
    
    //Register observer
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(reloadRequest:)
                                                 name:MBUrlChangedNotification
                                               object:nil];
    
    //Register observer for AppDelegates didFinishLaunching
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(reloadRequest:)
                                                 name:NSApplicationDidFinishLaunchingNotification
                                               object:nil];
    
    //[self reloadRequest];
}

- (void)reloadRequest:(NSNotification *)aNotification
{
    MBWebViewAppDelegate *appDelegate = [[NSApplication sharedApplication] delegate];
    NSString *screenIndex = appDelegate.screenIndex;
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSURL *reloadURL;
 
    if ([[aNotification name] isEqualTo:NSApplicationDidFinishLaunchingNotification]) {
        //create a nsurl
        NSURL *url = [NSURL URLWithString:[defaults objectForKey:MBWebURLKey]];
        
        //if url doesn't have a query...
        if (![url query]) {
            NSString *queryParams = [NSString stringWithFormat:@"sidx=%@", screenIndex];
            reloadURL = [self createURLWithQuery:url queryParam:queryParams];
            
        //url does have query
        } else {
            //get current query params
            NSString *currentQueryParams = [url query];
            
            //make sure we're not duplicated params
            if([currentQueryParams rangeOfString:@"sidx"].location == NSNotFound) {
                //add new query params to current
                currentQueryParams = [currentQueryParams stringByAppendingFormat:@"&sidx=%@", appDelegate.screenIndex];
            }
            
            reloadURL = [self createURLWithQuery:url queryParam:currentQueryParams];
        }
    }
    
    if ([[aNotification name] isEqualTo:MBUrlChangedNotification]) {
        reloadURL = [NSURL URLWithString:[defaults objectForKey:MBWebURLKey]];
    }
    
    //save new url in defaults
    [defaults setObject:[reloadURL absoluteString] forKey:MBWebURLKey];
        
    //do reload request
	[[_theWebView mainFrame] loadRequest:[NSURLRequest requestWithURL: [NSURL URLWithString:[reloadURL absoluteString]]]];
}

- (NSURL *)createURLWithQuery:(NSURL *)aUrl queryParam:(NSString *)strQueryParam
{
    NSString *urlPort = [[aUrl port] stringValue];
    NSString *baseUrl;
    // do we have a port in the url?
    if (urlPort) {
        baseUrl = [NSString stringWithFormat:@"%@://%@:%@?%@", [aUrl scheme], [aUrl host], [aUrl port], strQueryParam];
    } else {
        baseUrl = [NSString stringWithFormat:@"%@://%@?%@", [aUrl scheme], [aUrl host], strQueryParam];
    }
    return [NSURL URLWithString:baseUrl];
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
