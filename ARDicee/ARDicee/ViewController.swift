//
//  ViewController.swift
//  ARDicee
//
//  Created by Prasad Zamre on 24/07/18.
//  Copyright © 2018 Prasad Zamre. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        self.sceneView.debugOptions = [ARSCNDebugOptions.showFeaturePoints]
        
        // Set the view's delegate
        sceneView.delegate = self
        
        let sphhere = SCNSphere(radius: 0.2)
//
//
//       // let cude = SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0.01)
//
        let material = SCNMaterial()

        material.diffuse.contents = UIImage(named: "art.scnassets/8k_makemake_fictional.jpg")

        sphhere.materials = [material]


        let node = SCNNode()
        node.position = SCNVector3(x: 0, y: 0.1, z: -0.5)


        node.geometry = sphhere

        sceneView.scene.rootNode.addChildNode(node)
        sceneView.autoenablesDefaultLighting = true
        
//        // Create a new scene
//        let scene = SCNScene(named: "art.scnassets/diceCollada.scn")!
//
//        if let dicenode = scene.rootNode.childNode(withName: "Dice", recursively: true){
//
//        dicenode.position = SCNVector3(x: 0, y: 0, z: -0.1)
//
//        sceneView.scene.rootNode.addChildNode(dicenode)
//    }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()
        
//        configuration.planeDetection = .horizontal
        print(ARWorldTrackingConfiguration.isSupported)
        
        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }
    
//    func renderer(_ renderer: SCNSceneRenderer, didAdd node: SCNNode, for anchor: ARAnchor) {
//        if anchor is ARPlaneAnchor{
//
//            let planeanchor  = anchor as! ARPlaneAnchor
//            let plane = SCNPlane(width: CGFloat(planeanchor.extent.x), height: CGFloat(planeanchor.extent.z))
//
//            let node = SCNNode()
//            node.position = SCNVector3(x: planeanchor.center.x, y: 0, z: planeanchor.center.z)
//
//            node.transform = SCNMatrix4MakeRotation(-Float.pi/2, 1, 0, 0)
//
//            let grid = SCNMaterial()
//            grid.diffuse.contents = UIImage(named: "art.scnassets/grid.png")
//            plane.materials = [grid]
//            node.geometry = plane
//
//            node.addChildNode(node)
//
//        }else{
//            return
//        }
//    }
}
