//
//  RecentPhotos.m
//  SPoT
//
//  Created by Karan Shah on 10/12/13.
//  Copyright (c) 2013 Karan Shah. All rights reserved.
//

#import "RecentPhotos.h"

@implementation RecentPhotos

#define ALL_RESULTS_KEY @"SpotRecent_All"

+ (NSArray *) allRecentPhotos {
    NSMutableArray *recentPhotos = [[NSMutableArray alloc] init];
    for (id plist in [[[NSUserDefaults standardUserDefaults] dictionaryForKey:ALL_RESULTS_KEY] allValues]) {
        Photo *photo = [[Photo alloc] initFromPropertyList:plist];
        [recentPhotos addObject:photo];
    }
    return recentPhotos;
}

+ (void) synchronize:(Photo *)photo {
    NSMutableDictionary *mutableRecentPhotosFromUserDefaults = [[[NSUserDefaults standardUserDefaults] dictionaryForKey:ALL_RESULTS_KEY] mutableCopy];
    if (!mutableRecentPhotosFromUserDefaults) mutableRecentPhotosFromUserDefaults = [[NSMutableDictionary alloc] init];
    mutableRecentPhotosFromUserDefaults[photo.photoId] = [photo asPropertyList];
    [[NSUserDefaults standardUserDefaults] setObject:mutableRecentPhotosFromUserDefaults forKey:ALL_RESULTS_KEY];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

@end
