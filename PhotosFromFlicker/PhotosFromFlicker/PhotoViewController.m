//
//  PhotoViewController.m
//  PhotosFromFlicker
//
//  Created by Horatiu on 17/02/16.
//  Copyright © 2016 Horatiu. All rights reserved.
//

#import "PhotoViewController.h"
#import "ServiceCallManager.h"

@interface PhotoViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *myPhotoScrolView;
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic,strong) UIImage *image;
@end

@implementation PhotoViewController

-(void) setMyPhotoScrolView:(UIScrollView *)myPhotoScrolView{
    
    _myPhotoScrolView = myPhotoScrolView;
    _myPhotoScrolView.contentSize = self.image ? self.imageView.bounds.size:CGSizeZero;
}

-(void) setUrlImage{
   // self.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:self.URL]];
    self.myPhotoScrolView.contentSize = self.imageView.bounds.size ;
    [self startDownloadingImage];
}
-(void) startDownloadingImage{
    self.image = nil;
    [kServiceCallManager downloadFileAtUrl:self.URL withCompletionBlock:^(NSError *serviceCallError, id dataResult, NSURLResponse *response) {
      
        if (!serviceCallError) {
            UIImage *image = [UIImage imageWithData:(NSData *)dataResult];
            self.image = image;
            [self setImage:image];
        }
    }];
        
}


/*
-(void) startDownloadingImage{
    self.image = nil;
    NSURLRequest *request = [NSURLRequest requestWithURL:self.URL];
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration ephemeralSessionConfiguration];
    NSURLSession *sesion = [NSURLSession sessionWithConfiguration:configuration];
    NSURLSessionDownloadTask *task = [sesion downloadTaskWithRequest:request completionHandler:^(NSURL * _Nullable localfile, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (!error) {
            if ([request.URL isEqual: self.URL]) {
                UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:localfile]];
                dispatch_async(dispatch_get_main_queue(), ^{
                    self.image = image;
                    [self setImage:image];
                });
            }
        }
    }];
    [task resume];
}
 
 */
-(UIImageView*)imageView{
    if (!_imageView) {
        _imageView = [[UIImageView alloc]init];
    }
    return _imageView;
}
-(UIImage*)image{
    return self.imageView.image;
}
-(void) setImage:(UIImage *)image{
    self.imageView.image = image;
    [self.imageView sizeToFit];
    self.myPhotoScrolView.contentSize = self.image ? self.imageView.bounds.size:CGSizeZero;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUrlImage];
    [self.myPhotoScrolView addSubview:self.imageView];
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
