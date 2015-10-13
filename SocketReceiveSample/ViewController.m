//
//  ViewController.m
//  SocketReceiveSample
//
//  Created by Cherry_Cheng on 2015/4/28.
//  Copyright (c) 2015年 cwt100. All rights reserved.
//

#import "ViewController.h"
#import "UDPObject.h"
#import "TCPObject.h"
#import "TCPClientObject.h"
#import "HttpGet.h"

@interface ViewController ()<UDPObjectDelegate, TCPObjectDelegate, TCPClientObjectDelegate>

@end

@implementation ViewController {
    UDPObject *udpObject;
    TCPObject *tcpObject;
    TCPClientObject *tcpClientObject;
    HttpGet *httpGet;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.udpButton addTarget:self action:@selector(udpReceive:) forControlEvents:UIControlEventTouchUpInside];
    [self.tcpButton addTarget:self action:@selector(tcpReceive:) forControlEvents:UIControlEventTouchUpInside];
    [self.tcpClientButton addTarget:self action:@selector(tcpClientReceive:) forControlEvents:UIControlEventTouchUpInside];
    [self.httpGetButton addTarget:self action:@selector(httpGet:) forControlEvents:UIControlEventTouchUpInside];
    [self.clearButton addTarget:self action:@selector(clearTextView:) forControlEvents:UIControlEventTouchUpInside];
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
    tcpClientObject = nil;
    httpGet = nil;
    
    self.receiveDataTextView.text = @"Start";
}

- (void)clearTextView:(id)sender {
    self.receiveDataTextView.text = nil;
    
    [tcpClientObject disconnect];
    
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

- (void)tcpClientReceive:(id)sender {
    
    [self clear];
    
    tcpClientObject = [[TCPClientObject alloc] init];
    tcpClientObject.delegate = self;
}

- (void)tcpClientObject:(TCPClientObject *)tcpClientObject didReceiveData:(NSData *)receiveData {
    
    NSLog(@"tcpClientObject receive: %@", receiveData);
    
    NSString *xmlString = [[NSString alloc] initWithData:receiveData encoding:NSUTF8StringEncoding];
    [self.receiveDataTextView insertText:[NSString stringWithFormat:@"%@\n", xmlString]];
}

- (void)httpGet:(id)sender {
    
    httpGet = [[HttpGet alloc] init];
}

@end
