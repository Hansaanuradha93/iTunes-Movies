//
//  String+Extensions.swift
//  iTunes Movies
//
//  Created by Hansa Anuradha on 3/7/19.
//  Copyright © 2019 Hansa Anuradha. All rights reserved.
//

import Foundation

extension String {
    func truncate(length : Int, trailing : String = "..") -> String {
        return self.count > length ? self.prefix(length) + trailing : self
    }
}

