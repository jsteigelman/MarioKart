//
//  ViewController.swift
//  MarioKart
//
//  Created by Joey Steigelman on 3/2/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
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
    
}

