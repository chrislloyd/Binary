//
//  ClockView.h
//  Binary
//
//  Created by Chris Lloyd on 16/04/11.
//  Copyright 2011 Chris Lloyd. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "ClockModel.h"

@interface ClockView : NSView {
  ClockModel *model;
}

@property (retain) ClockModel *model;

@end
