//
//  Event.h
//  wildflower
//
//  Created by Justin Ehlert on 4/7/13.
//  Copyright (c) 2013 Justin Ehlert. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Event : NSObject {
    NSString *title, *eventID, *eventDate, *eventCategory, *starttime, *endtime, *bandpic, *stage, *audioLink, *bandLink;
}

-(id) init;
-(id) initWithTitle:(NSString *)titleGiven
         andid:(NSString *)idGiven
        andDate:(NSString *)dateGiven
      andCategory:(NSString *)categoryGiven
       andStart:(NSString *)startGiven
         andEnd:(NSString *)endGiven
       andPicture:(NSString *)picGiven
       andStage:(NSString *)stageGiven
       andAudio:(NSString *)audioGiven
         andLink:(NSString *)linkGiven;

- (NSString *) getTitle;
- (NSString *) getID;
- (NSString *) getDate;
- (NSString *) getCategory;
- (NSString *) getStart;
- (NSString *) getEnd;
- (NSString *) getPic;
- (NSString *) getStage;
- (NSString *) getAudio;
- (NSString *) getLink;


@end
