//
//  Room.swift
//  
//
//  Created by Paul Ledger on 22/04/2020.
//

import Foundation
import SpriteKit

public class Room: NSObject {
    var node: SKShapeNode   // Used to hold the "floor" of the room
    var number: Int         // Used to identify the room
    var cols: Int           // Number of columns the room is made up of
    var rows: Int           // Number of rows the room is made up of

    public init(number: Int) {
        self.number = number

        // Create a random number of columns and rows, based on restrictions.
        // Multiply the random number by 2 always ensures that we get an "even" sized room

        self.cols = Int.random(in: Constants.Constraints.minimumExtent..<Constants.Constraints.maximumExtent) * 2
        let width = Int(cols * Constants.Constraints.tileSize)
        self.rows = Int.random(in: Constants.Constraints.minimumExtent..<Constants.Constraints.maximumExtent) * 2
        let height = Int(rows * Constants.Constraints.tileSize)

        // Create a basic node using the size, give it a border  and fill it in so we can see it
        self.node = SKShapeNode(rectOf: CGSize(width: width, height: height))
        self.node.lineWidth = 2
        self.node.fillColor = .red
        self.node.name = "room\(self.number)"

        // A random position for the room
        let x = Int(Int.random(in: Constants.Constraints.minimumPositionOffset..<Constants.Constraints.maximumPositionOffset) * Constants.Constraints.tileSize)
        let y = Int(Int.random(in: Constants.Constraints.minimumPositionOffset..<Constants.Constraints.maximumPositionOffset) * Constants.Constraints.tileSize)

        self.node.position = CGPoint(x: x, y: y)
    }

    public func render(scene: SKScene) {
        scene.addChild(self.node)
    }
}
