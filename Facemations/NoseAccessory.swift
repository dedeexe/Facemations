//
//  Accessory.swift
//  Facemations
//
//  Created by dede.exe on 24/04/16.
//  Copyright © 2016 dede.exe. All rights reserved.
//

import UIKit
import FaceTracker

public class NoseAccessory: Accessory
{
    
    var nose : [CGPoint] = []
    
    final var noseCornerDistance : CGFloat {
        return sqrt(pow(nose[0].x - nose[6].x, 2) + pow(nose[0].y - nose[6].y, 2))
    }
    
    final var noseCenter : CGPoint {
        return nose[3]
    }
    
    final var noseAngulation : CGFloat {
        return atan2(nose[6].y - nose[0].y, nose[6].x - nose[0].x)
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
        self.nose = points?.nose ?? []
    }
    
    public override func updatePosition()
    {
        super.updatePosition()
    }
}
