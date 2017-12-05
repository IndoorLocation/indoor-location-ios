#import <Foundation/Foundation.h>

@interface ILIndoorLocation : NSObject

@property (nonatomic, assign) NSString* providerName;
@property (nonatomic, assign) double latitude;
@property (nonatomic, assign) double longitude;
@property (nonatomic, strong) NSNumber* floor;
@property (nonatomic, assign) double accuracy;
@property (nonatomic, strong) NSDate* timestamp;

@end
