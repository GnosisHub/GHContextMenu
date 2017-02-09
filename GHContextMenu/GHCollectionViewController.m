//
//  GHCollectionViewController.m
//  GHContextMenuDemo
//
//  Created by Tapasya on 31/01/14.
//  Copyright (c) 2014 Tapasya. All rights reserved.
//

#import "GHCollectionViewController.h"
#import "GHContextMenuView.h"

@interface GHCollectionViewController ()<UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, GHContextOverlayViewDataSource, GHContextOverlayViewDelegate>

@end

@implementation GHCollectionViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    GHContextMenuView* overlay = [[GHContextMenuView alloc] init];
    overlay.menuViewBackgroundColor = [UIColor whiteColor];
    overlay.dataSource = self;
    overlay.delegate = self;
    overlay.menuViewBackgroundColor = [UIColor colorWithWhite:1.0f alpha:0.85f];

	// Do any additional setup after loading the view.
//    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    UILongPressGestureRecognizer* _longPressRecognizer = [[UILongPressGestureRecognizer alloc] initWithTarget:overlay action:@selector(longPressDetected:)];
    [self.collectionView addGestureRecognizer:_longPressRecognizer];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 18;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    cell.contentView.backgroundColor = [UIColor grayColor];
    UILabel* label = (UILabel*)[cell viewWithTag:100];
    label.text = [NSString stringWithFormat:@"%ld",indexPath.row +1];
    return cell;
}

-(UIEdgeInsets) collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(10, 10, 10, 10);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(80, 120);
}

#pragma mark - GHMenu methods

-(BOOL) shouldShowMenuAtPoint:(CGPoint)point
{
    NSIndexPath* indexPath = [self.collectionView indexPathForItemAtPoint:point];
    UICollectionViewCell* cell = [self.collectionView cellForItemAtIndexPath:indexPath];
    
    return cell != nil;
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
    NSIndexPath* indexPath = [self.collectionView indexPathForItemAtPoint:point];

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
    
    msg = [msg stringByAppendingFormat:@" for cell %ld", (long)indexPath.row +1];
    
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

- (UIView *)overlayViewAtPoint:(CGPoint)point {
    NSIndexPath *indexPath = [self.collectionView indexPathForItemAtPoint:point];
    UICollectionViewCell *cell = [self.collectionView cellForItemAtIndexPath:indexPath];
    CGPoint origin = cell.frame.origin;
    origin = [self.view convertPoint:origin fromView:self.collectionView];
    UIView *snap = [cell snapshotViewAfterScreenUpdates:NO];
    CGRect snapFrame = cell.bounds;
    snapFrame.origin = origin;
    snap.frame = snapFrame;
    return snap;
}

@end
