//
//  ViewController.swift
//  ARKit_Candle
//
//  Created by Anoop tomar on 12/15/17.
//  Copyright © 2017 Devtechie. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
        // Show statistics such as fps and timing information
        sceneView.showsStatistics = true
        sceneView.automaticallyUpdatesLighting = true
        
        // Create a new scene
        //let scene = SCNScene()
        
        let candleScene = SCNScene(named: "candle.scn")
        let candles = candleScene?.rootNode.childNode(withName: "candles", recursively: true)
        let candleFire1 = candles?.childNode(withName: "candleFire1", recursively: true)!
        let candleFire2 = candles?.childNode(withName: "candleFire2", recursively: true)!
        let candleFire3 = candles?.childNode(withName: "candleFire3", recursively: true)!
        
        let candleBody1 = candles?.childNode(withName: "candleBody1", recursively: true)!
        let candleBody2 = candles?.childNode(withName: "candleBody2", recursively: true)!
        let candleBody3 = candles?.childNode(withName: "candleBody3", recursively: true)!
        
        candleBody1?.geometry?.firstMaterial?.diffuse.contents = UIColor.brown
        candleBody2?.geometry?.firstMaterial?.diffuse.contents = UIColor.red
        candleBody3?.geometry?.firstMaterial?.diffuse.contents = UIColor.cyan
        
        let fire = SCNParticleSystem(named: "fire", inDirectory: nil)
        let fire2 = SCNParticleSystem(named: "fire", inDirectory: nil)
        let fire3 = SCNParticleSystem(named: "fire", inDirectory: nil)
        
        let fireNode1 = SCNNode()
        fireNode1.addParticleSystem(fire!)
        //fireNode1.position = SCNVector3Make(0.05, 0, 0.117)
        fireNode1.scale = SCNVector3Make(0.00001, 0.00001, 0.00001)
        let fireNode2 = SCNNode()
        fireNode2.addParticleSystem(fire2!)
        fireNode2.scale = SCNVector3Make(0.00001, 0.00001, 0.00001)
        let fireNode3 = SCNNode()
        fireNode3.addParticleSystem(fire3!)
        fireNode3.scale = SCNVector3Make(0.00001, 0.00001, 0.00001)

        candleFire1?.addChildNode(fireNode1)
        candleFire2?.addChildNode(fireNode2)
        candleFire3?.addChildNode(fireNode3)
        
//        candleFire1?.addParticleSystem(fire!)//.addChildNode(fireNode)
//        candleFire2?.addParticleSystem(fire2!)//candleFire2?.addChildNode(fireNode)
//        candleFire3?.addParticleSystem(fire3!)//candleFire3?.addChildNode(fireNode)
        
      //  fireNode.position = SCNVector3Make(0, 0, -0.9)
        
//        candleScene?.rootNode.addChildNode(candleFire1!)
//        candleScene?.rootNode.addChildNode(candleFire2!)
//        candleScene?.rootNode.addChildNode(candleFire3!)
        
        let scene = SCNScene()
        scene.rootNode.addChildNode(candles!)
        
        // Set the scene to the view
        sceneView.scene = scene
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
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

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
}
