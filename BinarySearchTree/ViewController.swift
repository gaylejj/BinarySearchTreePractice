//
//  ViewController.swift
//  BinarySearchTree
//
//  Created by Jeff Gayle on 9/3/14.
//  Copyright (c) 2014 Jeff Gayle. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var bst = BinarySearchTree()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        bst.addValue(34)
        bst.addValue(50)
        bst.addValue(30)
        bst.addValue(99)
        bst.addValue(74)
        bst.addValue(12)
        bst.addValue(5)
        bst.addValue(75)
        bst.addValue(45)
        bst.addValue(27)
        bst.addValue(33)
        
        var searchNode = bst.findNodeForValue(99)
//        println(bst.rootNode)
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

