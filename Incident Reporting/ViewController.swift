//
//  ViewController.swift
//  Incident Reporting
//
//  Created by Davyen Nelson on 4/13/17.
//  Copyright © 2017 UNL. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var incidentReporting = IncidentReporting();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        incidentReporting = IncidentReporting(viewController: self)
    }
    
    @IBAction func goToIncidents(_ sender: Any) {
        performSegue(withIdentifier: "viewIncidentReporting", sender: nil)
    }

    @IBAction func goToJSQIncidentReporting(_ sender: Any) {
        incidentReporting.loadJSQWebView();
    }
    
}

