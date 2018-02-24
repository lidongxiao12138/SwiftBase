//
//  LDXHTTPTool.swift
//  LDX_SwiftBase
//
//  Created by cherry pu on 2018/2/23.
//  Copyright © 2018年 LDX. All rights reserved.
//

import UIKit

private let httpTool = LDXHTTPTool()
typealias success = () ->(Any)
typealias failure = () ->(NSError)
typealias response = () ->(LDXHTTPResponse)

class LDXHTTPTool: NSObject {
    class var sharedInstance: LDXHTTPTool {
        return httpTool
    }
    
}
