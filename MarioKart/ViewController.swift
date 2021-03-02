//
//  ViewController.swift
//  MarioKart
//
//  Created by Joey Steigelman on 3/2/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var marioKartView: UIImageView!
    @IBOutlet weak var bowserKartView: UIImageView!
    @IBOutlet weak var warioKartView: UIImageView!
    @IBOutlet weak var luigiKartView: UIImageView!
    @IBOutlet weak var toadKartView: UIImageView!
    
    var marioStartingPoint = CGPoint()
    var bowserStartingPoint = CGPoint()
    var warioStartingPoint = CGPoint()
    var luigiStartingPoint = CGPoint()
    var toadStartingPoint = CGPoint()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //store each kart's starting point when the app loads
        marioStartingPoint = marioKartView.center
        bowserStartingPoint = bowserKartView.center
        warioStartingPoint = warioKartView.center
        luigiStartingPoint = luigiKartView.center
        toadStartingPoint = toadKartView.center

    }

    @IBAction func didPanKartView(_ sender: UIPanGestureRecognizer) {
        
        //access the location property of the pan gesture recognizer
        let location = sender.location(in: view)
        
        //print the current location returned from the gesture recognizer
        print("Location: x: \(location.x), y: \(location.y)")
        
        //access the view of the kart that was panned
        let kartView = sender.view!
        
        //set the kart view's position to the current position of the gesture recognizer
        kartView.center = location
    }
    
    
    @IBAction func didPinchKartView(_ sender: UIPinchGestureRecognizer) {
        
        //access the scale property of the gesture recognizer that was pinched
        let scale = sender.scale
        
        //print the scale value to the console
        print("scale: \(scale)")
        
        //access the view of the kart that was panned
        let kartView = sender.view!
        
        //adjust the scale of the kart view using the scale from the pinch gesture recognizer
        kartView.transform = CGAffineTransform(scaleX: scale, y: scale)
    }
    
    
    @IBAction func didRotateKartView(_ sender: UIRotationGestureRecognizer) {
    
        //access the location property of the gesture recognizer that was rotated
        let rotation = sender.rotation
        
        //print the rotation value to the console
        print("rotation: \(rotation)")
        
        //access the view of the kart that was panned
        let kartView = sender.view!
        
        //adjust the rotation of the kart view using the rotation from the pinch gesture recognizer
        kartView.transform = CGAffineTransform(rotationAngle: rotation)
    }
    
    
    @IBAction func didTapKartView(_ sender: UITapGestureRecognizer) {
        
        //test that gesture recognizer works
        print("Double tap recognized")
        
        //access the view of the kart that was panned
        let kartView = sender.view!
        
        //animation of the kart
        UIView.animate(withDuration: 0.7) {
            
            //move kart
            kartView.center.x += 350
            
            //reset karts to starting location
            self.marioKartView.center = self.marioStartingPoint
            self.bowserKartView.center = self.bowserStartingPoint
            self.warioKartView.center = self.warioStartingPoint
            self.luigiKartView.center = self.luigiStartingPoint
            self.toadKartView.center = self.toadStartingPoint
            
            //reset karts to their original states (restoring scale and rotation)
            self.marioKartView.transform = CGAffineTransform.identity
            self.bowserKartView.transform = CGAffineTransform.identity
            self.warioKartView.transform = CGAffineTransform.identity
            self.luigiKartView.transform = CGAffineTransform.identity
            self.toadKartView.transform = CGAffineTransform.identity
        }
}
    
    
    @IBAction func didLongPressBackground(_ sender: UILongPressGestureRecognizer) {
        
        //reset the kart positions
        marioKartView.center = marioStartingPoint
        bowserKartView.center = bowserStartingPoint
        warioKartView.center = warioStartingPoint
        luigiKartView.center = luigiStartingPoint
        toadKartView.center = toadStartingPoint
    }
    
    
    
}
