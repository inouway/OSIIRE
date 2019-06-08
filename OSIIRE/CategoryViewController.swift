//
//  CategoryViewController.swift
//  OSIIRE
//
//  Created by 井上勇斗 on 2019/05/15.
//  Copyright © 2019 井上勇斗. All rights reserved.
//

import UIKit

class CategoryViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    //outerへの遷移
    @IBAction func didTapOuter(_ sender: Any) {
        performSegue(withIdentifier: "toList", sender: "OUTER")
    }
    
    //topsへの遷移
    @IBAction func didTapTops(_ sender: Any) {
        performSegue(withIdentifier: "toList", sender: "TOPS")
    }
    
    //pantsへの遷移
    @IBAction func didTapPants(_ sender: Any) {
        performSegue(withIdentifier: "toList", sender: "PANTS")
    }
    
    //hatへの遷移
    @IBAction func didTapHat(_ sender: Any) {
        performSegue(withIdentifier: "toList", sender: "HAT")
    }
    
    //shoesへの遷移
    @IBAction func didTapShoes(_ sender: Any) {
        performSegue(withIdentifier: "toList", sender: "SHOES")
    }
    
    //bagへの遷移
    @IBAction func didTapBag(_ sender: Any) {
        performSegue(withIdentifier: "toList", sender: "BAG")
    }
    
    //値の受け渡し
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //使うsegueが"toList"か判断
        if segue.identifier == "toList" {
            //次の画面にタイトルを渡す
            let nextVC = segue.destination as! OuterViewController
            nextVC.hoge = sender as! String
        }
    }
    
    
}
