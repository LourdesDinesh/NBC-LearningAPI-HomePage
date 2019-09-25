//
//  ViewController.m
//  NBC HomePage
//
//  Created by Tringapps on 20/09/19.
//  Copyright © 2019 Tringapps. All rights reserved.
//

#import "ViewController.h"
#import "NewsTableViewCell.h"
#import "HomePageNewsDataModel.h"


@interface ViewController() <UITableViewDataSource> {
    NSMutableArray <HomePageNewsDataModel *> *homePageNewsDataModel;
}
@property (weak, nonatomic) IBOutlet UITableView *tableView;


@end

// String Constants

NSString *kURLHome = @"https://www.nbcnewyork.com/apps/news-app/home/modules/?apiVersion=18&os=ios";

@implementation ViewController

#pragma mark - View Controller - Life Cycle

- (void)viewDidLoad {
    homePageNewsDataModel = [NSMutableArray new];
    [super viewDidLoad];
    self.tableView.dataSource = self;
    [self fetchDataFromJson];
}
#pragma mark - View Controller - Life Cycle - Helper

- (void)fetchDataFromJson {
    NSLog(@"Fetch Data From Api");
    NSURL *urlObject = [NSURL URLWithString:kURLHome];
    __weak ViewController *weakSelf = self;
    [[NSURLSession.sharedSession dataTaskWithURL:urlObject completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSError *err;
        id jsonCustomData = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&err];
        if(err) {
            NSLog(@"Failed To Serialize");
            return;
        }
        if(![jsonCustomData isKindOfClass:[NSDictionary class]]) {
            NSLog(@"JSON Data is not dictionary");
            return;
        }
        NSDictionary *jsonDictionary = (NSDictionary *)jsonCustomData;
        NSArray *modulesArray = jsonDictionary[@"modules"];
        ViewController *strongSelf = weakSelf;
        if(strongSelf) {
            for( NSDictionary *section in modulesArray) {
                HomePageNewsDataModel *homePageData =(HomePageNewsDataModel*)  [HomePageNewsDataModel makeHomePageNewsData:section];
                [strongSelf->homePageNewsDataModel addObject:homePageData];
            }
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            [weakSelf.tableView reloadData];
        });
    }] resume];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return homePageNewsDataModel[section].sectionHeader;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return homePageNewsDataModel.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return homePageNewsDataModel[section].innerNewsFeedDataModel.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NewsTableViewCell *cell = (NewsTableViewCell*) [tableView dequeueReusableCellWithIdentifier:@"NewsTableViewCellReusableIdentity" forIndexPath:indexPath];
    cell.newsTitle.text = homePageNewsDataModel[indexPath.section].innerNewsFeedDataModel[indexPath.row].newsTitle;
    cell.timeStamp.text = homePageNewsDataModel[indexPath.section].innerNewsFeedDataModel[indexPath.row].timeStamp;
    dispatch_async(dispatch_get_global_queue(0,0), ^{
        NSData * data = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString: self->homePageNewsDataModel[indexPath.section].innerNewsFeedDataModel[indexPath.row].thumbnailImageUrl]];
        if ( data == nil )
            return;
        dispatch_async(dispatch_get_main_queue(), ^{
            cell.newsImage.image = [UIImage imageWithData:data];
        });

    });
    return cell;
}

@end
