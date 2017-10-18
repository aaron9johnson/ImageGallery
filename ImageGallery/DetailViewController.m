//
//  DetailViewController.m
//  ImageGallery
//
//  Created by Aaron Johnson on 2017-10-17.
//  Copyright © 2017 Aaron Johnson. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()
@property UIScrollView *detailScrollView;
@property UIImageView *detailImageView;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //_imageName = @"Lighthouse-in-Field";
    _detailScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [self.view addSubview:self.detailScrollView];
    _detailImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:self.imageName]];
    [self.detailScrollView addSubview:self.detailImageView];
    
    self.detailScrollView.minimumZoomScale = 0.25;
    self.detailScrollView.maximumZoomScale = 4;
    [self.detailScrollView setContentSize:CGSizeMake(1920, 1920)];
    self.detailScrollView.delegate = self;
    
}
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{
    return self.detailImageView;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
