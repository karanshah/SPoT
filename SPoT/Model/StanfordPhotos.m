//
//  StanfordPhotos.m
//  SPoT
//
//  Created by Karan Shah on 10/1/13.
//  Copyright (c) 2013 Karan Shah. All rights reserved.
//

#import "StanfordPhotos.h"
#import "FlickrFetcher.h"
#import "Photo.h"

@implementation StanfordPhotos

@synthesize spotArray = _spotArray;

- (id)init {
    if (self) {
        self = [super init];
        [self addDataToSpotArray];
    }
    return self;
}

- (void) addDataToSpotArray {
    NSMutableDictionary *spotDictionary = [[NSMutableDictionary alloc] init];
    for (NSMutableDictionary *photoArray in [FlickrFetcher stanfordPhotos]) {
        NSArray *tags = [[photoArray valueForKey:FLICKR_TAGS] componentsSeparatedByString:@" "];
        Photo *photo = [[Photo alloc] init];
        [photo setTitle:[photoArray valueForKey:FLICKR_PHOTO_TITLE]];
        [photo setDescription:[photoArray valueForKey:FLICKR_PHOTO_DESCRIPTION]];
        [photo setPhotoId:[photoArray valueForKey:FLICKR_PHOTO_ID]];
        NSURL *url = [FlickrFetcher urlForPhoto:photoArray format:FlickrPhotoFormatLarge];
        [photo setUrl:url];
        for (NSString *tag in tags) {
            if (![tag isEqualToString:@"cs193pspot"] &&
                ![tag isEqualToString:@"portrait"] &&
                ![tag isEqualToString:@"landscape"]) {
                NSString *categoryTitle = [tag capitalizedString];
                Photo *categoryPhotos = spotDictionary[categoryTitle];
                if (!categoryPhotos) {
                    categoryPhotos = [[Photo alloc] init];
                    [categoryPhotos setTitle:categoryTitle];
                }
                NSMutableDictionary *categoryDictionary = [categoryPhotos.dictionary mutableCopy];
                if (!categoryDictionary) {
                    categoryDictionary = [[NSMutableDictionary alloc] init];
                }
                [categoryDictionary setObject:photo forKey:[photo photoId]];
                categoryPhotos.dictionary = categoryDictionary;
                NSUInteger keyCount = [categoryDictionary count];
                categoryPhotos.description = [NSString stringWithFormat:@"%i photos", keyCount];
                [spotDictionary setObject:categoryPhotos forKey:categoryPhotos.title];
            }
        }
    }
    NSArray *sortedKeys = [[spotDictionary allKeys] sortedArrayUsingSelector: @selector(compare:)];
    NSMutableArray *sortedValues = [NSMutableArray array];
    for (NSString *key in sortedKeys)
        [sortedValues addObject: [spotDictionary objectForKey: key]];
    
    self.spotArray = sortedValues;
}

@end
