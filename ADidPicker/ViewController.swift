//
//  ViewController.swift
//  ADidPicker
//
//  Created by Ipsita Parida on 16/05/19.
//  Copyright © 2019 Ipsita Parida. All rights reserved.
//

import Cocoa
import CoreServices
import Collaboration


class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let defaultAuthority    = CSGetManagedIdentityAuthority().takeUnretainedValue()
        let identityClass       = kCSIdentityClassUser
        let query   = CSIdentityQueryCreate(nil, identityClass, defaultAuthority).takeRetainedValue()
        var error : Unmanaged<CFError>? = nil
        let status = CSIdentityQueryExecute(query, 0, &error)
        if status == true{
            let results = CSIdentityQueryCopyResults(query).takeRetainedValue()
            let resultsCount = CFArrayGetCount(results)
            var allUsersArray = [CBIdentity]()
            for idx in 0...resultsCount-1 {
                let identity    = unsafeBitCast(CFArrayGetValueAtIndex(results,idx),to: CSIdentity.self)
                let poxname = CSIdentityGetPosixName(identity)?.takeUnretainedValue()
                if let sname = poxname, let identityObject = CBIdentity(name: sname as String, authority: CBIdentityAuthority.managed() ){
                    let pname = identityObject.posixName
                    let sid = identityObject.uniqueIdentifier.uuidString //converted to string using uuidString
                    allUsersArray.append(identityObject)
                    print(pname , "--" ,sid)
                }
            }
        }
    }
    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

