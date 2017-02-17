//
//  TagViewListCell.h
//  TDTagListCollection
//
//  Created by thedahiyaboy on 23/11/16.
//  Copyright © 2016 thedahiyaboy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TagViewListCell : UICollectionViewCell

@property (strong, nonatomic) IBOutlet UIView *viewTag;
@property (strong, nonatomic) IBOutlet UILabel *lblTagName;
@property (strong, nonatomic) IBOutlet UIButton *btnTagCancel;

@end
