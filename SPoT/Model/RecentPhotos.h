//
//  RecentPhotos.h
//  SPoT
//
//  Created by Karan Shah on 10/12/13.
//  Copyright (c) 2013 Karan Shah. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Photo.h"

@interface RecentPhotos : NSObject

+ (NSArray *)allRecentPhotos; // of Photos

+ (void) synchronize:(Photo *)photo;


@end
