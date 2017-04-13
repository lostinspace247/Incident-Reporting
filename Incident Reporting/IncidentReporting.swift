//
//  IncidentReporting.swift
//  Incident Reporting
//
//  Created by Davyen Nelson on 4/13/17.
//  Copyright © 2017 UNL. All rights reserved.
//

import Foundation
import UIKit
import JSQWebViewController

class IncidentReporting: NSObject, IncidentReportingDelegate, UIWebViewDelegate {
    
    var incidentReportingVC: UIViewController!
    var webView: UIWebView?
    var progressBar: UIProgressView?
    let url = "http://www.unl.edu/tips-incident-reporting-system/";

    override init() {
        super.init()
    }
    
    init(viewController: UIViewController,
        webView: UIWebView, progressBar: UIProgressView) {
        
        self.incidentReportingVC = viewController
        self.webView = webView
        self.progressBar = progressBar
    
    }
    
    init(viewController: UIViewController){
        self.incidentReportingVC = viewController;
    }
    
    func loadWebPage() {
        let tempURL = NSURL(string: url);
        let request = NSURLRequest(url: tempURL as! URL)
        
        webView?.loadRequest(request as URLRequest)
    }
    
    func loadJSQWebView() {
        let controller = WebViewController(url: URL(string: url)!)
        let nav = UINavigationController(rootViewController: controller);

        incidentReportingVC.present(nav, animated: true, completion: nil)
        
    }
    
    func setWebViewConstraints() {
        progressBar?.progress = 0
        webView?.delegate = self
        
        webView?.scrollView.contentInset = UIEdgeInsets.zero
        webView?.scrollView.scrollIndicatorInsets = webView!.scrollView.contentInset
    }
    
    func webViewDidStartLoad(_ webView: UIWebView) {
        self.progressBar?.setProgress(0.1, animated: true)
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        self.progressBar?.setProgress(1.0, animated: true)
        self.progressBar?.isHidden = true;
        
    }
    
    func webView(_ webView: UIWebView, didFailLoadWithError error: Error) {
        self.progressBar?.setProgress(1.0, animated: true)
    }
    
}
