//
//  ViewController.swift
//  Week1Lesson2
//
//  Created by s s on 8/28/25.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var counterText: UILabel!
    var number = 0
    
    
    @IBAction func counterButton(_ sender: Any) {
        number += 1
        
        counterText.text = "\(number)"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        counterText.text = "\(number)"
        
        
    }


}
