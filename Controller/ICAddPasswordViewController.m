//
//  ICAddPasswordViewController.m
//  Passwordmanager
//
//  Created by 朱封毅 on 20/05/16.
//  Copyright © 2016年 taihe. All rights reserved.
//

#import "ICAddPasswordViewController.h"

@interface ICAddPasswordViewController ()<ICLogoTableViewCellDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>{
    
    UIImagePickerController *imagePicker;
    UIImage *logoImage;
}
@property(nonatomic,strong) ICLogoTableViewCell *logoCell;

@property(nonatomic,strong) ICInputTableViewCell *platformNameCell;

@property(nonatomic,strong) ICInputTableViewCell *userNameCell;

@property(nonatomic,strong) ICInputTableViewCell *platformPassCell;

@property(nonatomic,strong) ICInputTableViewCell *platformPassCell2;


@end

@implementation ICAddPasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    [self createNavigation];

}


#pragma mark Getter Megthod

-(ICLogoTableViewCell *)logoCell{
    if (!_logoCell) {
        
        [self registerCellWithNibName:NSStringFromClass([ICLogoTableViewCell class]) reuseIdentifier:NSStringFromClass([ICLogoTableViewCell class])];
        _logoCell = [self.tableView dequeueReusableCellWithIdentifier:NSStringFromClass([ICLogoTableViewCell class])];
        _logoCell.delegate = self;
        [_logoCell.logoBtn setBackgroundImage: [UIImage imageNamed:@"addlogo"] forState:UIControlStateNormal];
    }
    return _logoCell;
}

-(ICInputTableViewCell *)platformNameCell
{
    if (!_platformNameCell) {
     
        [self registerCellWithNibName:NSStringFromClass([ICInputTableViewCell class]) reuseIdentifier:@"ICInputTableViewNameCell"];

        _platformNameCell = [self.tableView dequeueReusableCellWithIdentifier:@"ICInputTableViewNameCell"];
        _platformNameCell.inputTextField.placeholder = @"please input platform name";
        _platformNameCell.userCopyBtn.hidden = YES;
    }
    return _platformNameCell;
}

-(ICInputTableViewCell *)userNameCell{
    if (!_userNameCell) {
        
        [self registerCellWithNibName:NSStringFromClass([ICInputTableViewCell class]) reuseIdentifier:@"ICInputTableViewUserNameCell"];
        
        _userNameCell = [self.tableView dequeueReusableCellWithIdentifier:@"ICInputTableViewUserNameCell"];
        _userNameCell.inputTextField.placeholder = @"please input userName";
        _userNameCell.userCopyBtn.hidden = YES;
        _userNameCell.logoImageView.image = [UIImage imageNamed:@"trAccount"];

    }
    return _userNameCell;
}

-(ICInputTableViewCell *)platformPassCell
{
    if (!_platformPassCell) {
        
        [self registerCellWithNibName:NSStringFromClass([ICInputTableViewCell class]) reuseIdentifier:@"ICInputTableViewPassCell"];
        _platformPassCell = [self.tableView dequeueReusableCellWithIdentifier:@"ICInputTableViewPassCell"];
        _platformPassCell.inputTextField.placeholder = @"please input user password";
        _platformPassCell.userCopyBtn.hidden = YES;
        _platformPassCell.logoImageView.image = [UIImage imageNamed:@"trPassword"];
    }
    return _platformPassCell;
}

-(ICInputTableViewCell *)platformPassCell2
{
    if (!_platformPassCell2) {
        
        [self registerCellWithNibName:NSStringFromClass([ICInputTableViewCell class]) reuseIdentifier:@"ICInputTableViewPassCell2"];
        _platformPassCell2 = [self.tableView dequeueReusableCellWithIdentifier:@"ICInputTableViewPassCell2"];
        _platformPassCell2.inputTextField.placeholder = @"please input user password 2";
        _platformPassCell2.userCopyBtn.hidden = YES;
        _platformPassCell2.logoImageView.image = [UIImage imageNamed:@"trPassword"];
    }
    return _platformPassCell2;
}


#pragma mark Privite Method
-(void)createNavigation{
    
    self.navigationItem.title = @"add Password";
    
    UIBarButtonItem *barItem  = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(rightNavigationHandle)];
    barItem.tintColor = COLOR_TITLE_ONE;
    self.navigationItem.rightBarButtonItem = barItem;
    
    UIBarButtonItem *leftBarItem  = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(leftNavigationHandle)];
    barItem.tintColor = COLOR_TITLE_ONE;
    self.navigationItem.leftBarButtonItem = leftBarItem;

    
}

#pragma mark 存储密码
-(void)leftNavigationHandle
{
    [self dismissViewControllerAnimated:YES completion:nil];
    
}
-(void)rightNavigationHandle{
    
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

    NSString *keyPath = [userPasswordKey stringByAppendingPathComponent:@"userKey"];
    NSArray *keyList = [NSKeyedUnarchiver unarchiveObjectWithFile:keyPath];
    
    KeyModel *model  =[KeyModel new];
    
    if (logoImage) {
        
        model.logoImage =  logoImage;
    }
    
    model.platformName  = self.platformNameCell.inputTextField.text;
    model.userName =  self.userNameCell.inputTextField.text;
    model.platformPassword  = self.platformPassCell.inputTextField.text;
    model.platformPassword2 = self.platformPassCell2.inputTextField.text;
    if (!model.platformPassword2) {
        model.platformPassword2 = @"";
    }
    
    NSMutableArray *tempArr  = [NSMutableArray arrayWithArray:keyList];
    [tempArr addObject:model];
        
    
    [NSKeyedArchiver archiveRootObject:tempArr toFile:keyPath];

    [self dismissViewControllerAnimated:YES completion:nil];
}


#pragma mark Delegate 

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 5;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row==0) {
        return 200;
    }
    return 60.0f;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
 
    if (indexPath.row==0) {
        
        return self.logoCell;
        
    }else if(indexPath.row==1){
        
        return self.platformNameCell;
        
    }else if(indexPath.row==2){
        
        return self.userNameCell;
    }
    else if(indexPath.row==3){
        
        return self.platformPassCell;
        
    }else if(indexPath.row == 4){
        
        return self.platformPassCell2;
    }
    return [UITableViewCell new];
}


-(void)logoTableViewCellChooseImageButtonClick{
    
    imagePicker = [[UIImagePickerController alloc] init];
    imagePicker.delegate = self;
    imagePicker.navigationBar.tintColor = COLOR_TITLE_ONE;
    imagePicker.allowsEditing = YES;
    imagePicker.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
    NSDictionary *titleAttributes = [NSDictionary dictionaryWithObjectsAndKeys:RGB(30, 30, 30),NSForegroundColorAttributeName,KMAIN_FONT(18),NSFontAttributeName, nil];
    [imagePicker.navigationBar setTitleTextAttributes:titleAttributes];

    [self presentViewController:imagePicker animated:YES completion:nil];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editingInfo:(nullable NSDictionary<NSString *,id> *)editingInfo NS_DEPRECATED_IOS(2_0, 3_0){
 
    logoImage = image;
    [self.logoCell.logoBtn setBackgroundImage:logoImage forState:UIControlStateNormal];
    [picker dismissViewControllerAnimated:YES completion:^{
       
        
    }];
    
}


@end
