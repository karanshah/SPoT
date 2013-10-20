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
    NSUserDefaults *settings = [[NSUserDefaults alloc] init];
    NSArray *recentPhotoDictionary = [settings arrayForKey:ALL_RESULTS_KEY];
    for (id plist in recentPhotoDictionary) {
        Photo *photo = [[Photo alloc] initFromPropertyList:plist];
        [recentPhotos addObject:photo];
    }
    return recentPhotos;
}

+ (void) synchronize:(Photo *)photo {
    NSUserDefaults *settings = [[NSUserDefaults alloc] init];
    NSMutableArray *recentPhotos = [settings mutableArrayValueForKey: ALL_RESULTS_KEY];
    if (recentPhotos.count == 0) {
        [recentPhotos addObject:[photo asPropertyList]];
    } else {
        [recentPhotos insertObject:[photo asPropertyList] atIndex:0];
    }
    //Remove the objects if its greater than 25 Items
    while (recentPhotos.count > 25) {
        [recentPhotos removeLastObject];
    }
    // Update user defaults
    [settings setObject:[recentPhotos copy] forKey:ALL_RESULTS_KEY];
    [settings synchronize];
}

@end
