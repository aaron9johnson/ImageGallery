
//
//  ViewController.m
//  ImageGallery
//
//  Created by Aaron Johnson on 2017-10-17.
//  Copyright © 2017 Aaron Johnson. All rights reserved.
//

#import "ViewController.h"
#import "DetailViewController.h"

@interface ViewController ()
@property (strong, nonatomic) UIScrollView *myScrollView;
@property NSArray *imagesArray;
@property UIPageControl *pageControl;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _myScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [self.view addSubview:self.myScrollView];
    [self.myScrollView setPagingEnabled:YES];
    [self.myScrollView setAlwaysBounceVertical:NO];
    self.myScrollView.delegate = self;
    
    _imagesArray = [NSArray arrayWithObjects:@"Lighthouse", @"Lighthouse-night", @"Lighthouse-in-Field", nil];
    
    for (int i = 0; i < [self.imagesArray count]; i++)
    {
        CGFloat xOrigin = i * self.myScrollView.frame.size.width;
        
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(xOrigin, 0, self.myScrollView.frame.size.width, self.myScrollView.frame.size.height)];
        [imageView setImage:[UIImage imageNamed:[self.imagesArray objectAtIndex:i]]];
        [imageView setContentMode:UIViewContentModeScaleAspectFit];
        
        [self.myScrollView addSubview:imageView];
        _pageControl = [[UIPageControl alloc] init];
        self.pageControl.frame = CGRectMake(0,self.view.frame.size.height - 20,self.view.frame.size.width,10);
        self.pageControl.numberOfPages = 3;
        self.pageControl.currentPage = 0;
        [self.view addSubview:self.pageControl];
        self.pageControl.backgroundColor = [UIColor redColor];
        [self.pageControl addTarget:self action:@selector(onPageControlPageChanged) forControlEvents:UIControlEventValueChanged];
        
    }
    
    [self.myScrollView setContentSize:CGSizeMake(self.myScrollView.frame.size.width * [self.imagesArray count], self.myScrollView.frame.size.height)];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTapFrom:)];
    [self.myScrollView addGestureRecognizer:tap];
    
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    int page = self.myScrollView.contentOffset.x / self.myScrollView.frame.size.width;
    self.pageControl.currentPage = page;
}
-(void)onPageControlPageChanged{
    int offsetX = self.pageControl.currentPage * self.view.frame.size.width;
    CGPoint offset = CGPointMake(offsetX, 0);
    [self.myScrollView setContentOffset:offset animated:YES];
}
-(void)handleTapFrom:(UITapGestureRecognizer *)gesture{
    
    [self performSegueWithIdentifier:@"showDetail" sender:nil];
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    DetailViewController *detailView =  [segue destinationViewController];
    int i = self.myScrollView.contentOffset.x / self.view.frame.size.width;
    
    detailView.imageName = self.imagesArray[i];;
    // Pass the selected object to the new view controller.
}
@end
