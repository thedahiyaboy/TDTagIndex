//
//  ViewController.m
//  TDTagListCollection
//
//  Created by thedahiyaboy on 23/11/16.
//  Copyright © 2016 thedahiyaboy. All rights reserved.
//

#import "ViewController.h"
#import "TagViewListCell.h"

@interface ViewController (){
    NSMutableArray *arrTagList;
}

@property (weak, nonatomic) IBOutlet UICollectionView *collecTagCategory;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *constTagViewHeight;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    arrTagList = [[NSMutableArray alloc] initWithObjects:@"helasfafdflo", @"How", @"are", @"you", @"sir",@"heya",@"woow", nil];
    
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)actionTagCancel:(UIButton *)sender {
    
    UICollectionViewCell *aCell = (UICollectionViewCell*)[[[sender superview] superview]superview];
    [arrTagList removeObjectAtIndex:[_collecTagCategory indexPathForCell:aCell].row];
    [self.collecTagCategory deleteItemsAtIndexPaths:@[[NSIndexPath indexPathForItem:[_collecTagCategory indexPathForCell:aCell].row inSection:0]]];
}


#pragma mark- collection data source

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return arrTagList.count;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    
    CGSize tagLabelSize = [arrTagList[indexPath.row] boundingRectWithSize: CGSizeMake(self.view.frame.size.width-75, 120)
                                                              options:NSStringDrawingUsesLineFragmentOrigin
                                                           attributes:@{NSFontAttributeName:[UIFont fontWithName:@"Helvetica Neue" size:14.0 ]}
                                                              context:nil].size;
    
    return CGSizeMake (tagLabelSize.width + 45, 30);
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    TagViewListCell *tagCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"tagCell" forIndexPath:indexPath];
    tagCell.viewTag.layer.cornerRadius = 4;
    
    tagCell.lblTagName.text = arrTagList[indexPath.row];
    _constTagViewHeight.constant = _collecTagCategory.contentSize.height;
    return tagCell;
}


@end
