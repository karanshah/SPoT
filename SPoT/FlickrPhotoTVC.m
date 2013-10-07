//
//  FlickrPhotoTVC.m
//  SPoT
//
//  Created by Karan Shah on 9/29/13.
//  Copyright (c) 2013 Karan Shah. All rights reserved.
//

#import "FlickrPhotoTVC.h"
//#import "FlickrFetcher.h"
#import "Photo.h"
@interface FlickrPhotoTVC ()

@end

@implementation FlickrPhotoTVC

- (void)setPhotos:(NSArray *)photos {
    _photos = photos;
    [self.tableView reloadData];
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([sender isKindOfClass:[UITableViewCell class]]) {
                NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
                if (indexPath) {
                    if ([segue.identifier isEqualToString:@"Show Category"]) {
                        if ([segue.destinationViewController respondsToSelector:@selector(setPhotos:)]) {
                            Photo *categoryPhoto = self.photos[indexPath.row];
                            NSArray *categoryPhotos = [categoryPhoto.dictionary allValues];
                            [segue.destinationViewController performSelector:@selector(setPhotos:) withObject:categoryPhotos];
                            [segue.destinationViewController setTitle:[self titleForRow:indexPath.row]];
                        }
                    }
                    if ([segue.identifier isEqualToString:@"Show Image"]) {
                        if ([segue.destinationViewController respondsToSelector:@selector(setImageURL:)]) {
        //                    NSURL *url = [FlickrFetcher urlForPhoto:self.photos[indexPath.row] format:FlickrPhotoFormatLarge];
                            Photo *categoryPhoto = self.photos[indexPath.row];
                            [segue.destinationViewController performSelector:@selector(setImageURL:) withObject:categoryPhoto.url];
                            [segue.destinationViewController setTitle:[self titleForRow:indexPath.row]];
                        }
                    }
                }
    }
}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.photos count];
}

- (NSString *) titleForRow:(NSUInteger)row {
    //    return [self.photos[row][FLICKR_PHOTO_TITLE] description];
    Photo *photo = self.photos[row];
    return [photo.title description];
}

- (NSString *) subtitleForRow:(NSUInteger)row {
    //    return [self.photos[row][FLICKR_PHOTO_OWNER] description];
    Photo *photo = self.photos[row];
    return [photo.description description];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Flickr Photo";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    cell.textLabel.text = [self titleForRow:indexPath.row];
    cell.detailTextLabel.text = [self subtitleForRow:indexPath.row];
    
    
    return cell;
}

@end
