//
//  Photo.h
//  SPoT
//
//  Created by Karan Shah on 10/6/13.
//  Copyright (c) 2013 Karan Shah. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Photo : NSObject

#define PHOTO_ID @"PhotoId"
#define PHOTO_TITLE @"PhotoTitle"
#define PHOTO_DESCRIPTION @"PhotoDescription"
#define PHOTO_URL @"PhotoUrl"

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *description;
@property (nonatomic, strong) NSString *photoId;
@property (nonatomic, strong) NSDictionary *dictionary;
@property (nonatomic, strong) NSURL *url;

- (NSArray *) getSortedDictionaryValues;
- (id) initFromPropertyList:(id)plist;
- (id) asPropertyList;

@end
