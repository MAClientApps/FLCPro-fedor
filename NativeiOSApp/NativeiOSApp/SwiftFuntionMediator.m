//
//  SwiftFuntionMediator.m
//  NativeiOSApp
//
//  Created by  Vishnu MobiBox on 16/07/21.
//  Copyright © 2021 unity. All rights reserved.
//

#import "SwiftFuntionMediator.h"
@import MobFlowiOS;
@import FirebaseAnalytics;

@interface SwiftFuntionMediator()<MobiFlowDelegate> {
    
}

@property (strong,nonatomic) MobiFlowSwift *mobflow;
@end

@implementation SwiftFuntionMediator

+(id)defaultManager{

    static SwiftFuntionMediator *sharedManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedManager = [[SwiftFuntionMediator alloc]init];
    });
    return sharedManager;
}

-(instancetype)init{
    
    if(self = [super init]){

    }
    return self;
}

+(void)callinitMobflow {
    [[SwiftFuntionMediator defaultManager] initializeMobFlowSDK];
}

+(NSString*)fetchSname {
   return [[SwiftFuntionMediator defaultManager] fetchStitleString];
}

+(BOOL)showPortalButton {
    return [[SwiftFuntionMediator defaultManager] showPButton];
}

+(void)showPremiumPortal {
    return [[SwiftFuntionMediator defaultManager] showPortalContent];
}

+(BOOL)showUnityAds {
    return [[SwiftFuntionMediator defaultManager] showAds];
}

#pragma mark : --------- :  Instance Method


-(void)initializeMobFlowSDK {
    
    NSString* faid = @"";
    faid = FIRAnalytics.appInstanceID;
    
    
 
    
    
// self.mobflow= [[MobiFlowSwift alloc] initWithIsAppmetrica:0 isBranch:0 isAdjust:1 isDeeplinkURL:0 scheme:@"footballextreme://" endpoint:@"https://duhguvywsjlhs.cloudfront.net" adjAppToken:@"wubkapxny9kw" firebaseToken:@"6tndeq" branchKey:@"" appmetricaKey:@" " initDelegate:self isUnityApp:1 faid:faid];
    
    self.mobflow=[[MobiFlowSwift alloc]initWithIsAppmetrica:0 isAdjust:1 isDeeplinkURL:0 scheme:@"flcpro://" endpoint:@"https://d3eio189c0ex5y.cloudfront.net/" adjAppToken:@"lz44xtkxznr4" adjEventToken:@"ojckb3"   appmetricaKey:@""  initDelegate:self isUnityApp:1];
    
}

-(NSString*)fetchStitleString {
    return [self.mobflow getSTitle];
}

-(BOOL)showPButton {
    return [self.mobflow shouldShowPButton];
}

-(BOOL)showAds {
    return [self.mobflow showAds];
}

-(void)showPortalContent {
    return [self.mobflow openWebView];
}

- (void)presentWithDic:(NSDictionary<NSString *,id> * _Nonnull)dic {
    NSLog(@"delegate funtion called");

    [[NSNotificationCenter defaultCenter]postNotificationName:@"receiveNotificationFromMobFlowSDK" object:nil];
}

@end
