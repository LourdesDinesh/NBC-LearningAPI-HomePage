//
//  NewsTableViewCell.m
//  NBC HomePage
//
//  Created by Tringapps on 20/09/19.
//  Copyright © 2019 Tringapps. All rights reserved.
//

#import "NewsTableViewCell.h"
#import "InnerNewsFeedDataModel.h"

@implementation NewsTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setValues:(InnerNewsFeedDataModel *)data {
    self.timeStamp.text = data.timeStamp;
    self.newsTitle.text = data.newsTitle;
    [self setImage:data.thumbnailImageUrl];
}

- (void)setImage:(NSString *)url {
    dispatch_async(dispatch_get_global_queue(0,0), ^{
        UIImage *cachedImage = [self.imageCache objectForKey:url];
        if(cachedImage == nil) {
            NSLog(@"Image Not Cached yet");
        } else {
            dispatch_async(dispatch_get_main_queue(), ^{
                self.newsImage.image = cachedImage;
            });
            return;
        }
        NSData * data = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString: url]];
        if ( data == nil ) {
            NSLog(@"No Data Obtained From Image Url");
                return;
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            UIImage *downloadedImage = [UIImage imageWithData:data];
            self.newsImage.image = downloadedImage;
            [self.imageCache setObject:downloadedImage forKey:url];
        });
    });
}
@end
