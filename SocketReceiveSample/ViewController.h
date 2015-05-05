//
//  ViewController.h
//  SocketReceiveSample
//
//  Created by Cherry_Cheng on 2015/4/28.
//  Copyright (c) 2015年 cwt100. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *udpButton;
@property (weak, nonatomic) IBOutlet UIButton *tcpButton;
@property (weak, nonatomic) IBOutlet UIButton *clearButton;
@property (weak, nonatomic) IBOutlet UIButton *tcpClientButton;

@property (weak, nonatomic) IBOutlet UITextView *receiveDataTextView;

@end

