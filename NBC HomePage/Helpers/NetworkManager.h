//
//  NetworkManager.h
//  NBC HomePage
//
//  Created by Tringapps on 27/09/19.
//  Copyright © 2019 Tringapps. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomePageNewsDataModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface NetworkManager: NSObject
-(id) getDataFromJson:(NSString*)url completionHandler:(void (^)(NSMutableArray<HomePageNewsDataModel *>* homePageDataModel))completionHandler;
//- (NSURLSessionDataTask *)dataTaskWithURL:(NSURL *)url completionHandler:(void (^)(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error))completionHandler;

@end

NS_ASSUME_NONNULL_END
