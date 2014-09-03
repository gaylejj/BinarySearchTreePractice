//
//  Node.swift
//  BinarySearchTree
//
//  Created by Jeff Gayle on 9/3/14.
//  Copyright (c) 2014 Jeff Gayle. All rights reserved.
//

import Foundation

class Node {
    
    var value : Int
    var leftNode : Node?
    var rightNode : Node?
    
    init(value: Int) {
        self.value = value
    }
    
    func addNode(newNode: Node) {
        if newNode.value < self.value {
            if leftNode == nil {
                //Case when we have a node with a value less than ours, and don't have a left child
                self.leftNode = newNode
            } else {
                //Recursion
                self.leftNode?.addNode(newNode)
            }
        } else {
            if rightNode == nil {
                //Case when we have a node with a value less than ours, and don't have a right child
                self.rightNode = newNode
            } else {
                //Recursion
                self.rightNode?.addNode(newNode)
            }
        }
    }
}