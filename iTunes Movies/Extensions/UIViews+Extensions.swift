//
//  UIViews+Extensions.swift
//  iTunes Movies
//
//  Created by Hansa Anuradha on 3/7/19.
//  Copyright © 2019 Hansa Anuradha. All rights reserved.
//

import UIKit


extension UIView {
    func applyRoundedCorners(radius : CGFloat) {
        self.layer.cornerRadius = radius
        self.layer.masksToBounds = true
    }
}
