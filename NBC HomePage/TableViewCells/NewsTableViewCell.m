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
    _newsTitle.text = @"Hello, this work";
}

@end
