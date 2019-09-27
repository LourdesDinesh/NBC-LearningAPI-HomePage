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

+ (NSMutableArray<HomePageNewsDataModel*>*)makeHomePageNewsData:(id)data {
    NSMutableArray<HomePageNewsDataModel*> *homePageDataModel = [NSMutableArray<HomePageNewsDataModel*> new];
    NSDictionary *jsonDictionary = (NSDictionary *) data;
    NSArray *modulesArray = jsonDictionary[@"modules"];
    for (NSDictionary *section in modulesArray) {
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
        [homePageDataModel addObject: homePageNewsData];
    }
    return homePageDataModel;
}

@end
