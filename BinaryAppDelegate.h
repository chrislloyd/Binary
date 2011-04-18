//
//  BinaryAppDelegate.h
//  Binary
//
//  Created by Chris Lloyd on 13/04/11.
//  Copyright 2011 Chris Lloyd. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <math.h>
#import "ClockModel.h"
#import "ClockView.h"

@interface BinaryAppDelegate : NSObject <NSApplicationDelegate> {
  NSMenu *menu;
  
  NSStatusItem *statusItem;
  ClockModel *clock;
  ClockView *view;
  
  NSTimer *timer;
}

@property (assign, readonly) IBOutlet NSMenu *menu;

- (void)tick:(NSTimer *)interval;

@end
