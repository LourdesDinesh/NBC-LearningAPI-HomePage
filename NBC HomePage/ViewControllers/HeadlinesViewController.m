//
//  ViewController.m
//  NBC HomePage
//
//  Created by Tringapps on 20/09/19.
//  Copyright © 2019 Tringapps. All rights reserved.
//

#import "HeadlinesViewController.h"
#import "NewsTableViewCell.h"
#import "HomePageNewsDataModel.h"
#import "NewsDescriptionViewController.h"


@interface HeadlinesViewController() <UITableViewDataSource, UITableViewDelegate> {
    NSIndexPath *selectedIndexpath;
    NSMutableArray <HomePageNewsDataModel *> *homePageNewsDataModel;
//    @interface NSCache<__covariant KeyType, __covariant ObjectType> : NSObject;
}
@property (weak, nonatomic) IBOutlet UITableView *tableView;


@end

// String Constants

NSString *kURLHome = @"https://www.nbcnewyork.com/apps/news-app/home/modules/?apiVersion=18&os=ios";

@implementation HeadlinesViewController

#pragma mark - View Controller - Life Cycle

- (void)viewDidLoad {
    selectedIndexpath = [NSIndexPath new];
    homePageNewsDataModel = [NSMutableArray new];
    [super viewDidLoad];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self fetchDataFromJson];
}
#pragma mark - View Controller - Life Cycle - Helper

- (void)fetchDataFromJson {
    NSLog(@"Fetch Data From Api");
    NSURL *urlObject = [NSURL URLWithString:kURLHome];
    __weak HeadlinesViewController *weakSelf = self;
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
        HeadlinesViewController *strongSelf = weakSelf;
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
    [cell setValues:homePageNewsDataModel[indexPath.section].innerNewsFeedDataModel[indexPath.row]];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:true];
    selectedIndexpath = indexPath;
    [self performSegueWithIdentifier:@"NewsPageSegueIdentifier" sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"NewsPageSegueIdentifier"]) {
         NewsDescriptionViewController *newsDescriptionViewController = [segue destinationViewController];
        NewsTableViewCell *selectedCell = [self.tableView cellForRowAtIndexPath:selectedIndexpath];
        newsDescriptionViewController.thumbnailImage = selectedCell.newsImage.image;
        newsDescriptionViewController.contentBody = homePageNewsDataModel[selectedIndexpath.section].innerNewsFeedDataModel[selectedIndexpath.row].contentBody;
    }
}

@end
