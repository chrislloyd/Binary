//
//  StatusMenuDelegate.m
//  Binary
//
//  Created by Chris Lloyd on 16/04/11.
//  Copyright 2011 Chris Lloyd. All rights reserved.
//

#import "StatusMenuDelegate.h"


@implementation StatusMenuDelegate

- (id)init
{
    return [super init];
}

- (void)dealloc
{
  [super dealloc];
}

- (void)menuWillOpen:(NSMenu *)menu
{
  [[menu itemAtIndex:0] setTitle:[[NSCalendarDate calendarDate] descriptionWithCalendarFormat:@"%A, %B %d, %Y"]];
}

@end
