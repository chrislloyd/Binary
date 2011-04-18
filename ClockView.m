//
//  ClockView.m
//  Binary
//
//  Created by Chris Lloyd on 16/04/11.
//  Copyright 2011 Chris Lloyd. All rights reserved.
//

#import "ClockView.h"


@implementation ClockView

@synthesize model;
@synthesize statusItem;

- (id)initWithFrame:(NSRect)frame {
  self = [super initWithFrame:frame];
  if (self) {
    statusItem = nil;
    isMenuVisible = NO;
  }
  return self;
}

- (void)dealloc {
  [statusItem release];
  [super dealloc];
}

- (void)mouseDown:(NSEvent *)event {
  [[statusItem menu] setDelegate:self];
  [statusItem popUpStatusItemMenu:[statusItem menu]];
}

// Delegate right-click to left-click
- (void)rightMouseDown:(NSEvent *)event {
  [self mouseDown:event];
}

- (void)menuWillOpen:(NSMenu *)menu
{
  [[menu itemAtIndex:0] setTitle:[[NSCalendarDate calendarDate] descriptionWithCalendarFormat:@"%A, %B %d, %Y"]];
  
  isMenuVisible = YES;

  [self setNeedsDisplay:YES];
}

- (void)menuDidClose:(NSMenu *)menu
{
  isMenuVisible = NO;
  [[statusItem menu] setDelegate:nil];
  [self setNeedsDisplay:YES];
}

- (NSColor *)foregroundColor
{
  if(isMenuVisible) {
    return [NSColor whiteColor];
  } else {
    return [NSColor blackColor];
  }
}


- (void)drawRect:(NSRect)dirtyRect
{
  int i;
  BOOL drawn = NO;
  
  [statusItem drawStatusBarBackgroundInRect:[self bounds]
                              withHighlight:isMenuVisible];
  
  NSInteger hr1 = [ClockModel digitAtPos:[model hours] pos:1];
  
  for (i=3; i>=0; i--) {
    if([ClockModel bitAtPos:hr1 pos:i]) {
      [[self foregroundColor] set];
      drawn = YES;
    }
    else
    {
      [[NSColor lightGrayColor] set];
    }
    
    if(drawn == YES || i == 0) {
      NSRect dot = NSMakeRect(1, 20-(4*(4- i)), 3, 3);
      [[NSBezierPath bezierPathWithOvalInRect:dot] fill];
    }
  }
  
  // blarrr
  
  drawn = NO;
  NSInteger hr2 = [ClockModel digitAtPos:[model hours] pos:0];
  
  for (i=3; i>=0; i--) {
    
    if([ClockModel bitAtPos:hr2 pos:i]) {
      [[self foregroundColor] set];
      drawn = YES;
    }
    else
    {
      [[NSColor lightGrayColor] set];
    }
    
    if(drawn == YES || i == 0) {
      NSRect dot = NSMakeRect(5, 20-(4*(4- i)), 3, 3);
      [[NSBezierPath bezierPathWithOvalInRect:dot] fill];
    }
  }
  
  drawn = NO;
  NSInteger min1 = [ClockModel digitAtPos:[model minutes] pos:1];
  
  for (i=3; i>=0; i--) {
    
    if([ClockModel bitAtPos:min1 pos:i]) {
      [[self foregroundColor] set];
      drawn = YES;
    }
    else
    {
      [[NSColor lightGrayColor] set];
    }
    
    if(drawn == YES || i == 0) {
      NSRect dot = NSMakeRect(11, 20-(4*(4- i)), 3, 3);
      [[NSBezierPath bezierPathWithOvalInRect:dot] fill];
    }
  }
  
  drawn = NO;
  NSInteger min0 = [ClockModel digitAtPos:[model minutes] pos:0];
  
  for (i=3; i>=0; i--) {
    
    if([ClockModel bitAtPos:min0 pos:i]) {
      [[self foregroundColor] set];
      drawn = YES;
    }
    else
    {
      [[NSColor lightGrayColor] set];
    }
    
    if(drawn == YES || i == 0) {
      NSRect dot = NSMakeRect(15, 20-(4*(4- i)), 3, 3);
      [[NSBezierPath bezierPathWithOvalInRect:dot] fill];
    }
  }
}

- (void)drawDot:(NSRect)rect
{
  [[NSBezierPath bezierPathWithOvalInRect:rect] fill];
}

@end
