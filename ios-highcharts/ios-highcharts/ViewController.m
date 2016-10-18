//
//  ViewController.m
//  ios-hightcharts
//
//  Created by apple on 2014/10/17.
//  Copyright (c) 2014年 tnaototo. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
    NSString *json;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
    self.webView.delegate = self;
    self.webView.scalesPageToFit = YES;
    self.webView.scrollView.bounces=NO;
    
    [self.view addSubview:self.webView];
    [self drawBarChart];
    
}


- (void)webViewDidFinishLoad:(UIWebView *)webView {
    NSString *js = [NSString stringWithFormat:@"draw(%@);", json];
    [self.webView stringByEvaluatingJavaScriptFromString:js];
}

# pragma mark - private methods
- (void)drawBarChart {
    json = @"";
    NSString *path = [[NSBundle mainBundle]pathForResource:@"test" ofType:@"html"];
    NSURL *url = [NSURL fileURLWithPath:path];
    NSURLRequest *req = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:req];
}

@end
