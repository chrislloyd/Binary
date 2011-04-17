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

- (id)initWithFrame:(NSRect)frame
{
    return [super initWithFrame:frame];
}

- (void)dealloc
{
    [super dealloc];
}

- (void)drawRect:(NSRect)dirtyRect
{
  int i=4;
  
  NSInteger hr1 = [ClockModel digitAtPos:[model hours] pos:1];
  
  for (i=3; i>-1; i--) {
    
    if([ClockModel bitAtPos:hr1 pos:i]) {
      [[NSColor blackColor] set];
    }
    else
    {
      [[NSColor lightGrayColor] set];
    }
    
    NSRect dot = NSMakeRect(1, 20-(4*(4- i)), 3, 3);
    [[NSBezierPath bezierPathWithOvalInRect:dot] fill];
  }
  
  // blarrr
  
  NSInteger hr2 = [ClockModel digitAtPos:[model hours] pos:0];
  
  for (i=3; i>-1; i--) {
    
    if([ClockModel bitAtPos:hr2 pos:i]) {
      [[NSColor blackColor] set];
    }
    else
    {
      [[NSColor lightGrayColor] set];
    }
    
    NSRect dot = NSMakeRect(5, 20-(4*(4- i)), 3, 3);
    [[NSBezierPath bezierPathWithOvalInRect:dot] fill];
  }
  
  
  NSInteger min1 = [ClockModel digitAtPos:[model minutes] pos:1];
  
  for (i=3; i>-1; i--) {
    
    if([ClockModel bitAtPos:min1 pos:i]) {
      [[NSColor blackColor] set];
    }
    else
    {
      [[NSColor lightGrayColor] set];
    }
    
    NSRect dot = NSMakeRect(11, 20-(4*(4- i)), 3, 3);
    [[NSBezierPath bezierPathWithOvalInRect:dot] fill];
  }
  
  
  NSInteger min0 = [ClockModel digitAtPos:[model minutes] pos:0];
  
  for (i=3; i>-1; i--) {
    
    if([ClockModel bitAtPos:min0 pos:i]) {
      [[NSColor blackColor] set];
    }
    else
    {
      [[NSColor lightGrayColor] set];
    }
    
    NSRect dot = NSMakeRect(15, 20-(4*(4- i)), 3, 3);
    [[NSBezierPath bezierPathWithOvalInRect:dot] fill];
  }
}

- (BOOL)acceptsFirstMouse:(NSEvent *)theEvent
{
  return TRUE;
}

@end
