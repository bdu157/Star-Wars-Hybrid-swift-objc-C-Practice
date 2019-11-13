//
//  LSIContactsController.m
//  Contacts
//
//  Created by Dongwoo Pae on 11/13/19.
//  Copyright © 2019 Dongwoo Pae. All rights reserved.
//

#import "LSIContactsController.h"
#import "Contacts-Swift.h"

@interface LSIContactsController ()

@property (nonatomic) NSMutableArray *internalContacts;

@end

@implementation LSIContactsController

- (instancetype)init
{
    self = [super init];
    if (self) {
        _internalContacts = [[NSMutableArray alloc] init];
        
        LSIContact *contact = [[LSIContact alloc] initWithName:@"Dongwoo" relationship:@"MySelf"];
        [_internalContacts addObject:contact];
    }
    return self;
}

-(NSArray *)contacts
{
    return _internalContacts.copy;
}

@end
