// Playground - noun: a place where people can play

import UIKit

class BinarySearchTree {
    
    var rootNode : Node?
    
    init() {
        
    }
    
    func addValue(value: Int) {
        
        var newNode = Node(value: value)
        
        if rootNode == nil {
            self.rootNode = newNode
        } else {
            self.rootNode!.addNode(newNode)
        }
        
    }
    
    func findNodeForValue(value: Int) -> Node {
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
    
    func getNodeCount(root: Node?) -> Int {
        if root == nil {
            return 0
        }
        var i = 1
        var node = root
        while root?.rightNode != nil {
            node = node?.rightNode
            i++
        }
        return i
    }
    
    func balanceRightVine(root: Node) -> Node {
        var nodeCount = self.getNodeCount(self.createRightVine(root))
        
        var times = Int(log2(Double(nodeCount)))
        var newRoot = root
        
        for var i = 0; i < times; i++ {
            newRoot = self.rotateLeft(newRoot)
            self.rootNode = newRoot.rightNode
            for var j = 0; j < nodeCount / 2 - 1; j++ {
                self.rootNode = self.rotateLeft(root)
                self.rootNode = self.rootNode?.rightNode
            }
            nodeCount >= 1
        }
        return newRoot
    }
    
}

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
                self.leftNode?.addNode(newNode)
            }
        }
    }
}

var bst = BinarySearchTree()

bst.addValue(34)
bst.addValue(50)
bst.addValue(30)
bst.addValue(100)
bst.addValue(74)
bst.addValue(12)
bst.addValue(5)

var searchNode = bst.findNodeForValue(12)
println(bst.rootNode)
