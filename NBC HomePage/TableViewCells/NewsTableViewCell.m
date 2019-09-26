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
            NSData * data = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString: url]];
        if ( data == nil ) {
            NSLog(@"No Data Obtained From Image Url");
                return;
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            self.newsImage.image = [UIImage imageWithData:data];
        });
    });
}
@end
