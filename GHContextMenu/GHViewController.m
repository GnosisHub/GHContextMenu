//
//  GHViewController.m
//  GHContextMenu
//
//  Created by Tapasya on 27/01/14.
//  Copyright (c) 2014 Tapasya. All rights reserved.
//

#import "GHViewController.h"
#import "GHContextMenuView.h"

@interface GHViewController ()<GHContextOverlayViewDataSource, GHContextOverlayViewDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation GHViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    GHContextMenuView* overlay = [[GHContextMenuView alloc] init];
    overlay.dataSource = self;
    overlay.delegate = self;
    overlay.menuViewBackgroundColor = [UIColor colorWithWhite:1.0f alpha:0.85f];
    
    UILongPressGestureRecognizer* _longPressRecognizer = [[UILongPressGestureRecognizer alloc] initWithTarget:overlay action:@selector(longPressDetected:)];
    [self.imageView setUserInteractionEnabled:YES];
    [self.view addGestureRecognizer:_longPressRecognizer];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger) numberOfMenuItems
{
    return 3;
}

-(UIImage*) imageForItemAtIndex:(NSInteger)index
{
    NSString* imageName = nil;
    switch (index) {
        case 0:
            imageName = @"gp";
            break;
        case 1:
            imageName = @"p";
            break;
        case 2:
            imageName = @"t";
            break;
        default:
            break;
    }
    return [UIImage imageNamed:imageName];
}

- (UIImage *)highlightImageForItemAtIndex:(NSInteger)index {
    NSString* imageName = nil;
    switch (index) {
        case 0:
            imageName = @"gps";
            break;
        case 1:
            imageName = @"ps";
            break;
        case 2:
            imageName = @"ts";
            break;
        default:
            break;
    }
    return [UIImage imageNamed:imageName];
}

- (void) didSelectItemAtIndex:(NSInteger)selectedIndex forMenuAtPoint:(CGPoint)point
{
    NSString* msg = nil;
    switch (selectedIndex) {
        case 0:
            msg = @"Google+ Selected";
            break;
        case 1:
            msg = @"Pinterest Selected";
            break;
        case 2:
            msg = @"Twitter Selected";
            break;
        default:
            break;
    }
    
    UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:nil message:msg delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alertView show];

}

- (NSString *)tipForItemAtIndex:(NSInteger)index {
    NSString* tip = @"";
    switch (index) {
        case 0:
            tip = @"Google+";
            break;
        case 1:
            tip = @"Pinterest";
            break;
        case 2:
            tip = @"Twitter";
            break;
        default:
            break;
    }
    return tip;
}

@end
