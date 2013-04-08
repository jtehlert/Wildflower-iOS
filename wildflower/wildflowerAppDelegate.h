//
//  wildflowerAppDelegate.h
//  wildflower
//
//  Created by Justin Ehlert on 4/4/13.
//  Copyright (c) 2013 Justin Ehlert. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface wildflowerAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
- (void)setNetworkActivityIndicatorVisible:(BOOL)setVisible;

@end
