//
//  GameScene.swift
//  Game5
//
//  Created by Abhineet Sharma on 3/20/17.
//  Copyright © 2017 Abhineet Sharma. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    let bgImage = SKSpriteNode(imageNamed: "game-background")
    let player = SKSpriteNode(imageNamed: "player")
    
    let staticTimeLabel = SKLabelNode(fontNamed: "SF Pixelate Bold")
    let killedTimeLabel = SKLabelNode(fontNamed: "SF Pixelate Bold")
    
    let monsterNeededToWin = 30
    var monstersDestroyed = 0 {
        willSet {
            killedTimeLabel.text = "\(100*newValue/monsterNeededToWin)%"
        }
    }

    
    override func didMove(to view: SKView) {
        bgImage.position = CGPoint(x: size.width/2, y: size.height/2)
        bgImage.zPosition = -1.0
        addChild(bgImage)
        
        // Player
        player.position = CGPoint(x: size.width * 0.1, y: size.height * 0.5)
        addChild(player)
        
        // Static label
        staticTimeLabel.text = "Killed Time"
        staticTimeLabel.fontSize = 25
        staticTimeLabel.fontColor = SKColor.green
        staticTimeLabel.position = CGPoint(x: 0.83*size.width, y: 0.93*size.height)
        addChild(staticTimeLabel)
        
        // Score label
        killedTimeLabel.text = "0%"
        killedTimeLabel.fontSize = 27
        killedTimeLabel.fontColor = SKColor.green
        killedTimeLabel.position = CGPoint(x: 0.83*size.width, y: 0.83*size.height)
        addChild(killedTimeLabel)
        
        physicsWorld.gravity = CGVector.zero
        physicsWorld.contactDelegate = self
        
        run(SKAction.repeatForever(
            SKAction.sequence([
                SKAction.run(addMonster),
                SKAction.wait(forDuration: 1.0)
                ])
        ))
        
        let backgroundMusic = SKAudioNode(fileNamed: "woodies.caf")
        backgroundMusic.autoplayLooped = true
        addChild(backgroundMusic)
       
    }
    
    
    func touchDown(atPoint pos : CGPoint) {
        
    }
    
    func touchMoved(toPoint pos : CGPoint) {
        
    }
    
    func touchUp(atPoint pos : CGPoint) {
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
