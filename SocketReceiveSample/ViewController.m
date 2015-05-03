//
//  ViewController.m
//  SocketReceiveSample
//
//  Created by Cherry_Cheng on 2015/4/28.
//  Copyright (c) 2015年 simplo. All rights reserved.
//

#import "ViewController.h"
#import "UDPObject.h"
#import "TCPObject.h"

@interface ViewController ()<UDPObjectDelegate, TCPObjectDelegate>

@end

@implementation ViewController {
    UDPObject *udpObject;
    TCPObject *tcpObject;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.udpButton addTarget:self action:@selector(udpReceive:) forControlEvents:UIControlEventTouchUpInside];
    [self.tcpButton addTarget:self action:@selector(tcpReceive:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)clear {
    
    if (udpObject != nil) {
        [udpObject closeSocket];
    }
    
    udpObject = nil;
    tcpObject = nil;
    
    self.receiveDataTextView.text = @"Start";
}

- (void)udpReceive:(id)sender {
    
    [self clear];
    
    udpObject = [[UDPObject alloc] init];
    udpObject.delegate = self;
}

- (void)udpObject:(UDPObject *)udpObject didReceiveData:(NSData *)receiveData {
    NSLog(@"udpObject receive: %@", receiveData);
    
    NSString *xmlString = [[NSString alloc] initWithData:receiveData encoding:NSUTF8StringEncoding];
    [self.receiveDataTextView insertText:[NSString stringWithFormat:@"%@\n", xmlString]];
}

- (void)tcpReceive:(id)sender {
    
    [self clear];
    
    tcpObject = [[TCPObject alloc] init];
    tcpObject.delegate = self;
}

- (void)tcpObject:(TCPObject *)tcpObject didReceiveData:(NSData *)receiveData {
    
    NSLog(@"tcpObject receive: %@", receiveData);
    
    NSString *xmlString = [[NSString alloc] initWithData:receiveData encoding:NSUTF8StringEncoding];
    [self.receiveDataTextView insertText:[NSString stringWithFormat:@"%@\n", xmlString]];
}

@end
