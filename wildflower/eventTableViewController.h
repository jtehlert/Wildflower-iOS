//
//  eventTableViewController.h
//  wildflower
//
//  Created by Justin Ehlert on 4/5/13.
//  Copyright (c) 2013 Justin Ehlert. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Reachability.h"
#import <SystemConfiguration/SystemConfiguration.h>
#import "Event.h"
#import "wildflowerAppDelegate.h"
#import "AFNetworking.h"

#define wildflowerAppDelegate (wildflowerAppDelegate *) [[UIApplication sharedApplication] delegate]

@interface eventTableViewController : UITableViewController

@property (nonatomic, strong) IBOutlet UITableView *eventTableView;
- (BOOL)connected;

@end
