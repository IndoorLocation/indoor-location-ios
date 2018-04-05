#import <Foundation/Foundation.h>

@class ILIndoorLocationProvider;

@interface ILIndoorLocation : NSObject

@property (nonatomic, strong) NSString* providerName;
@property (nonatomic, assign) double latitude;
@property (nonatomic, assign) double longitude;
@property (nonatomic, strong) NSNumber* floor;
@property (nonatomic, assign) double accuracy;
@property (nonatomic, strong) NSDate* timestamp;

- (instancetype) initWithProvider:(ILIndoorLocationProvider*) provider latitude:(double) latitude longitude:(double) longitude floor:(NSNumber*) floor;

@end

