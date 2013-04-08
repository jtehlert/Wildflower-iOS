//
//  Info.h
//  wildflower
//
//  Created by Justin Ehlert on 4/8/13.
//  Copyright (c) 2013 Justin Ehlert. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Info : NSObject {
    NSString *title, *description;
}

-(id) init;
-(id) initWithTitle:(NSString *)titleGiven
              andDescription:(NSString *)descriptionGiven;

- (NSString *) getTitle;
- (NSString *) getDescription;


@end
