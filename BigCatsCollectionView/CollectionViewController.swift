//
//  CollectionViewController.swift
//  BigCatsCollectionView
//
//  Created by Jisa Gigi on 10/20/21.
//

import UIKit

private let reuseIdentifier = "Cell"

class CollectionViewController: UICollectionViewController,UICollectionViewDelegateFlowLayout {

    var items = [[String:String]]()
    func loadPlist() -> [[String:String]]{
        let path = Bundle.main.path(forResource: "BigCats", ofType: "plist")
        return NSArray.init(contentsOf: URL.init(fileURLWithPath: path!)) as! [[String:String]]
     }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        //self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
        self.items = loadPlist()
        self.navigationItem.title = "Big Cats"
    }

   
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "showDetail"{
            let detail = segue.destination as! DetailViewController
            if let indexPath = self.collectionView?.indexPath(for: sender as! UICollectionViewCell){
                let item = self.items[indexPath.row]
                detail.sendData1 = item["Name"]
                detail.sendData2 = item["Image"]
                detail.sendData3 = item["LifeSpan"]
                detail.sendData4 = item["Description"]

                
            }
            
        }
    }
  

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return self.items.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCell
        let item = self.items[indexPath.row]
        // Configure the cell
        cell.cellImageView.image = UIImage(named: item["Image"]!)
    
        return cell
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenSize : CGRect = UIScreen.main.bounds
        var widthCell = 0
        var heightCell = 125
        
        // IPHONE x, 6,7,8
        if screenSize.width == 375 {
            widthCell = 172
        }
        //IPHONE 6+, 7+, 8+
        if screenSize.width == 414 {
            widthCell = 191
        }
        //IPHONE 5, 5s,5c
        if screenSize.width == 320 {
            widthCell = 144
        }
        
        return CGSize(width: widthCell, height: heightCell)
    }

}
