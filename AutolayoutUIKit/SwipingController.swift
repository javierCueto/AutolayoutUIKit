//
//  SwipingController.swift
//  AutolayoutUIKit
//
//  Created by Javier Cueto on 29/11/20.
//

import UIKit

class SwipingCOntroller: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = .white
        collectionView.register(PageCell.self, forCellWithReuseIdentifier: "cellId")
        collectionView.isPagingEnabled = true
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pages.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as!  PageCell
        
        let page = pages[indexPath.item]
        cell.page = page
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
}
