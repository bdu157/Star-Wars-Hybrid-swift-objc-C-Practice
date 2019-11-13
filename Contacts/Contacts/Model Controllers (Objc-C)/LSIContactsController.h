//
//  LSIContactsController.h
//  Contacts
//
//  Created by Dongwoo Pae on 11/13/19.
//  Copyright © 2019 Dongwoo Pae. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Contact;

NS_SWIFT_NAME(ContactsController) 
@interface LSIContactsController : NSObject

@property (nonatomic, readonly, nonnull) NSArray<Contact *> *contacts; //LSIContact -> bug

@end

