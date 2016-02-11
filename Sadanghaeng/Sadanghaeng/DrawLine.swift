//
//  DrawLine.swift
//  Sadanghaeng
//
//  Created by garin on 2016. 2. 11..
//  Copyright © 2016년 Sadanghaeng. All rights reserved.
//

import UIKit

class DrawLine: UIView {
    override func drawRect(rect: CGRect){
        let context = UIGraphicsGetCurrentContext()
        CGContextSetLineWidth(context, 1.0)
//        let colorSpace = CGColorSpaceCreateDeviceRGB()
//        let components: [CGFloat] = [0.0, 0.0, 1.0, 1.0]
//        let color = CGColorCreate(colorSpace, components)
//        CGContextSetStrokeColor(context, UIColor.purpleColor().CGColor)
//
        CGContextMoveToPoint(context, 16, 50)
        CGContextAddLineToPoint(context, 350, 50)
        
        CGContextStrokePath(context)
    }
}
