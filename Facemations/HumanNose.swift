//
//  HumanNose.swift
//  Facemations
//
//  Created by dede.exe on 01/05/16.
//  Copyright © 2016 dede.exe. All rights reserved.
//

import Foundation
import FaceTracker
import QuartzCore


public class HumanAccessory: NoseAccessory
{
    init()
    {
        super.init(imageNamed: "human-nose")
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
        
        let width = noseCornerDistance * 1.5
        let height = width
        
        self.transform = CGAffineTransformIdentity
        self.frame = CGRect(x: noseCenter.x - width / 2,
                            y: noseCenter.y - height / 1.3,
                            width: width,
                            height: height)
        
        self.transform = CGAffineTransformMakeRotation(noseAngulation)
        
    }
    
}