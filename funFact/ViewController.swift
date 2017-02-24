//
//  ViewController.swift
//  funFact
//
//  Created by Serey Morm on 2/22/17.
//  Copyright © 2017 Serey Morm. All rights reserved.
//

import UIKit
import Alamofire
class ViewController: UIViewController {

    // Outlet for labels, does nothing
    @IBOutlet weak var funFactLabel: UILabel!
    let factProvider = FactProvider()
    let colorProvider = BGColorProvider()
    let link = "http://numbersapi.com/random?json"
    var fact: String = "Here are some random facts, keep tappin' 👇🏼"
    
    typealias JSONStandard = [String : AnyObject]
    
    // On launch, it will display the static string
    override func viewDidLoad() {
        
        super.viewDidLoad()
        makeRequest(withURL: link)
        funFactLabel.text = fact
        
    }
    
    func makeRequest(withURL: String){
        Alamofire.request(withURL).responseJSON(completionHandler: {
            response in
            do {
                let str = try JSONSerialization.jsonObject(with: response.data!, options: .mutableContainers) as! JSONStandard
                print(str["text"]!)
                self.fact = str["text"]! as! String
            }
            catch {
                print(error)
            }
            
        })
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // Action for methods that does something when tapped
    // Target Action, View is the target, Action is the
    // funFact function
    @IBAction func showFact() {
        makeRequest(withURL: link)
        funFactLabel.text = fact
        print(fact)
        let randomColor = colorProvider.getBGColor()
        view.backgroundColor = randomColor
        //makeRequest()
    }
    
    

    
}

