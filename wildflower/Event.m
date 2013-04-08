//
//  Event.m
//  wildflower
//
//  Created by Justin Ehlert on 4/7/13.
//  Copyright (c) 2013 Justin Ehlert. All rights reserved.
//

#import "Event.h"

@implementation Event

- (id)init {
    self = [super init];
    
    if(self) {
        title = @"";
        eventID = @"";
        eventDate = @"";
        eventCategory = @"";
        starttime = @"";
        endtime = @"";
        bandpic = @"";
        stage = @"";
        audioLink = @"";
        bandLink = @"";
    }
    
    return self;
}

-(id) initWithTitle:(NSString *)titleGiven
              andid:(NSString *)idGiven
            andDate:(NSString *)dateGiven
        andCategory:(NSString *)categoryGiven
           andStart:(NSString *)startGiven
             andEnd:(NSString *)endGiven
         andPicture:(NSString *)picGiven
           andStage:(NSString *)stageGiven
           andAudio:(NSString *)audioGiven
            andLink:(NSString *)linkGiven {
    
    self = [super init];
    
    if(self) {
        title = titleGiven;
        eventID = idGiven;
        eventDate = dateGiven;
        eventCategory = categoryGiven;
        starttime = startGiven;
        endtime = endGiven;
        bandpic = picGiven;
        stage = stageGiven;
        audioLink = audioGiven;
        bandLink = linkGiven;
    }
    
    return self;
}

- (NSString *) getTitle { return title; }
- (NSString *) getID { return eventID; }
- (NSString *) getDate { return eventDate; }
- (NSString *) getCategory { return eventCategory; }
- (NSString *) getStart { return starttime; }
- (NSString *) getEnd { return endtime; }
- (NSString *) getPic { return bandpic; }
- (NSString *) getStage { return stage; }
- (NSString *) getAudio { return audioLink; }
- (NSString *) getLink { return bandLink; }


@end
