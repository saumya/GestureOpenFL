//

package com.saumya.component;

import openfl.display.Graphics;
import openfl.display.Sprite;

import openfl.events.Event;
import openfl.events.TouchEvent;
import openfl.events.MouseEvent;

import motion.Actuate;


class MobilePanel extends Sprite {

	private var sWidth:Float;
	private var sHeight:Float;
	private var screenColor:UInt;

	private var initX:Float;
	private var finalX:Float;
	private var shouldDrag:Bool;

	private var dragOffsetX:Float;
	private var dragOffsetY:Float;

	public static var IS_ACTIVE:String = 'isActiveEvent';

	public function new(screenWidth:Float,screenHeight:Float,bgColor:UInt=0x440000) {
		trace('MobilePanel : Constructor : ');
		super();
		this.sWidth = screenWidth;
		this.sHeight = screenHeight;
		this.screenColor = bgColor;
		init();	
	}

	public function init():Void{
		trace('MobilePanel : init : ');
		this.addEventListener(Event.ADDED_TO_STAGE,onAddedToStage);
	}

	public function render():Void{
		trace('MobilePanel : render : ');
		
		var bg:Graphics = this.graphics;
		bg.clear();
		bg.beginFill(this.screenColor,1.0);
		bg.drawRect(0,0,this.sWidth,this.sHeight);
		bg.endFill();
		
	}

	private function onAddedToStage(e:Event):Void{
		trace('MobilePanel : onAddedToStage : ');
		this.removeEventListener(Event.ADDED_TO_STAGE,onAddedToStage);
		this.addEventListener(MouseEvent.MOUSE_DOWN,onMouseDown);
		render();
	}

	private function onMouseDown(e:MouseEvent):Void{
		this.stage.addEventListener(MouseEvent.MOUSE_UP,stage_onMouseUp);
		this.stage.addEventListener(MouseEvent.MOUSE_MOVE,stage_onMouseMove);
		//
		this.dragOffsetX = this.x - e.localX;
		this.dragOffsetY = this.y - e.localY;
		//
		this.initX = e.localX;
	}

	private function stage_onMouseMove(event:MouseEvent):Void{
		var targetX = event.localX + this.dragOffsetX;
		//var targetY = event.mouseY + this.dragOffsetY;
		this.x = this.x + (targetX - this.x) * 0.5;
		//y = y + (targetY - y) * 0.5;
	}
	private function stage_onMouseUp(event:MouseEvent):Void{
		this.stage.removeEventListener (MouseEvent.MOUSE_UP, stage_onMouseUp);
		this.stage.removeEventListener (MouseEvent.MOUSE_MOVE, stage_onMouseMove);
		//
		this.finalX = event.localX;
		if(this.finalX > this.initX){
			// move right
			if(this.finalX-this.initX > 100){
				Actuate.tween (this, 1, { x: this.sWidth, y:0 }).delay(0);
				this.dispatchEvent(new Event(MobilePanel.IS_ACTIVE,true,true));
			}else{
				// rewind to original position
				Actuate.tween (this, 1, { x: 0, y:0 }).delay(0);
			}
		}else if(this.finalX < this.initX){
			// move left
			if(this.initX-this.finalX > 100){
				Actuate.tween (this, 1, { x: this.sWidth*(-1), y:0 }).delay(0);
				this.dispatchEvent(new Event(MobilePanel.IS_ACTIVE,true,true));
			}else{
				// rewind to original position
				Actuate.tween (this, 1, { x: 0, y:0 }).delay(0);
			}
			//Actuate.tween (this, 1, { x: this.sWidth*(-1) }).delay(0);
		} else {
			// Do Nothing
		}
	}
	// API
	public function bringToVisibleStage():Void{
		Actuate.tween (this, 1, { x: 0, y:0 }).delay(0);
	}

}