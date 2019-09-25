//
//  InnerNewsFeedDataModel.h
//  NBC HomePage
//
//  Created by Tringapps on 23/09/19.
//  Copyright © 2019 Tringapps. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@interface InnerNewsFeedDataModel : NSObject
@property(strong, nonatomic) NSString *newsTitle;
@property(strong, nonatomic) NSString *timeStamp;
@property(strong, nonatomic) NSString *thumbnailImageUrl;
@end

NS_ASSUME_NONNULL_END
