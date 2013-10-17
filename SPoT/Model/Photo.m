//
//  Photo.m
//  SPoT
//
//  Created by Karan Shah on 10/6/13.
//  Copyright (c) 2013 Karan Shah. All rights reserved.
//

#import "Photo.h"

@implementation Photo

@synthesize title = _title;
@synthesize description = _description;
@synthesize photoId = _photoId;
@synthesize dictionary = _dictionary;
@synthesize url = _url;

- (NSArray *) getSortedDictionaryValues {
    NSArray *sortedValues = [NSArray array];
    if(self.dictionary) {
        NSMutableArray *unsortedValues = [[NSMutableArray alloc] initWithArray:[self.dictionary allValues]];
        NSSortDescriptor *descriptors = [[NSSortDescriptor alloc] initWithKey:@"title" ascending:YES];
        sortedValues = [unsortedValues sortedArrayUsingDescriptors:@[descriptors]];
    }
    return sortedValues;
}

- (id) initFromPropertyList:(id)plist
{
    self = [self init];
    if (self) {
        if ([plist isKindOfClass:[NSDictionary class]]) {
            NSDictionary *resultDictionary = (NSDictionary *)plist;
            _photoId = resultDictionary[PHOTO_ID];
            _title = resultDictionary[PHOTO_TITLE];
            _description = resultDictionary[PHOTO_DESCRIPTION];
            NSString *urlStr = resultDictionary[PHOTO_URL];
            _url = [[NSURL alloc] initWithString:urlStr];
            if (!_photoId || !_title || !_url) self = nil;
        }
    }
    return self;
}

- (id) asPropertyList {
    return @{PHOTO_ID: self.photoId, PHOTO_TITLE: self.title, PHOTO_DESCRIPTION: self.description, PHOTO_URL: [self.url absoluteString]};
}

@end
