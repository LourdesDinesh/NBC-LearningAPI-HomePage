//
//  NewsDescriptionViewController.m
//  NBC HomePage
//
//  Created by Tringapps on 25/09/19.
//  Copyright © 2019 Tringapps. All rights reserved.
//

#import "NewsDescriptionViewController.h"
#import <WebKit/WebKit.h>

@interface NewsDescriptionViewController () <WKNavigationDelegate>
@property (weak, nonatomic) IBOutlet WKWebView *webView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityView;
@property (weak, nonatomic) IBOutlet UIImageView *thumbnailImageView;
@end

@implementation NewsDescriptionViewController
NSString *htmlTemplate = @"<html>"
"<div id = \"contentBodyHeight\">"
"<head>"
"<style type=\"text/css\">"
"body {"
"background-color: #ffffff;"
"font-family: \"Roboto-Regular\"; padding: 0px; margin: 0px;"
"}"
"</style>"
"</head>"
"<body>%@</body>"
"</div>"
"</html>";

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupPage];
}

-(void) setupPage {
    self.thumbnailImageView.image = self.thumbnailImage;
    NSString *modifiedHTML = [NSString stringWithFormat: htmlTemplate, self.contentBody];
    [self.webView loadHTMLString:modifiedHTML baseURL:nil];
    NSLog(modifiedHTML);
    [self.activityView stopAnimating];
    [self.activityView setHidden:true];
}

- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation {
    [self.activityView stopAnimating];
}

@end
