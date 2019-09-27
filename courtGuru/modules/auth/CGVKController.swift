//
//  CGViewController.swift
//  courtGuru
//
//  Created by Егор Редько on 28/09/2019.
//  Copyright © 2019 necordu. All rights reserved.
//

import UIKit
import WebKit

class CGVKController: UIViewController, WKUIDelegate, WKNavigationDelegate {
    
    var webView: WKWebView!
    
    
    override func loadView() {
        
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: "http://demo133.bravo.vkhackathon.com:8000/api/auth/getVkAuthUrl")!
        webView.load(URLRequest(url: url))
        webView.allowsBackForwardNavigationGestures = true
        /*let myURL = URL(string:"https://www.apple.com"/*"http://demo133.bravo.vkhackathon.com:8000/api/auth/getVkAuthUrl"*/)
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)*/
        // Do any additional setup after loading the view.
    }
    

    func webView(_ webView: WKWebView, decidePolicyFor
           navigationAction: WKNavigationAction,
           decisionHandler: @escaping (WKNavigationActionPolicy) -> Swift.Void) {

        
        if webView.url!.absoluteString.contains("code=") {
        //    NSMutableDictionary *queryStringDictionary = [[NSMutableDictionary alloc] init];
       //     NSArray *urlComponents = [urlString componentsSeparatedByString:@"&"];
            
            print(webView.url!.queryParameters["code"])
            
            
            
        }
        decisionHandler(.allow)

    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
