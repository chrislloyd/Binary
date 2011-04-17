//
//  BinaryClockModel.h
//  Binary
//
//  Created by Chris Lloyd on 16/04/11.
//  Copyright 2011 Chris Lloyd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ClockModel : NSObject {
  NSDate *date;
  NSCalendar *calendar;
  
  NSDateComponents *components;
}

@property (retain) NSDate *date;

// Returns -1 in error
+ (NSInteger)digitAtPos:(NSInteger)number pos:(unsigned int)pos;
+ (BOOL)bitAtPos:(NSInteger)number pos:(unsigned int)pos;

- (NSInteger)hours;
- (NSInteger)minutes;

@end
