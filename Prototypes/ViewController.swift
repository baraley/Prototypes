//
//  ViewController.swift
//  Prototypes
//
//  Created by Alexander Baraley on 20.04.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private var collectionView: UICollectionView!
    
    let items = [
        "trash", "folder", "tray", "pencil", "archivebox", "doc", "book", "link", "person", "option", "alt", "flame",
        "drop", "bolt", "bolt.circle", "bolt.slash", "tortoise", "hare", "ant", "ladybug", "leaf", "cart", "creditcard",
        "giftcard", "clock", "timer", "stopwatch", "alarm"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.allowsMultipleSelection = true
    }
    
    @IBAction private func printSelected() {
        
        guard let indexPaths = collectionView.indexPathsForSelectedItems else { return }
        
        let indexes = indexPaths.map(\.item).sorted()
        
        indexes.forEach {
            print(items[$0])
        }
        
        print("")
    }
}

extension ViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let identifier = String(describing: Cell.self)
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! Cell
        
        let item = items[indexPath.row]
        
        cell.imageView.image = UIImage(systemName: item)
        cell.titleLabel.text = item
        
        return cell
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout { }
