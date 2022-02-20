//
//  WebpageViewController.swift
//  Lab4
//
//  Created by BenD on 2/19/22.
//

import UIKit
import WebKit

class WebpageViewController: UIViewController, WKNavigationDelegate {
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var webActivityIndicator: UIActivityIndicatorView!
    var webpage: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.navigationDelegate = self
        loadWebPage("https://en.wikipedia.org/wiki/List_of_video_game_genres") //default page
    }
    
    override func viewWillAppear(_ animated: Bool){
        if let url = webpage {
            //print("debug - url from segue: ", url)
            loadWebPage(url)
        }else{
            print("Webpage failed to load")
        }
    }

    func loadWebPage(_ urlString: String){
        let url = URL(string: urlString)
        let request = URLRequest(url: url!)
        webView.load(request)
    }
    
    //when a web page begins to load
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        webActivityIndicator.startAnimating()
    }
    
    //when a web page loads successfully
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        webActivityIndicator.stopAnimating()
    }
}
