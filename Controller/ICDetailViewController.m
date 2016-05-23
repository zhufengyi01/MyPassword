//
//  ICDetailViewController.m
//  Passwordmanager
//
//  Created by 朱封毅 on 20/05/16.
//  Copyright © 2016年 taihe. All rights reserved.
//

#import "ICDetailViewController.h"

@interface ICDetailViewController ()<ICLogoTableViewCellDelegate,UIImagePickerControllerDelegate>
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

@property(nonatomic,strong) ICInputTableViewCell *platformPassCell;


@end

@implementation ICDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
    [self createNavigation];
    
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
        _platformNameCell.inputTextField.enabled = NO;
        _platformNameCell.inputTextField.placeholder = @"please input platform name";

    }
    return _platformNameCell;
}

-(ICInputTableViewCell *)platformPassCell
{
    if (!_platformPassCell) {
        
        [self registerCellWithNibName:NSStringFromClass([ICInputTableViewCell class]) reuseIdentifier:@"ICInputTableViewPassCell"];
        _platformPassCell = [self.tableView dequeueReusableCellWithIdentifier:@"ICInputTableViewPassCell"];
        _platformPassCell.inputTextField.enabled = NO;
        _platformPassCell.inputTextField.placeholder = @"please input platform password";

    }
    return _platformPassCell;
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
 
}
#pragma mark 编辑状态
-(void)edit
{
    _logoCell.logoBtn.enabled = YES;
    _platformPassCell.inputTextField.enabled = YES;
    _platformNameCell.inputTextField.enabled = YES;
    [self.platformNameCell.inputTextField becomeFirstResponder];    
   
}
#pragma mark 完成状态
-(void)done
{
    if (self.platformNameCell.inputTextField.text.length==0) {
        [SVProgressHUD showErrorWithStatus:@"please input platform name"];
        return;
    }
    if (self.platformPassCell.inputTextField.text.length==0) {
        
        [SVProgressHUD showErrorWithStatus:@"please input platform password"];
        return;
    }

    //存储用户信息
    KeyModel *model = [KeyModel new];
    model.platformName = self.platformNameCell.inputTextField.text;
    model.logoImage = self.logoCell.logoImageView.image;
    model.platformPassword = self.platformPassCell.inputTextField.text;
    
    [self.navigationController popViewControllerAnimated:YES];
    
}

#pragma mark Delegate

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row==0) {
        return 200;
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
        return self.platformPassCell;
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



@end
