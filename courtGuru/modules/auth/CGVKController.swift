//
//  CGViewController.swift
//  courtGuru
//
//  Created by Егор Редько on 28/09/2019.
//  Copyright © 2019 necordu. All rights reserved.
//

import UIKit
import WebKit
import Alamofire
import RxSwift
import RxCocoa

class CGVKController: UIViewController, WKUIDelegate, WKNavigationDelegate {
    
    var webView: WKWebView!
    weak var delegate: vkAuth?
    
    
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
    }
    

    func webView(_ webView: WKWebView, decidePolicyFor
           navigationAction: WKNavigationAction,
           decisionHandler: @escaping (WKNavigationActionPolicy) -> Swift.Void) {

        
        if webView.url!.absoluteString.contains("code=") {
            getToken(code: webView.url!.queryParameters["code"]!) { (result) in
                switch result {
                case .success(let auth):
                    UserDefaults.standard.setValue(auth.token, forKey: "value: token")
                    self.dismiss(animated: true) {
                        self.delegate?.pushForward(result: "Success")
                    }
                case .failure(let error):
                    self.dismiss(animated: true) {
                        self.delegate?.pushForward(result: error.localizedDescription)
                    }
                }
            }
            
        }
        decisionHandler(.allow)

    }
    
    
    func getToken(code: String, completion:@escaping (Result<Auth, AFError>) -> Void) {
            
        AF.request("http://demo133.bravo.vkhackathon.com:8000/api/auth/vkAuth?code=\(code)").responseDecodable { (response: DataResponse<Auth, AFError>) in
            
            completion(response.result)
            /*switch response.result {
            case .success(let auth):
                complet
            case .failure(let error):
                return error
            }*/
        }
    }
    
}
       

