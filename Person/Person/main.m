//
//  main.m
//  Person
//
//  Created by Michael Kavouras on 6/21/15.
//  Copyright (c) 2015 Mike Kavouras. All rights reserved.
//


#import <Foundation/Foundation.h>

@interface Person : NSObject

-(void) setCity:(NSString *)city; //sets the property
-(NSString *)city; //gets the property

-(void) setPhoneNumber:(NSString *)phoneNumber; //sets the property
-(NSString *)phoneNumber; //gets the property

-(void) setName:(NSString *)name; //sets the property
-(NSString *)name; //gets the property

-(void) changePersonsName:(Person*)aPerson
                   toName:(NSString *)newName;

-(BOOL) checkSameCity:(Person *)aPerson;
-(Person *)haveChild;
-(void) claimChild:(Person *)childToClaim;


@end

@implementation Person {
    NSString *_city;
    NSString *_phoneNumber;
    NSString *_name;
    Person *_child;
}

//return/name/parameter type/parameter name
-(void) setCity:(NSString *)city {
    _city = city;
}


-(Person *)haveChild{
    Person *child =[[Person alloc] init];
    [child setCity:[self city]];
    [child setPhoneNumber: [self phoneNumber]];
    
    return child;
}

//return type
-(NSString *)city{
    return _city;
}

-(void) setPhoneNumber:(NSString *)phoneNumber{
    _phoneNumber = phoneNumber;
}

-(NSString *)phoneNumber; {
    return _phoneNumber;
}

-(void) setName:(NSString *)name{
    _name = name;
}

-(NSString *)name{
    return _name;
}

-(void) changePersonsName:(Person *)aPerson
                   toName:(NSString *)newName {
    [aPerson setName:newName];
}

-(BOOL) checkSameCity:(Person *)aPerson{
    if ([[aPerson city] isEqualToString:[self city]]){
        return YES;
    }else{
        return NO;
        
    }
    
}
-(void) claimChild:(Person *)childToClaim{
    if (_children == nil){
        _children = [[NSMutableArray alloc] init];
    }
    [_children addObject:childToClaim];
    _child = childToClaim;

}


@end




int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        Person *james = [[Person alloc] init];
        Person *christian = [[Person alloc] init];
        
        
        [james setName:@"James"];
        
        [james setCity:@"Brooklyn"];
        [christian setCity:@"South Orange"];
        
        BOOL citiesAreSame = [christian checkSameCity:james];
        NSLog(@"%d", citiesAreSame);
        
        [james setPhoneNumber:@"617-894-5866"];
        
        NSString *jamesName = [james name];
        
        NSLog(@"%@\n", jamesName);
        
        [james setName:@"Jorge"];
        
        NSLog(@"%@",[james name]);
        
        NSLog(@"%@", [james city]);
        
        [james setCity:@"New York"];
        NSLog(@"%@", [james city]);
        
        [christian changePersonsName:james toName:@"Philip"];
        
        NSLog(@"%@", [james name]);
        
        citiesAreSame = [christian checkSameCity:james];
        NSLog(@"%d", citiesAreSame);
        
        Person *christiansBaby = [christian haveChild];
        [christian claimChild:christiansBaby];
        NSLog(@"%@",[christiansBaby city]);
        [christian changePersonsName:christiansBaby toName:@"Abc"];
        
        // [changePersonsName setName:@""Indiana Jones"]  would be in implimentation
    }
    return 0;
}
