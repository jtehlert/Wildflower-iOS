//
//  Info.m
//  wildflower
//
//  Created by Justin Ehlert on 4/8/13.
//  Copyright (c) 2013 Justin Ehlert. All rights reserved.
//

#import "Info.h"

@implementation Info

- (id)init {
    self = [super init];
    
    if(self) {
        title = @"";
        description = @"";
    }
    
    return self;
}

-(id) initWithTitle:(NSString *)titleGiven
              andDescription:(NSString *)descriptionGiven {
    
    self = [super init];
    
    if(self) {
        title = titleGiven;
        description = descriptionGiven;
    }
    
    return self;
}

- (NSString *) getTitle { return title; }
- (NSString *) getDescription { return description; }

@end
