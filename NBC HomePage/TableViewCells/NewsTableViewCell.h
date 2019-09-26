//
//  NewsTableViewCell.h
//  NBC HomePage
//
//  Created by Tringapps on 20/09/19.
//  Copyright © 2019 Tringapps. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "InnerNewsFeedDataModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface NewsTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *timeStamp;
@property (weak, nonatomic) IBOutlet UIImageView *newsImage;
@property (weak, nonatomic) IBOutlet UILabel *newsTitle;
- (void)setValues:(InnerNewsFeedDataModel*)data;
- (void)setImage:(NSString*) url;
@end

NS_ASSUME_NONNULL_END
