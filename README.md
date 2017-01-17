#GHContextMenu - Pinterest like context menu control for iOS

![alt tag](https://github.com/GnosisHub/GHContextMenu/blob/master/cmocv.gif)
![alt tag](https://github.com/GnosisHub/GHContextMenu/blob/master/cmocv5.gif)
![alt tag](https://github.com/GnosisHub/GHContextMenu/blob/master/cmov.gif)
![alt tag](https://github.com/hennychen/GHContextMenu/blob/master/titles.gif)
This is user friendly solution for showing context menu upon long press. It is inspired from the Pinterest iOS app

##How To Use

Sample app contains examples of how to add context menu for UIView and UICollectionView

* Add `GHContextMenuView` headers and implementations to your project (2 files total).
* Include with `#import "GHContextMenuView.h"` to use it wherever you need.
* Set and implement the `GHContextMenuViewDataSource` to provide data about the pages.
* Set and implement the `GHContextMenuViewDelegate` to receive callback upon selection.

### Sample Code
```objc
// Creating
    GHContextMenuView* overlay = [[GHContextMenuView alloc] init];
    overlay.dataSource = self;
    overlay.delegate = self;
    
    UILongPressGestureRecognizer* _longPressRecognizer = [[UILongPressGestureRecognizer alloc] initWithTarget:overlay action:@selector(longPressDetected:)];
    [self.view addGestureRecognizer:_longPressRecognizer];

// Implementing data source methods
- (NSInteger) numberOfMenuItems
{
    return 3;
}

-(UIImage*) imageForItemAtIndex:(NSInteger)index
{
    NSString* imageName = nil;
    switch (index) {
        case 0:
            imageName = @"facebook";
            break;
        case 1:
            imageName = @"twitter";
            break;
        case 2:
            imageName = @"google-plus";
            break;
            
        default:
            break;
    }
    return [UIImage imageNamed:imageName];
}
-(NSString *)titleForItemAtIndex:(NSInteger)index{
    NSString* title = nil;
    switch (index) {
        case 0:
            title = @"facebook-white";
            break;
        case 1:
            title = @"twitter-white";
            break;
        case 2:
            title = @"google-plus-white";
            break;
        case 3:
            title = @"linkedin-white";
            break;
        case 4:
            title = @"pinterest-white";
            break;

        default:
            break;
    }

    return title;
}

- (void) didSelectItemAtIndex:(NSInteger)selectedIndex forMenuAtPoint:(CGPoint)point
{
    NSString* msg = nil;
    switch (selectedIndex) {
        case 0:
            msg = @"Facebook Selected";
            break;
        case 1:
            msg = @"Twitter Selected";
            break;
        case 2:
            msg = @"Google Plus Selected";
            break;
            
        default:
            break;
    }
    
    UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:nil message:msg delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alertView show];

}

```

###Next Steps:
Supporting configurations is one of the next steps. Any feature request is welcome. Raise an issue with a feature tag and I will look into it


###License :

The MIT License

