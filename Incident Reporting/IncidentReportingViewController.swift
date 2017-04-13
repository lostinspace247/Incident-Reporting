//
//  IncidentReportingViewController.swift
//  Incident Reporting
//
//  Created by Davyen Nelson on 4/13/17.
//  Copyright © 2017 UNL. All rights reserved.
//

import UIKit

class IncidentReportingViewController: UIViewController {

    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var incidentReportingWebView: UIWebView!
    var incidentReporting: IncidentReporting?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        incidentReporting = IncidentReporting(viewController: self, webView: incidentReportingWebView, progressBar: progressBar)
        
        incidentReporting?.setWebViewConstraints();
        incidentReporting?.loadWebPage();
    }

    @IBAction func done(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    

}
