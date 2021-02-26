//
//  ViewController.swift
//  WebView
//
//  Created by 松田拓海 on 2021/02/27.
//

import UIKit
import WebKit


class ViewController: UIViewController,WKNavigationDelegate {

    
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    
    var webview = WKWebView()
    
    @IBOutlet weak var toolBar: UIToolbar!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        indicator.isHidden = true
        
        webview.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height - toolBar.frame.size.height)
        
        view.addSubview(webview)
        
        webview.navigationDelegate = self
//        URLをロード
        let url = URL(string: "https://www.kurashiru.com/")
        let request = URLRequest(url: url!)
        webview.load(request)
        
        indicator.layer.zPosition = 2
        
        
    }

    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
 
//        ロードが完了した時によばれるメソッド
        indicator.isHidden = true
        indicator.stopAnimating()
        
    }
    
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        

        indicator.isHidden = false
        indicator.startAnimating()
        
        
    }
    
    
    @IBAction func back(_ sender: Any) {
        
        webview.goBack()
        
    }
    
    
    @IBAction func go(_ sender: Any) {
        
        webview.goForward()
        
    }
    
    
    
}

