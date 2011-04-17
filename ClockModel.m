//
//  BinaryClockModel.m
//  Binary
//
//  Created by Chris Lloyd on 16/04/11.
//  Copyright 2011 Chris Lloyd. All rights reserved.
//

#import <math.h>
#import "ClockModel.h"

@implementation ClockModel

@synthesize date;

- (id)init
{
  self = [super init];
  if (self) {
    date = [NSDate date];
    [date retain];
    
    calendar = [NSCalendar currentCalendar];
    [calendar retain];
  }
    
  return self;
}

- (void)dealloc
{
  [calendar release];
  [date release];
  [super dealloc];
}

+ (NSInteger)digitAtPos:(NSInteger)number pos:(unsigned int)pos
{
  return fmod(number / pow(10, pos), 10);
}

+ (BOOL)bitAtPos:(NSInteger)number pos:(unsigned int)pos
{
  return (BOOL)number & (1 << pos);
}

- (NSInteger)hours
{
  components = [calendar components:(NSHourCalendarUnit | NSMinuteCalendarUnit)
                           fromDate:[self date]];
  return [components hour];
}

- (NSInteger)minutes
{
  components = [calendar components:(NSHourCalendarUnit | NSMinuteCalendarUnit)
                           fromDate:date];
  return [components minute];
}

@end
