//
//  BinarySearchTree.swift
//  BinarySearchTree
//
//  Created by Jeff Gayle on 9/3/14.
//  Copyright (c) 2014 Jeff Gayle. All rights reserved.
//

import Foundation

class BinarySearchTree {
    
    var rootNode : Node?
    
    init () {
        
    }
    
    func addValue(value: Int) {
        
        var newNode = Node(value: value)
        
        if rootNode == nil {
            self.rootNode = newNode
        } else {
            self.rootNode?.addNode(newNode)
        }
        
    }
    
    func findNodeForValue(value: Int) -> Node {
        self.createRightVine(self.rootNode!)
        var nodeCount = self.getNodeCount(self.rootNode!)
        self.balanceRightVine(self.rootNode!, nodeCount: nodeCount)
        var foundNode = self.findValue(value, forNode: self.rootNode!)
        return foundNode!
    }
    
    func findValue(value: Int, forNode node: Node?) -> Node? {
        if node != nil {
            if value == node!.value {
                return node
            } else {
                if value < node!.value {
                    
                    //More Recursion
                    return self.findValue(value, forNode: node!.leftNode)
                } else if value > node!.value {
                    
                    //More Recursion
                    return self.findValue(value, forNode: node!.rightNode)
                }
            }
        }
        return nil
    }
    
    func rotateLeft(node: Node) -> Node {
        if node.rightNode != nil {
            var rightChild = node.rightNode
            node.rightNode = rightChild?.rightNode
            rightChild?.rightNode = rightChild?.leftNode
            rightChild?.leftNode = node.leftNode
            node.leftNode = rightChild
            
            var temp = node.value
            node.value = rightChild!.value
            rightChild?.value = temp
            
        }
        return node
    }
    
    func rotateRight(node: Node) -> Node {
        if node.leftNode != nil {
            var leftChild = node.leftNode
            node.leftNode = leftChild?.leftNode
            leftChild?.leftNode = leftChild?.rightNode
            leftChild?.rightNode = node.rightNode
            node.rightNode = leftChild
            
            var temp = node.value
            node.value = leftChild!.value
            leftChild?.value = temp
        }
        return node
    }
    
    func createRightVine(root: Node) -> Node {
        var newRoot = root
        while (newRoot.leftNode != nil) {
            newRoot = self.rotateRight(newRoot)
        }
        if newRoot.rightNode != nil {
            newRoot.rightNode = self.createRightVine(newRoot.rightNode!)
        }
        return newRoot
    }
    
    //Get total count after vining the tree
    func getNodeCount(root: Node?) -> Int {
        if root == nil {
            return 0
        }
        var i = 1
        var node = root
        while node?.rightNode != nil {
            node = node?.rightNode
            i++
        }
        return i
    }
    
    func balanceRightVine(root: Node, nodeCount: Int) -> Node {
        var times = (nodeCount + 1) / 2
//        var times = 2 * (Int(log2(Double(nodeCount)))) - 1 //Int(log2(Double(nodeCount)))
        var newRoot = root
//        var nodeCountForLoop = (nodeCount / 2) - 1
        
        for var i = 0; i < times; i++ {
            newRoot = self.rotateLeft(newRoot)
            self.rootNode = newRoot.rightNode
            for var j = 0; j < nodeCountForLoop; j++ {
                self.rootNode = self.rotateLeft(newRoot)
                self.rootNode = self.rootNode?.rightNode
            }
            nodeCount >= 1
        }
        self.rootNode = newRoot
        return self.rootNode!
    }

}