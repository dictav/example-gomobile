//
//  ViewController.m
//  gomobile-objc
//
//  Created by 阿部慎太郎 on 2019/02/20.
//  Copyright © 2019 dictav. All rights reserved.
//
#import <Mobile/Mobile.h>
#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView * imgView;
@property (weak, nonatomic) IBOutlet UILabel * nameLabel;
@property (weak, nonatomic) IBOutlet UILabel * pointLabel;
@property (weak, nonatomic) IBOutlet UITextView *jsonView;

@property MobileUser *user;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSData *data = [MobileUserJSONExample dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    _user = MobileNewUser(data, &err);
    if (err != nil) {
        NSLog(@"err=%@", err);
        return;
    }
    [self updateUser];
}

- (void)updateUser {
    if (_user == nil) {
        return;
    }
    _imgView.image = [self imageWithString:_user.avatar];
    _nameLabel.text = _user.name;
    _pointLabel.text = [NSString stringWithFormat:@"%ld", _user.point];
    
    NSError *err;
    NSData *data = [_user toJSON:&err];
    if (err != nil) {
        NSLog(@"err=%@", err);
        return;
    }
    _jsonView.text = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
}

- (UIImage *)imageWithString: (NSString*) str {
    NSURL *url = [NSURL URLWithString:str];
    if (url == nil) {
        return nil;
    }
    NSData *data = [NSData dataWithContentsOfURL:url];
    if (data == nil) {
        return nil;
    }
    return [UIImage imageWithData:data];
}

- (IBAction)increatePoint {
    if (_user == nil) {
        return;
    }
    _user.point += 10;
    [self updateUser];
}

- (IBAction)decreasePoint {
    if (_user == nil) {
        return;
    }
    _user.point -= 10;
    [self updateUser];
}
@end
