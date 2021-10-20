//
//  DetailViewController.swift
//  BigCatsCollectionView
//
//  Created by Jisa Gigi on 10/20/21.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailImageView: UIImageView!
    @IBOutlet weak var detailTitle: UILabel!
    @IBOutlet weak var DetailLife: UILabel!
    @IBOutlet weak var detailDesc: UITextView!
    
    var sendData1: String!
    var sendData2: String!
    var sendData3: String!
    var sendData4: String!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailImageView.image = UIImage(named: sendData1)
        detailTitle.text = sendData2
        DetailLife.text = sendData3
        detailDesc.text = sendData4
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
