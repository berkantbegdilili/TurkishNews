//
//  WebView.swift
//  BBNews
//
//  Created by Berkant Beğdilili on 20.07.2020.
//

import SwiftUI
import UIKit
import WebKit

struct WebView: UIViewRepresentable {

    let URL:URL
    
    typealias UIViewType = WKWebView

    func updateUIView(_ webView: WKWebView, context: Context) {

        let request = URLRequest(url: URL)
        webView.load(request)

    }

    func makeUIView(context: Context) -> WKWebView {
        
        let preferences = WKPreferences()
        preferences.javaScriptCanOpenWindowsAutomatically = true
        
        let configuration = WKWebViewConfiguration()
        configuration.preferences = preferences
        
        let webView = WKWebView(frame: .zero, configuration: configuration)
        webView.allowsBackForwardNavigationGestures = true
        webView.scrollView.isScrollEnabled = true
        
        return webView
    }
    
}
