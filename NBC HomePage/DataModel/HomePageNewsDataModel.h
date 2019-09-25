//
//  HomePageNewsDataModel.h
//  NBC HomePage
//
//  Created by Tringapps on 23/09/19.
//  Copyright © 2019 Tringapps. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "InnerNewsFeedDataModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface HomePageNewsDataModel : NSObject
{

}
@property(strong, nonatomic) NSString *sectionHeader;
@property(strong, nonatomic) NSArray<InnerNewsFeedDataModel *> *innerNewsFeedDataModel;

+ (HomePageNewsDataModel *)makeHomePageNewsData:(id)data;

@end

NS_ASSUME_NONNULL_END
