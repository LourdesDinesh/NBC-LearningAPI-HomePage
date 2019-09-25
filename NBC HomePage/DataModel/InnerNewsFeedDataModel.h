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
@property(strong, nonatomic) NSString *contentBody;

+ (id)makeInnerNewsFeedData:(NSDictionary *)newsDataDictionary;

@end

NS_ASSUME_NONNULL_END
