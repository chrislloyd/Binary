//
//  ClockView.h
//  Binary
//
//  Created by Chris Lloyd on 16/04/11.
//  Copyright 2011 Chris Lloyd. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "ClockModel.h"

@interface ClockView : NSView<NSMenuDelegate> {
  ClockModel *model;
  NSStatusItem *statusItem;
  
  BOOL isMenuVisible;
}

@property (retain, nonatomic) ClockModel *model;
@property (retain, nonatomic) NSStatusItem *statusItem;


- (void)drawDot:(NSRect)rect;
- (NSColor *)foregroundColor;

@end
