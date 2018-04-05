#import "ILIndoorLocation.h"
#import "ILIndoorLocationProvider.h"

@implementation ILIndoorLocation

- (instancetype) init {
    self = [super init];
    if (self) {
        _timestamp = [NSDate date];
    }
    return self;
}

- (instancetype) initWithProvider:(ILIndoorLocationProvider*) provider latitude:(double) latitude longitude:(double) longitude floor:(NSNumber*) floor
{
    self = [super init];
    if (self) {
        _providerName = [provider getName];
        _latitude = latitude;
        _longitude = longitude;
        _floor = floor;
        _timestamp = [NSDate date];
    }
    return self;
}

@end

