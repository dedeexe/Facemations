//
//  Accessory.swift
//  Facemations
//
//  Created by dede.exe on 24/04/16.
//  Copyright © 2016 dede.exe. All rights reserved.
//

import UIKit
import FaceTracker

public class JohnLennonGlassAccessory: GlassAccessory
{
    init()
    {
        super.init(imageNamed: "glass-john-lennon")
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func injectPoints(points: FacePoints?) {
        super.injectPoints(points)
    }
    
    public override func updatePosition()
    {
        super.updatePosition()

        let width = eyesCornerDistance * 1.3
        let height = (imageSize.height / imageSize.width) * width
        
        self.transform = CGAffineTransformIdentity
        self.frame = CGRect(x: eyesCenter.x - width / 2,
                            y: eyesCenter.y - height / 2,
                            width: width,
                            height: height)
        
        self.transform = CGAffineTransformMakeRotation(eyesAngulation)
        
    }
    
}
