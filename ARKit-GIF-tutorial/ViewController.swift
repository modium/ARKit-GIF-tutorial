//
//  ViewController.swift
//  ARKit-GIF-tutorial
//
//  Created by Jaf Crisologo on 2019-12-03.
//  Copyright © 2019 Modium Design. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    // 1. Add UIImage+Gif.swift to project
    // 2. Add your GIF to project (not in Assets.xcassets)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
        // Show statistics such as fps and timing information
        sceneView.showsStatistics = true
        
        // Create a new scene
        // 3. Replace this with an instance of SCNScene
//        let scene = SCNScene(named: "art.scnassets/ship.scn")!
        let scene = SCNScene()
        
        // Set the scene to the view
        sceneView.scene = scene
        
        // 6. Call addGIF() in sceneView's rootNode
        sceneView.scene.rootNode.addChildNode(addGIF(name: "giraffe"))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()

        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }
    
    // 4. Delete this section
    // MARK: - ARSCNViewDelegate
    
/*
    // Override to create and configure nodes for anchors added to the view's session.
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        let node = SCNNode()
     
        return node
    }
*/
    
    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
        
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
        
    }
    
    // 5. Create a function that takes in the name of your GIF and returns an SCNNode
    func addGIF(name: String) -> SCNNode {
        let gifNode = SCNNode()
        
        let gifPlane = SCNPlane(width: 1, height: 1)
        let gifImage = UIImage.gifImageWithName(name)
        let gifImageView = UIImageView(image: gifImage)
        gifPlane.firstMaterial?.diffuse.contents = gifImageView
        
        gifNode.geometry = gifPlane
        gifNode.position = SCNVector3(0, 0, -1)
        return gifNode
    }
}
