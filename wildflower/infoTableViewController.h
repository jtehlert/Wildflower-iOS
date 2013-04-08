//
//  infoTableViewController.h
//  wildflower
//
//  Created by Justin Ehlert on 4/8/13.
//  Copyright (c) 2013 Justin Ehlert. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Reachability.h"
#import <SystemConfiguration/SystemConfiguration.h>
#import "Event.h"
#import "wildflowerAppDelegate.h"
#import "AFNetworking.h"

@interface infoTableViewController : UITableViewController

@property (nonatomic, strong) IBOutlet UITableView *infoTableView;
- (BOOL)connected;

@end
