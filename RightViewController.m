//
//  RightViewController.m
//  BClock
//
//  Created by 白 斌 on 13-8-31.
//  Copyright (c) 2013年 baibin. All rights reserved.
//

#import "RightViewController.h"
#import "RightViewCellView.h"
#import "RightViewCellViewStytleTwo.h"

static const int rowCount = 4;

@interface RightViewController ()<actionRightViewCellDelegate>

@end

@implementation RightViewController
@synthesize dataSourceArray = _dataSourceArray;

# pragma mark -- RightViewCellDelegate

- (void) actionRightViewCellTrueButton:(id)sender
{
    // 拿到这个Alarm的行号以后，将更改这个闹钟的状态，已经更改此时的状态图片
    int i = [_tableView indexPathForCell:(UITableViewCell *)[[sender superview] superview]].row;
    
    NSLog(@"%d",i);
    
    [_tableView reloadData];
}

- (void) actionRightViewCellFalseButton:(id)sender
{

}

# pragma mark

# pragma mark --UITableView Delegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return rowCount;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Setting";
   
    
    if(indexPath.row == 0)
    {
    
    RightViewCellView *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if(cell == nil)
    {
        
        NSArray *_nib=[[NSBundle mainBundle] loadNibNamed:@"RightViewCellView"
                                                   owner:self
                                                 options:nil];
        cell = [_nib objectAtIndex:0];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    [cell.contentView setBackgroundColor:[UIColor colorWithRed:0.12 green:0.16 blue:0.21 alpha:1.0]];
    
    [cell.StatusTrueButton setBackgroundImage:[UIImage imageNamed:@"StatusTrueNormal.png"] forState:UIControlStateNormal];
    [cell.StatusFalseButton setBackgroundImage:[UIImage imageNamed:@"StatusFalseNormal"] forState:UIControlStateNormal];
    cell.TextLabel.text = @"Alarm";

    return cell;
        
    }else if (indexPath.row == 1)
    {
        RightViewCellView *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if(cell == nil)
        {
            
            NSArray *_nib=[[NSBundle mainBundle] loadNibNamed:@"RightViewCellView"
                                                        owner:self
                                                      options:nil];
            cell = [_nib objectAtIndex:0];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        
        [cell.contentView setBackgroundColor:[UIColor colorWithRed:0.12 green:0.16 blue:0.21 alpha:1.0]];
        [cell.StatusTrueButton setBackgroundImage:[UIImage imageNamed:@"StatusTrueNormal.png"] forState:UIControlStateNormal];
        [cell.StatusFalseButton setBackgroundImage:[UIImage imageNamed:@"StatusFalseNormal"] forState:UIControlStateNormal];
        cell.TextLabel.text = @"Snooze";
        return cell;
  
    }else if (indexPath.row == 2)
    {
        RightViewCellView *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if(cell == nil)
        {
            
            NSArray *_nib=[[NSBundle mainBundle] loadNibNamed:@"RightViewCellView"
                                                        owner:self
                                                      options:nil];
            cell = [_nib objectAtIndex:0];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        
        [cell.contentView setBackgroundColor:[UIColor colorWithRed:0.12 green:0.16 blue:0.21 alpha:1.0]];
        
        [cell.StatusTrueButton setBackgroundImage:[UIImage imageNamed:@"StatusTrueNormal.png"] forState:UIControlStateNormal];
        [cell.StatusFalseButton setBackgroundImage:[UIImage imageNamed:@"StatusFalseNormal"] forState:UIControlStateNormal];
        cell.TextLabel.text = @"Vibration";
        
        return cell;
        
    }else if (indexPath.row == 3)
    {
        RightViewCellViewStytleTwo *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if(cell == nil)
        {
            
            NSArray *_nib=[[NSBundle mainBundle] loadNibNamed:@"RightViewCellViewStytleTwo"
                                                        owner:self
                                                      options:nil];
            cell = [_nib objectAtIndex:0];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        
        [cell.contentView setBackgroundColor:[UIColor colorWithRed:0.12 green:0.16 blue:0.21 alpha:1.0]];
        
        [cell.cellButton setBackgroundImage:[UIImage imageNamed:@"CellAccessory.png"] forState:UIControlStateNormal];

        cell.cellLabel.text = @"Help & FAQ";
        
        return cell;

            
    
    }

 
    return nil;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 70;
}

# pragma mark--

# pragma mark--initWork

- (void) initView
{    
    CGRect tableViewRect;
    {
        tableViewRect.origin.x = 0;
        tableViewRect.origin.y = 0;
        tableViewRect.size.width = 320;
        tableViewRect.size.height = 480;
    }    
    
    _tableView = [[UITableView alloc] initWithFrame:tableViewRect style:UITableViewStylePlain];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [_tableView setSeparatorColor:[UIColor colorWithRed:0.2 green:0.24 blue:0.29 alpha:1.0]];
    [_tableView setBackgroundColor:[UIColor colorWithRed:0.12 green:0.16 blue:0.21 alpha:1.0]];

    [self.view addSubview:_tableView];

    
}

- (void) initData
{
    _dataSourceArray = [[NSMutableArray alloc] initWithObjects:@"Alarm1",@"Alarm2",nil
                        ];
}

# pragma mark--


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
    [self initView];
    [self initData];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
