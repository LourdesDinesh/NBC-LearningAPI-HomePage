//
//  NewsDescriptionViewController.m
//  NBC HomePage
//
//  Created by Tringapps on 25/09/19.
//  Copyright © 2019 Tringapps. All rights reserved.
//

#import "NewsDescriptionViewController.h"
#import <WebKit/WebKit.h>

@interface NewsDescriptionViewController ()
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
    "font-family: \"Arimo\"; font-size: 10px; color: #171717;"
    "font-size: 50px;"
    "text-align: justify;"
    "}"

    ".embedded.article ul li span {"
    "   display: none;"
    "}"

    //**VIDEO
    ".embeddedWrapper .videoHeadline {"
    "color: #171717  !important;"
    "}"

    ".embeddedWrapper .smallestTitle {"
    "   color: #777777;"
    "   line-height: 17px !important;"

    "}"

    //**GAllERY
    ".embedded.gallery h3.smallTitle a {"
    "   color: #777777 !important;"
    "   line-height: 14px !important;"
    "}"

    ".embedded.vertical h3.smallTitle a {"
    "   color: #777777 !important;"
    "   line-height: 14px !important;"
    "}"

    "</style>"
    "</head>"
    "<div class=\"article_wrapper\" style=\"margin:0px 7px 0px 7px;\">"
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
    NSLog(@"%@", modifiedHTML);
    [self.activityView stopAnimating];
    [self.activityView setHidden:true];
}

@end
