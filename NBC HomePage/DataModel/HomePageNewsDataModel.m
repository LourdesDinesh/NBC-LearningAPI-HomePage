//
//  HomePageNewsDataModel.m
//  NBC HomePage
//
//  Created by Tringapps on 23/09/19.
//  Copyright © 2019 Tringapps. All rights reserved.
//

#import "HomePageNewsDataModel.h"
#import "InnerNewsFeedDataModel.h"

@implementation HomePageNewsDataModel

+ (HomePageNewsDataModel*)makeHomePageNewsData:(id)data {
    NSDictionary *section = (NSDictionary *) data;
    HomePageNewsDataModel *homePageNewsData = [HomePageNewsDataModel new];
    NSString *sectiontitle = section[@"title"];
    NSArray *arrayOfElements = section[@"items"];
    NSMutableArray<InnerNewsFeedDataModel *> *innerNewsFeedDataModel = [NSMutableArray new];
    for(NSDictionary *news in arrayOfElements) {
        id newsEntry = [InnerNewsFeedDataModel makeInnerNewsFeedData:news];
        InnerNewsFeedDataModel *innerNewsData = (InnerNewsFeedDataModel *) newsEntry;
        [innerNewsFeedDataModel addObject:innerNewsData];
    }
    homePageNewsData.sectionHeader = sectiontitle;
    homePageNewsData.innerNewsFeedDataModel = innerNewsFeedDataModel;

    return homePageNewsData;
}

@end
