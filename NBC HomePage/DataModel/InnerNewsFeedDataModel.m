//
//  InnerNewsFeedDataModel.m
//  NBC HomePage
//
//  Created by Tringapps on 23/09/19.
//  Copyright © 2019 Tringapps. All rights reserved.
//

#import "InnerNewsFeedDataModel.h"

@implementation InnerNewsFeedDataModel

+ (id)makeInnerNewsFeedData:(NSArray *)newsDataDictionary {
    NSDictionary *item = (NSDictionary *)newsDataDictionary;
    NSString *newsTitle = item[@"title"];
    NSString *timeStamp = item[@"articleUpdateDate"];
    NSString *thumbnailImageUrl = item[@"thumbnailImageURL"];
    NSString *contentBody = item[@"contentBody"];
    InnerNewsFeedDataModel *innerNewsFeedDataModel = [InnerNewsFeedDataModel new];
    innerNewsFeedDataModel.newsTitle = newsTitle;
    innerNewsFeedDataModel.timeStamp = timeStamp;
    innerNewsFeedDataModel.thumbnailImageUrl = thumbnailImageUrl;
    innerNewsFeedDataModel.contentBody = contentBody;
    return innerNewsFeedDataModel;
}

@end
