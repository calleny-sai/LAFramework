//
//  NSString+LAJson.m
//  Pods
//
//  Created by 胡恒恺 on 16/6/29.
//
//

#import "NSString+LAJson.h"

@implementation NSString (LAJson)

-(id)toObject{
    NSError *jsonError = nil;
    id json = [NSJSONSerialization JSONObjectWithData:[self dataUsingEncoding:NSUTF8StringEncoding]
                                              options:NSJSONReadingMutableContainers
                                                error:&jsonError];
    if (!jsonError) {
        return json;
    }
    return nil;
}

@end