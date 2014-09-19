//
//  CandyDetailViewController.m
//  CandyLand
//
//  Created by Luke Solomon on 9/17/14.
//  Copyright (c) 2014 Luke Solomon. All rights reserved.
//

#import "CandyDetailViewController.h"
#import "Candy.h"

@interface CandyDetailViewController ( )
@property (weak, nonatomic) IBOutlet UITextView *contentTextView;
@property (weak, nonatomic) IBOutlet UITextField *titleTextField;



@end

@implementation CandyDetailViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
    self.titleTextField.text = self.candy.title;
    self.contentTextView.text = self.candy.content;
}

- (void)viewWillDisappear:(BOOL)animated {
    
    [super viewWillDisappear:animated];
    
    self.candy.title = self.titleTextField.text;
    self.candy.content = self.contentTextView.text;
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
