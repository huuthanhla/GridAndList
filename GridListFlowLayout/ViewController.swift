//
//  ViewController.swift
//  GridListFlowLayout
//
//  Created by Thành Lã on 9/5/18.
//  Copyright © 2018 MonstarLab. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var listButton: UIButton!
    @IBOutlet weak var gridButton: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var isGridFlowLayoutUsed: Bool = false {
        didSet {
            updateButtonAppearance()
        }
    }
    
    var gridFlowLayout = ProductsGridFlowLayout()
    var listFlowLayout = ProductsListFlowLayout()
    
    fileprivate let itemsToDisplay = [("1", "River cruise"), ("2", "North Island"), ("3", "Mountain trail"), ("4", "Southern Coast"), ("5", "Fishing place")] // image names
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        collectionView.collectionViewLayout = gridFlowLayout
        collectionView.dataSource = self
        isGridFlowLayoutUsed = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func gridButtonDidTap(_ sender: UIButton) {
        isGridFlowLayoutUsed = true
    }
    
    @IBAction func listButtonDidTap(_ sender: UIButton) {
        isGridFlowLayoutUsed = false
    }
    
    fileprivate func updateButtonAppearance() {
//        gridButton.isSelected = isGridFlowLayoutUsed
//        gridButton.backgroundColor = gridButton.isSelected ? UIColor.groupTableViewBackground : UIColor.clear
//
//        listButton.isSelected = !isGridFlowLayoutUsed
//        listButton.backgroundColor = listButton.isSelected ? UIColor.groupTableViewBackground : UIColor.clear
        
        let layout = isGridFlowLayoutUsed ? gridFlowLayout : listFlowLayout
        UIView.animate(withDuration: 0.2) { () -> Void in
            self.collectionView.collectionViewLayout.invalidateLayout()
            self.collectionView.setCollectionViewLayout(layout, animated: true)
        }
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemsToDisplay.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: AnnotatedPhotoCell.self), for: indexPath) as! AnnotatedPhotoCell
        
        let index = indexPath.row % itemsToDisplay.count
        let imageName = itemsToDisplay[index].0
        cell.imageView.image = UIImage(named: imageName)
        
        return cell
    }
}
