//
//  ViewController.swift
//  funFact
//
//  Created by Serey Morm on 2/22/17.
//  Copyright © 2017 Serey Morm. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // Outlet for labels, does nothing
    @IBOutlet weak var funFactLabel: UILabel!
    let factProvider = FactProvider()
    let colorProvider = BGColorProvider()
    
    override func viewDidLoad() {
        
        // super calls the parent class
        super.viewDidLoad()
        
        funFactLabel.text = factProvider.randomFact()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // Action for methods that does something when tapped
    // Target Action, View is the target, Action is the
    // funFact function
    @IBAction func showFact() {
        funFactLabel.text = factProvider.randomFact()
        let randomColor = colorProvider.getBGColor()
        view.backgroundColor = randomColor
    }

    
}

