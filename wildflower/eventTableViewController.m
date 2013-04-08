//
//  eventTableViewController.m
//  wildflower
//
//  Created by Justin Ehlert on 4/5/13.
//  Copyright (c) 2013 Justin Ehlert. All rights reserved.
//

#import "eventTableViewController.h"

@interface eventTableViewController ()

@end

@implementation eventTableViewController {
    NSMutableArray *friday, *saturday, *sunday;
    NSData *jsonData;
    Event *event;
    int loaded;
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    loaded = 0;
    
    //[[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];

    NSLog(@"Events - Load");
    
    if([self connected]) {
        if(loaded == 0) {
            //[[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
            loaded = 1;
        }
        [self gatherData];
    } else {
        [self internetAlert];
    }
}

- (void) viewDidAppear:(BOOL)animated {
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(section == 0) return [friday count];
    else if(section == 1) return [saturday count];
    else if(section == 2) return [sunday count];
    else return 0;

}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    //For each section, you must return here it's label
    if(section == 0) return @"Friday";
    else if(section == 1) return @"Saturday";
    else if(section == 2) return @"Sunday";
    else return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"eventCell";
    
    UITableViewCell *cell = [_eventTableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    if(indexPath.section == 0) {
        cell.textLabel.text = [[friday objectAtIndex:indexPath.row]getTitle];
        NSMutableString *subtitle = [NSMutableString stringWithCapacity:45];
        [subtitle appendString:[[friday objectAtIndex:indexPath.row]getStart]];
        [subtitle appendString:@" - "];
        [subtitle appendString: [[friday objectAtIndex:indexPath.row]getStage]];
        cell.detailTextLabel.text = subtitle;
    } else if(indexPath.section == 1) {
        cell.textLabel.text = [[saturday objectAtIndex:indexPath.row]getTitle];
        NSMutableString *subtitle = [NSMutableString stringWithCapacity:45];
        [subtitle setString:[[saturday objectAtIndex:indexPath.row]getStart]];
        [subtitle appendString:@" - "];
        [subtitle appendString: [[saturday objectAtIndex:indexPath.row]getStage]];
        cell.detailTextLabel.text = subtitle;
    } else if(indexPath.section == 2) {
        cell.textLabel.text = [[sunday objectAtIndex:indexPath.row]getTitle];
        NSMutableString *subtitle = [NSMutableString stringWithCapacity:45];
        [subtitle appendString:[[sunday objectAtIndex:indexPath.row]getStart]];
        [subtitle appendString:@" - "];
        [subtitle appendString: [[sunday objectAtIndex:indexPath.row]getStage]];
        cell.detailTextLabel.text = subtitle;
    }
    
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

-(void) gatherData {
    
    NSLog(@"Gather Data");
    
    [wildflowerAppDelegate setNetworkActivityIndicatorVisible:YES];
    
    [AFJSONRequestOperation addAcceptableContentTypes:[NSSet setWithObject:@"text/html"]];
    NSURL *url = [NSURL URLWithString:@"http://jtehlert.com/json.php"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    friday = [[NSMutableArray alloc] initWithCapacity:0];
    saturday = [[NSMutableArray alloc] initWithCapacity:0];
    sunday = [[NSMutableArray alloc] initWithCapacity:0];
    
    AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
        NSLog(@"Got");
        NSArray *keys = [JSON objectForKey:@"events"];
        
        for (NSString *key in keys) {
            NSString *array = key;
            event = [[Event alloc] initWithTitle:[array valueForKey:@"title"] andid:[array valueForKey:@"eventID"] andDate:[array valueForKey:@"eventDate"] andCategory:[array valueForKey:@"eventcategory"] andStart:[array valueForKey:@"starttime"] andEnd:[array valueForKey:@"endtime"] andPicture:[array valueForKey:@"bandPic"] andStage:[array valueForKey:@"stage"] andAudio:[array valueForKey:@"audoLink"] andLink:[array valueForKey:@"bandLink"]];
            
            if([[array valueForKey:@"eventDate"] isEqualToString:@"05/17/2013"]) {
                [friday addObject:event];
            } else if([[array valueForKey:@"eventDate"] isEqualToString:@"05/18/2013"]) {
                [saturday addObject:event];
            } else if([[array valueForKey:@"eventDate"] isEqualToString:@"05/19/2013"]) {
                [sunday addObject:event];
            }
            
            [_eventTableView reloadData];         
        }
    } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON) {
        NSLog(@"Request Failure Because %@",[error userInfo]); 
    }];
    
    [operation start];
    
}

- (BOOL)connected
{
    Reachability *reachability = [Reachability reachabilityForInternetConnection];
    NetworkStatus networkStatus = [reachability currentReachabilityStatus];
    return !(networkStatus == NotReachable);
}

- (void)internetAlert {
    UIAlertView *alertView = [[UIAlertView alloc]
                              initWithTitle:@"No Internet Connection"
                              message:@"Press the Refresh Button to Try Again"
                              delegate:self
                              cancelButtonTitle:@"OK"
                              otherButtonTitles:nil];
    [alertView show];
}

@end
