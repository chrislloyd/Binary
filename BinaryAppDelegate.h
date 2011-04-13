//
//  BinaryAppDelegate.h
//  Binary
//
//  Created by Chris Lloyd on 13/04/11.
//  Copyright 2011 Chris Lloyd. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface BinaryAppDelegate : NSObject <NSApplicationDelegate> {
@private
  NSWindow *window;
}

@property (assign) IBOutlet NSWindow *window;

@end
