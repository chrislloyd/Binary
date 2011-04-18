//
//  BinaryAppDelegate.m
//  Binary
//
//  Created by Chris Lloyd on 13/04/11.
//  Copyright 2011 Chris Lloyd. All rights reserved.
//

#import "BinaryAppDelegate.h"

@implementation BinaryAppDelegate

@synthesize menu;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
  clock = [[ClockModel alloc] init];
  [clock retain];
    
  /* Activates the status menu icon */
  NSStatusBar *statusBar = [NSStatusBar systemStatusBar];
  
  statusItem = [statusBar statusItemWithLength:NSVariableStatusItemLength];
  [statusItem retain];
  
  [statusItem setHighlightMode:YES];
  [statusItem setMenu:[self menu]];
  
  /* Initializes the binary clock view */
  NSRect frame = NSMakeRect(0, 0, 22, [statusBar thickness]);
  view = [[ClockView alloc] initWithFrame:frame];
  [view retain];
  
  /* Hook up shit */
  [view setModel:clock];
  [view setStatusItem:statusItem];
  
  [statusItem setView:view];
  
  timer = [NSTimer scheduledTimerWithTimeInterval:1
                                           target:self
                                         selector:@selector(tick:)
                                         userInfo:nil
                                          repeats:YES];
}

- (void)tick:(NSTimer *)interval
{
  [clock setDate:[NSDate date]];
  [view setNeedsDisplay:YES];
}

- (void)applicationWillTerminate:(NSNotification *)notification
{
  [timer invalidate];
  
  [view release];
  [statusItem release];
  [clock release];
}

@end
