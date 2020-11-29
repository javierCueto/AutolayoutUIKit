//
//  ViewController.swift
//  AutolayoutUIKit
//
//  Created by Javier Cueto on 28/11/20.
//

import UIKit
extension UIColor {
    static var mainPink = UIColor(red: 232/255, green: 68/255, blue: 133/255, alpha: 1)
}

class ViewController: UIViewController {
    
    let bearImageView: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "bear_first"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let descriptionTextView: UITextView = {
        let textView = UITextView()
        let attributedText = NSMutableAttributedString(string: "Join us today in our fun and games!", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18)])
        
        attributedText.append(NSMutableAttributedString(string: """



    Are you ready for loads and loads of fun?
Don't wait any longer! We hope to se you in
our stores soon.
""", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 13),NSAttributedString.Key.foregroundColor: UIColor.gray]))
        
        textView.attributedText = attributedText
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    //
    private let previusButton: UIButton = {
        let buttton = UIButton(type: .system)
        buttton.setTitle("Prev", for: .normal)
        buttton.translatesAutoresizingMaskIntoConstraints = false
        buttton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        buttton.setTitleColor(.gray, for: .normal)
        return buttton
    }()
    
    private let nextButton: UIButton = {
        let buttton = UIButton(type: .system)
        buttton.setTitle("Next", for: .normal)
        buttton.translatesAutoresizingMaskIntoConstraints = false
        buttton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)

        buttton.setTitleColor(.mainPink, for: .normal)
        return buttton
    }()
    
    private let pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.currentPage = 0
        pageControl.numberOfPages = 4
        pageControl.currentPageIndicatorTintColor = .mainPink
        pageControl.pageIndicatorTintColor = UIColor(red: 249/255, green: 207/255, blue: 224/255, alpha: 1)
        return pageControl
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(descriptionTextView)
        
        setupBottomControls()
        setupLaoyut()
        
    }
    
    private func setupBottomControls(){
        let bottonControlssStackView = UIStackView(arrangedSubviews: [previusButton,pageControl,nextButton])
        bottonControlssStackView.distribution = .fillEqually
        view.addSubview(bottonControlssStackView)
        bottonControlssStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([bottonControlssStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor), bottonControlssStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor), bottonControlssStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor), bottonControlssStackView.heightAnchor.constraint(equalToConstant: 50)])
    }
    
    private func setupLaoyut(){
        let topImageContainerView = UIView()
       // topImageContainerView.backgroundColor = .blue
        view.addSubview(topImageContainerView)
        topImageContainerView.translatesAutoresizingMaskIntoConstraints = false
        topImageContainerView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        topImageContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        topImageContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        /*
        topImageContainerView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        topImageContainerView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        topImageContainerView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true*/
        topImageContainerView.heightAnchor.constraint(equalTo: view.heightAnchor,multiplier: 0.5).isActive = true
        
        topImageContainerView.addSubview(bearImageView)
        bearImageView.centerXAnchor.constraint(equalTo: topImageContainerView.centerXAnchor).isActive = true
        bearImageView.centerYAnchor.constraint(equalTo: topImageContainerView.centerYAnchor).isActive = true
        bearImageView.heightAnchor.constraint(equalTo: topImageContainerView.heightAnchor, multiplier: 0.5).isActive = true
        
        
        descriptionTextView.topAnchor.constraint(equalTo: topImageContainerView.bottomAnchor).isActive = true
        descriptionTextView.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 24).isActive = true
        descriptionTextView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -24).isActive = true
        descriptionTextView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
    }


}

