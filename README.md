#GHContextMenu - Pinterest like context menu control for iOS

![alt tag](https://github.com/GnosisHub/GHContextMenu/blob/master/cmocv.gif)
![alt tag](https://github.com/GnosisHub/GHContextMenu/blob/master/cmocv5.gif)
![alt tag](https://github.com/GnosisHub/GHContextMenu/blob/master/cmov.gif)

This is user friendly solution for showing context menu upon long press. It is inspired from the Pinterest iOS app

##How To Use

Sample app contains examples of how to add context menu for UIView and UICollectionView

* Add `GHContextMenuView` headers and implementations to your project (2 files total).
* Include with `#import "GHContextMenuView.h"` to use it wherever you need.
* Set and implement the `GHContextMenuViewDataSource` to provide data about the pages.
* Set and implement the `GHContextMenuViewDelegate` to receive callback upon selection.

### Sample Code
```objc
// create menu overlay
    GHContextMenuView* overlay = [[GHContextMenuView alloc] init];
    overlay.menuViewBackgroundColor = [UIColor whiteColor];
    overlay.dataSource = self;
    overlay.delegate = self;
    overlay.menuViewBackgroundColor = [UIColor colorWithWhite:1.0f alpha:0.85f];

    UILongPressGestureRecognizer* _longPressRecognizer = [[UILongPressGestureRecognizer alloc] initWithTarget:overlay action:@selector(longPressDetected:)];
    [self.collectionView addGestureRecognizer:_longPressRecognizer];


// implement delegate
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
```

###Next Steps:
Supporting configurations is one of the next steps. Any feature request is welcome. Raise an issue with a feature tag and I will look into it


###License :

The MIT License



### Thanks:

Icons from http://www.designcrawl.com/48-free-hollow-and-solid-fill-circle-icons/

