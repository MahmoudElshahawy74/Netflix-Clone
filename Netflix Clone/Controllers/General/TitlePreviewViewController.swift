//
//  TitlePreviewViewController.swift
//  Netflix Clone
//
//  Created by Mahmoud Elshahawy on 02/08/2024.
//

import UIKit
import WebKit
class TitlePreviewViewController: UIViewController {
    
    private let webView: WKWebView = {
       let webView = WKWebView()
        webView.translatesAutoresizingMaskIntoConstraints = false
        
        return webView
    }()
    
    private let titleLabel: UILabel = {
       
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 22, weight: .bold)
        label.text = "Intersteller"
        return label
    }()
    
    private let overViewLabel: UILabel = {

        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 18, weight: .regular)
        label.numberOfLines = 0
        label.text = "This is the best movie i have ever seen ! "
        return label
    }()
    
    private let downloadButton: UIButton = {
       
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .red
        button.setTitle("Download", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 8
        button.layer.masksToBounds = true
        return button
    }()
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(webView)
        view.addSubview(titleLabel)
        view.addSubview(overViewLabel)
        view.addSubview(downloadButton)
        
        configureConstraints()

    }
    
    func  configureConstraints() {
        let webViewConstraints = [
            webView.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            webView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            webView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            webView.heightAnchor.constraint(equalToConstant: 300)
        ]
        let titleLabelConstraints = [
            titleLabel.topAnchor.constraint(equalTo: webView.bottomAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
        ]
        let overViewLabelConstraints = [
            overViewLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 15),
            overViewLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            overViewLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ]
        let downloadButtonConstraints = [
            downloadButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            downloadButton.topAnchor.constraint(equalTo: overViewLabel.bottomAnchor, constant: 25),
            downloadButton.widthAnchor.constraint(equalToConstant: 120),
            downloadButton.heightAnchor.constraint(equalToConstant: 40)
        ]
        
        NSLayoutConstraint.activate(webViewConstraints)
        NSLayoutConstraint.activate(titleLabelConstraints)
        NSLayoutConstraint.activate(overViewLabelConstraints)
        NSLayoutConstraint.activate(downloadButtonConstraints)

        
    }
    
    func configure(with model: TitlePreviewViewModel){
        titleLabel.text = model.title
        overViewLabel.text = model.titleOverview
        
        
        guard let videoId = model.youtubeView.id?.videoID else { return }
        guard let url = URL(string: "https://www.youtube.com/embed/\(videoId)")  else { return }
        //print(url)
        webView.load(URLRequest(url: url))
    }
}

