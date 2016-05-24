//
//  ICDetailViewController.m
//  Passwordmanager
//
//  Created by 朱封毅 on 20/05/16.
//  Copyright © 2016年 taihe. All rights reserved.
//

#import "ICDetailViewController.h"

@interface ICDetailViewController ()<ICLogoTableViewCellDelegate,UIImagePickerControllerDelegate,ICButtonTableViewCellDelegate>
{
   UIImagePickerController *imagePicker;
    
    UIImage *logoImage;
}
/**
 *  右侧编辑按钮
 */
@property(nonatomic,strong)  UIButton *rightBarItem;

/**
 *   是否正在编辑编辑
 */
@property(nonatomic,assign) BOOL isEditing;


@property(nonatomic,strong) ICLogoTableViewCell *logoCell;

@property(nonatomic,strong) ICInputTableViewCell *platformNameCell;

@property(nonatomic,strong) ICInputTableViewCell *userNameCell;

@property(nonatomic,strong) ICInputTableViewCell *platformPassCell;

@property(nonatomic,strong)ICButtonTableViewCell *comformCell;


@end

@implementation ICDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
    [self createNavigation];
    logoImage = self.model.logoImage;
    
}

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
    
    NSLog(@"viewWillAppear");
}

#pragma mark Getter Megthod

-(ICLogoTableViewCell *)logoCell{
    if (!_logoCell) {
        
        [self registerCellWithNibName:NSStringFromClass([ICLogoTableViewCell class]) reuseIdentifier:NSStringFromClass([ICLogoTableViewCell class])];
        _logoCell = [self.tableView dequeueReusableCellWithIdentifier:NSStringFromClass([ICLogoTableViewCell class])];
        _logoCell.logoImageView.image = self.model.logoImage;
        _logoCell.delegate = self;
        _logoCell.logoBtn.enabled = NO;
    }
    return _logoCell;
}

-(ICInputTableViewCell *)platformNameCell
{
    if (!_platformNameCell) {
        
        [self registerCellWithNibName:NSStringFromClass([ICInputTableViewCell class]) reuseIdentifier:@"ICInputTableViewNameCell"];
        
        _platformNameCell = [self.tableView dequeueReusableCellWithIdentifier:@"ICInputTableViewNameCell"];
        _platformNameCell.inputTextField.text = self.model.platformName;
        _platformNameCell.inputTextField.enabled = NO;
        _platformNameCell.inputTextField.placeholder = @"please input platform name";
        [_platformNameCell.userCopyBtn addTarget:self action:@selector(copyPlatformName) forControlEvents:UIControlEventTouchUpInside];

    }
    return _platformNameCell;
}


-(ICInputTableViewCell *)userNameCell{
    if (!_userNameCell) {
        
        [self registerCellWithNibName:NSStringFromClass([ICInputTableViewCell class]) reuseIdentifier:@"ICInputTableViewUserNameCell"];
        _userNameCell = [self.tableView dequeueReusableCellWithIdentifier:@"ICInputTableViewUserNameCell"];
        _userNameCell.inputTextField.text = self.model.userName;
        _userNameCell.inputTextField.enabled = NO;
        _userNameCell.inputTextField.placeholder = @"please input userName";
        [_userNameCell.userCopyBtn addTarget:self action:@selector(copyUserName) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _userNameCell;
}

-(ICInputTableViewCell *)platformPassCell
{
    if (!_platformPassCell) {
        
        [self registerCellWithNibName:NSStringFromClass([ICInputTableViewCell class]) reuseIdentifier:@"ICInputTableViewPassCell"];
        _platformPassCell = [self.tableView dequeueReusableCellWithIdentifier:@"ICInputTableViewPassCell"];
        _platformPassCell.inputTextField.text = self.model.platformPassword;
        _platformPassCell.inputTextField.enabled = NO;
        _platformPassCell.inputTextField.placeholder = @"please input platform password";
        [_platformPassCell.userCopyBtn addTarget:self action:@selector(copyPassword) forControlEvents:UIControlEventTouchUpInside];

    }
    return _platformPassCell;
}



-(ICButtonTableViewCell *)comformCell
{
    if (!_comformCell) {
        
        [self registerCellWithNibName:NSStringFromClass([ICButtonTableViewCell class]) reuseIdentifier:@"ICButtonTableViewCell"];
        _comformCell = [self.tableView dequeueReusableCellWithIdentifier:@"ICButtonTableViewCell"];
        _comformCell.delegate = self;
        
    }
    return _comformCell;
}

#pragma mark Privite Method
-(void)createNavigation
{
    self.navigationItem.title = @"Password Detail";

    self.rightBarItem = [UIButton buttonWithType:UIButtonTypeCustom];
    self.rightBarItem.frame = CGRectMake(0, 0, 40, 30);
    [self.rightBarItem setTitle:@"Edit"  forState:UIControlStateNormal];
    [self.rightBarItem setTitleColor:COLOR_TITLE_TWO forState:UIControlStateNormal];
    [self.rightBarItem addTarget:self action:@selector(rightNavigationHandle) forControlEvents:UIControlEventTouchUpInside];
    self.rightBarItem.contentMode = UIViewContentModeRight;
    [self.rightBarItem setTitleEdgeInsets:UIEdgeInsetsMake(0, 10, 0, -10)];
    self.rightBarItem.titleLabel.font =  KBAR_FONT(14);
    
    self.navigationItem.rightBarButtonItem =[[UIBarButtonItem alloc] initWithCustomView:self.rightBarItem];
}
#pragma mark 点击编辑
-(void)rightNavigationHandle
{
    [self.rightBarItem  setTitle:@"Save" forState:UIControlStateNormal];
    if (self.isEditing) {
        
        [self done];
        
    }else{
        //编辑状态
        [self edit];
        self.isEditing = YES;
    }
    [self.tableView reloadData];

}
#pragma mark 编辑状态
-(void)edit
{
    _logoCell.logoBtn.enabled = YES;
    _userNameCell.inputTextField.enabled = YES;
    _platformPassCell.inputTextField.enabled = YES;
    _platformNameCell.inputTextField.enabled = YES;
    
    //隐藏copy
    _userNameCell.userCopyBtn.hidden = YES;
    _platformNameCell.userCopyBtn.hidden = YES;
    _platformPassCell.userCopyBtn.hidden = YES;
    [self.platformNameCell.inputTextField becomeFirstResponder];

   
}
#pragma mark 完成状态
-(void)done
{
    if (self.platformNameCell.inputTextField.text.length==0) {
        [SVProgressHUD showErrorWithStatus:@"please input platform name" maskType:SVProgressHUDMaskTypeBlack];
        return;
    }
    if (self.userNameCell.inputTextField.text.length==0) {
        
        [SVProgressHUD showErrorWithStatus:@"please input user name" maskType:SVProgressHUDMaskTypeBlack];
        return;
        
    }

    if (self.platformPassCell.inputTextField.text.length==0) {
        
        [SVProgressHUD showErrorWithStatus:@"please input user password" maskType:SVProgressHUDMaskTypeBlack];
        return;
    }

    //存储用户信息
    KeyModel *model = [KeyModel new];
    model.platformName = self.platformNameCell.inputTextField.text;
    model.logoImage = logoImage;
    model.userName =  self.userNameCell.inputTextField.text;
    model.platformPassword = self.platformPassCell.inputTextField.text;
    
    
    NSString *keyPath = [userPasswordKey stringByAppendingPathComponent:@"userKey"];
    NSArray *keyList = [NSKeyedUnarchiver unarchiveObjectWithFile:keyPath];
    
    NSMutableArray *tempArr = [NSMutableArray arrayWithArray:keyList];

    
    [tempArr replaceObjectAtIndex:self.index withObject:model];
    
    BOOL y = [NSKeyedArchiver archiveRootObject:tempArr toFile:keyPath];

    if (y) {
        [self.navigationController popViewControllerAnimated:YES];
    }
    
    
}

#pragma mark 复制功能
-(void)copyPlatformName
{
    if (self.platformNameCell.inputTextField.text.length==0) {
        
        [SVProgressHUD showErrorWithStatus:@"copy fail" maskType:SVProgressHUDMaskTypeBlack];
        return;
    }
    UIPasteboard *paste = [UIPasteboard generalPasteboard];
    paste.string = self.platformNameCell.inputTextField.text;
    [SVProgressHUD showSuccessWithStatus:@"copy success" maskType:SVProgressHUDMaskTypeBlack];
   
}

-(void)copyUserName
{
    if (self.userNameCell.inputTextField.text.length==0) {
        
        [SVProgressHUD showErrorWithStatus:@"copy fail" maskType:SVProgressHUDMaskTypeBlack];
        return;
    }
    UIPasteboard *paste = [UIPasteboard generalPasteboard];
    paste.string = self.userNameCell.inputTextField.text;
    [SVProgressHUD showSuccessWithStatus:@"copy success" maskType:SVProgressHUDMaskTypeBlack];
    
}

-(void)copyPassword
{
 
    if (self.platformPassCell.inputTextField.text.length==0) {
        
        [SVProgressHUD showErrorWithStatus:@"copy fail" maskType:SVProgressHUDMaskTypeBlack];
        return;
    }
    UIPasteboard *paste = [UIPasteboard generalPasteboard];
    paste.string = self.platformPassCell.inputTextField.text;
    [SVProgressHUD showSuccessWithStatus:@"copy success" maskType:SVProgressHUDMaskTypeBlack];

}
#pragma mark Delegate

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (self.editing) {
        return 5;
    }
    return 4;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row==0) {
        return 200;
    } else if(indexPath.row==4)
    {
        return 120;
    }
    return 60.0f;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.row==0) {
        
        return self.logoCell;
        
    }else if(indexPath.row==1)
    {
        return self.platformNameCell;
        
    }else if(indexPath.row==2)
    {
        return self.userNameCell;
    }
     else if(indexPath.row==3)
    {
        return self.platformPassCell;
        
    }else if(indexPath.row==4)
    {
        return self.comformCell;
    }
    return [UITableViewCell new];
}


-(void)logoTableViewCellChooseImageButtonClick
{
    
    imagePicker = [[UIImagePickerController alloc] init];
    imagePicker.delegate = self;
    imagePicker.navigationBar.tintColor = COLOR_TITLE_ONE;
    imagePicker.allowsEditing = YES;
    imagePicker.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
    NSDictionary *titleAttributes = [NSDictionary dictionaryWithObjectsAndKeys:RGB(30, 30, 30),NSForegroundColorAttributeName,KMAIN_FONT(18),NSFontAttributeName, nil];
    [imagePicker.navigationBar setTitleTextAttributes:titleAttributes];
    
    [self presentViewController:imagePicker animated:YES completion:nil];
}

#pragma mark UIImagePickerControllerDelegate
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editingInfo:(nullable NSDictionary<NSString *,id> *)editingInfo NS_DEPRECATED_IOS(2_0, 3_0)
{
    
    self.logoCell.logoImageView.image = image;
    logoImage = image;
    
    [picker dismissViewControllerAnimated:YES completion:nil];
    
}

#pragma mark ICButtonTableViewCellDelegate
#pragma mark 点击删除
-(void)buttonTableViewCellClick;
{
    
    [WCAlertView showAlertWithTitle:@"Do you really want to delete it" message:nil customizationBlock:^(WCAlertView *alertView) {
         
     } completionBlock:^(NSUInteger buttonIndex, WCAlertView *alertView) {
         if (buttonIndex==1) {
             //删除
             NSString *keyPath = [userPasswordKey stringByAppendingPathComponent:@"userKey"];
             NSArray *keyList = [NSKeyedUnarchiver unarchiveObjectWithFile:keyPath];
             
             NSMutableArray *tempArr = [NSMutableArray arrayWithArray:keyList];
             [tempArr removeObjectAtIndex:self.index];
             
            BOOL y = [NSKeyedArchiver archiveRootObject:tempArr toFile:keyPath];
             
             [SVProgressHUD showSuccessWithStatus:@"delete success" maskType:SVProgressHUDMaskTypeBlack];
             if (y) {
                 
                 dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                     
                     [self.navigationController popViewControllerAnimated:YES];
                 });
             }
         }
         
     } cancelButtonTitle:@"cancle" otherButtonTitles:@"yes", nil];
}

@end
