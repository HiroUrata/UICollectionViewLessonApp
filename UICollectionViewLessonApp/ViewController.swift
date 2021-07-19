//
//  ViewController.swift
//  UICollectionViewLessonApp
//
//  Created by UrataHiroki on 2021/07/19.
//

import UIKit

class ViewController: UIViewController{

    @IBOutlet weak var cellCountTextField: UITextField!
    @IBOutlet weak var decisionButton: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!
    
    let collectionViewFlowLayout = UICollectionViewFlowLayout()
    
    var cellCount = String()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        

    }

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        collectionViewFlowLayout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        collectionView.collectionViewLayout = collectionViewFlowLayout
        
    }
    
    
    @IBAction func countDecision(_ sender: Any) {
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        cellCount = cellCountTextField.text!
        
        collectionView.reloadData()
    }
    
}


extension ViewController:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        
        return Int(cellCount)!
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        
        cell.backgroundColor = .systemTeal
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.frame.size.width / 4 - 10, height: collectionView.frame.size.width / 4)
        
    }
    
    
}
