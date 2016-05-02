//
//  ViewController.swift
//  Facemations
//
//  Created by dede.exe on 24/04/16.
//  Copyright © 2016 dede.exe. All rights reserved.
//

import UIKit
import FaceTracker

class ViewController: UIViewController {
    
    weak var faceTrackerViewController : FaceTrackerViewController?
    
    var accessories : [Accessory] = [] {
        willSet {
            for accessory in accessories {
                accessory.removeFromSuperview()
            }
        }
        
        didSet {
            for accessory in accessories {
                self.view.addSubview(accessory)
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        faceTrackerViewController!.startTracking { 
            NSLog("Tracking Initiated")
        }
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "faceTrackerEmbed" {
            faceTrackerViewController = segue.destinationViewController as? FaceTrackerViewController
            faceTrackerViewController?.delegate = self
        }
    }

}


//MARK: - Actions
extension ViewController {
    @IBAction func insertRemoveGlass(sender:UIButton)
    {
        sender.selected = !sender.selected
        
        if sender.selected {
            accessories.append(JohnLennonGlassAccessory())
            return
        }
        
        for (index, acessory) in accessories.enumerate() {
            if acessory is GlassAccessory {
                accessories.removeAtIndex(index)
                return
            }
        }
    }
    

    @IBAction func insertCatEyes(sender:UIButton)
    {
        sender.selected = !sender.selected
        
        if sender.selected {
            accessories.append(CatEyesAccessory())
            return
        }
        
        for (index, acessory) in accessories.enumerate() {
            if acessory is GlassAccessory {
                accessories.removeAtIndex(index)
                return
            }
        }
    }
    
    
    @IBAction func insertRemoveNose(sender:UIButton)
    {
        sender.selected = !sender.selected
        
        if sender.selected {
            accessories.append(ClownNoseAccessory())
            return
        }
        
        for (index, acessory) in accessories.enumerate() {
            if acessory is NoseAccessory {
                accessories.removeAtIndex(index)
                return
            }
        }
    }
    
    @IBAction func insertPigNose(sender:UIButton)
    {
        sender.selected = !sender.selected
        
        if sender.selected {
            accessories.append(PigNoseAccessory())
            return
        }
        
        for (index, acessory) in accessories.enumerate() {
            if acessory is NoseAccessory {
                accessories.removeAtIndex(index)
                return
            }
        }
    }
    
    @IBAction func insertHumanNose(sender:UIButton)
    {
        sender.selected = !sender.selected
        
        if sender.selected {
            accessories.append(HumanAccessory())
            return
        }
        
        for (index, acessory) in accessories.enumerate() {
            if acessory is NoseAccessory {
                accessories.removeAtIndex(index)
                return
            }
        }
    }
}


//MARK: - FaceTracker Delegate
extension ViewController : FaceTrackerViewControllerDelegate
{
    func faceTrackerDidUpdate(points: FacePoints?) {
    
        if let points = points {
            for accessory in accessories {
                accessory.injectPoints(points)
                accessory.updatePosition()
                accessory.hidden = false
            }
            
            return
        }
        
        for accessory in accessories {
            accessory.hidden = true
        }
        
    }
}



