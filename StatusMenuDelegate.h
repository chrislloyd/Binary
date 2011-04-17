//
//  StatusMenuDelegate.h
//  Binary
//
//  Created by Chris Lloyd on 16/04/11.
//  Copyright 2011 Chris Lloyd. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface StatusMenuDelegate : NSObject <NSMenuDelegate> {
}

- (void)menuWillOpen:(NSMenu *)menu;

@end
