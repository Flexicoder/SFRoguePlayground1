import PlaygroundSupport
import SpriteKit

class GameScene: SKScene {

    // Array that will be used to hold all of the created rooms, for future use
    private var rooms = [Room]()

    private var totalRooms = 20

    override func didMove(to view: SKView) {
        // Now we have a view to render too, create how many rooms we need for the map
        for number in 0..<totalRooms {
            let room = Room(number: number)
            self.rooms.append(room)
            room.render(scene: self)
        }
    }
}

// Sets up the scene for us to render to
func createScene() -> SKView {
    let sceneView = SKView(frame: CGRect(x:0 , y:0, width: 768, height: 1024))

    let scene = GameScene(size: sceneView.frame.size)
    // Set the scale mode to scale to fit the window
    scene.scaleMode = .aspectFill
    scene.anchorPoint = CGPoint(x: 0.5, y: 0.5)

    // Present the scene
    sceneView.presentScene(scene)
    return sceneView
}

PlaygroundSupport.PlaygroundPage.current.liveView = createScene()
