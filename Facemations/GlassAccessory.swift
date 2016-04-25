//
//  Accessory.swift
//  Facemations
//
//  Created by dede.exe on 24/04/16.
//  Copyright © 2016 dede.exe. All rights reserved.
//

import UIKit
import FaceTracker

public class GlassAccessory: Accessory
{
    
    var leftEye : [CGPoint] = []
    var rightEye : [CGPoint] = []
    
    final var eyesCornerDistance : CGFloat {
        return sqrt(pow(leftEye[0].x - rightEye[5].x, 2) + pow(leftEye[0].y - rightEye[5].y, 2))
    }
    
    final var eyesCenter : CGPoint {
        return CGPoint(x: (leftEye[0].x + rightEye[5].y) / 2,
                       y: (leftEye[0].y + rightEye[5].y) / 2 )
    }
    
    final var eyesAngulation : CGFloat {
        return atan2(rightEye[5].y - leftEye[0].y, rightEye[5].x - leftEye[0].x)
    }
    
    override init(imageNamed:String)
    {
        super.init(imageNamed: imageNamed)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func injectPoints(points: FacePoints?) {
        super.injectPoints(points)
        
        self.leftEye = points?.leftEye ?? []
        self.rightEye = points?.rightEye ?? []
    }
    
    public override func updatePosition()
    {
        super.updatePosition()
    }
}
