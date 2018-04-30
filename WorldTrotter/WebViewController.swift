//
//  WebViewController.swift
//  WorldTrotter
//
//  Created by Alex Rasho on 2/12/18.
//  Copyright © 2018 Alex Rasho. All rights reserved.
//

import Foundation
import WebKit

class WebViewController: UIViewController {
    var Web : WKWebView!
    override func viewDidLoad() {
        self.title = NSLocalizedString("webText", comment: "")
        Web = WKWebView()
        Web.load(URLRequest(url: URL(string: "https://www.bignerdranch.com")!))
        view = Web
    }
    
}
