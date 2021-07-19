//
//  ViewController.swift
//  UICollectionViewLessonApp
//
//  Created by UrataHiroki on 2021/07/19.
//

import UIKit

class ViewController: UIViewController{

   
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var cellCountSlider: UISlider!
    
    let collectionViewFlowLayout = UICollectionViewFlowLayout()
    
    var cellcount = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cellCountSlider.minimumValue = 0
        cellCountSlider.maximumValue = 100
        
        collectionView.delegate = self
        collectionView.dataSource = self

    }

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        collectionViewFlowLayout.sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        collectionView.collectionViewLayout = collectionViewFlowLayout
        
        
    }
    
    @IBAction func cellCountUpMinus(_ sender: UISlider) {
        
        if sender.value >= 0{
            
            cellcount = Int(sender.value)
            collectionView.reloadData()
            
        }
        
    }
    
  
}


extension ViewController:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        
      return cellcount
        
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
