//
//  SwipingController.swift
//  AutolayoutUIKit
//
//  Created by Javier Cueto on 29/11/20.
//

import UIKit

class SwipingController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    
   
    
    let pages = [
        Page(imageName: "bear_first", headerText: "123 tamarindo 123 tamarindo",body: """



        Are you ready for loads and loads of fun?
    Don't wait any longer! We hope to se you in
    our stores soon.
    """),
        Page(imageName: "bear_first", headerText: "Suscribe to our chanel, its totaly free for ever", body: """



        Are you ready for loads and loads of fun?
    Don't wait any longer! We hope to se you in
    our stores soon.
    """),
        Page(imageName: "bear_first", headerText: "remender, just you decide how and when to learn something",body: """



        Are you ready for loads and loads of fun?
    Don't wait any longer! We hope to se you in
    our stores soon.
    """),
        Page(imageName: "bear_first", headerText: "not all the times you will be learnig, get fun in a videogame", body: """



        Are you ready for loads and loads of fun?
    Don't wait any longer! We hope to se you in
    our stores soon.
    """)
    ]
    
    //
    private let previusButton: UIButton = {
        let buttton = UIButton(type: .system)
        buttton.setTitle("Prev", for: .normal)
        buttton.translatesAutoresizingMaskIntoConstraints = false
        buttton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        buttton.setTitleColor(.gray, for: .normal)
        buttton.addTarget(self, action: #selector(handlePrevius), for: .touchUpInside)
        return buttton
    }()
    
    private let nextButton: UIButton = {
        let buttton = UIButton(type: .system)
        buttton.setTitle("Next", for: .normal)
        buttton.translatesAutoresizingMaskIntoConstraints = false
        buttton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        buttton.setTitleColor(.mainPink, for: .normal)
        buttton.addTarget(self, action: #selector(handleNext), for: .touchUpInside)
        return buttton
    }()
    
    @objc private func handleNext(){
        let nextIndex = min(pageControl.currentPage + 1, pages.count - 1)
        let indexPath = IndexPath(item: nextIndex, section: 0)
        pageControl.currentPage = nextIndex
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    @objc private func handlePrevius(){
        let nextIndex = max(pageControl.currentPage - 1, 0)
        let indexPath = IndexPath(item: nextIndex, section: 0)
        pageControl.currentPage = nextIndex
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    lazy var pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.currentPage = 0
        pageControl.numberOfPages = pages.count
        pageControl.currentPageIndicatorTintColor = .mainPink
        pageControl.pageIndicatorTintColor = UIColor(red: 249/255, green: 207/255, blue: 224/255, alpha: 1)
        return pageControl
    }()
    
    private func setupBottomControls(){
        let bottonControlssStackView = UIStackView(arrangedSubviews: [previusButton,pageControl,nextButton])
        bottonControlssStackView.distribution = .fillEqually
        view.addSubview(bottonControlssStackView)
        bottonControlssStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([bottonControlssStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor), bottonControlssStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor), bottonControlssStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor), bottonControlssStackView.heightAnchor.constraint(equalToConstant: 50)])
    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = .white
        collectionView.register(PageCell.self, forCellWithReuseIdentifier: "cellId")
        collectionView.isPagingEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        setupBottomControls()
    }
    
    
}
