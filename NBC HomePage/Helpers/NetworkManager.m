//
//  NetworkManager.m
//  NBC HomePage
//
//  Created by Tringapps on 27/09/19.
//  Copyright © 2019 Tringapps. All rights reserved.
//

#import "NetworkManager.h"

@implementation NetworkManager
- (id)getDataFromJson:(NSString *)url completionHandler:(void (^)(NSMutableArray<HomePageNewsDataModel *>* homePageDataModel))completionHandler {
    NSURL *urlObject = [NSURL URLWithString:url];
    [NSURLSession.sharedSession dataTaskWithURL:urlObject completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSLog(@"Fetching Data From API");
    }];
#warning "Have to change this return"
    NSString *change = @"Have to change this return";
    return change;
}
@end
