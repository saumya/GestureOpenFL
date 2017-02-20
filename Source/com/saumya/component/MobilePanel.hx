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

	private var initX:Float;
	private var finalX:Float;
	private var shouldDrag:Bool;

	private var dragOffsetX:Float;
	private var dragOffsetY:Float;

	public function new(screenWidth:Float,screenHeight:Float) {
		super();
		this.sWidth = screenWidth;
		this.sHeight = screenHeight;
		init();	
	}

	public function init():Void{
		
		this.shouldDrag = false;

		this.addEventListener(Event.ADDED_TO_STAGE,onAddedToStage);
		
		/*
		this.addEventListener(TouchEvent.TOUCH_BEGIN,onTouchBegin);
		this.addEventListener(TouchEvent.TOUCH_END,onTouchEnd);
		*/
		/*
		this.addEventListener(MouseEvent.MOUSE_DOWN,onMouseDown);
		this.addEventListener(MouseEvent.MOUSE_UP,onMouseUp);
		*/
		
		//render();
	}

	public function render():Void{

		var bg:Graphics = this.graphics;
		bg.clear();
		bg.beginFill(0x440000,1.0);
		bg.drawRect(0,0,this.sWidth,this.sHeight);
		bg.endFill();
	}

	/*
	private function onTouchBegin(e:TouchEvent):Void{
		trace('onTouchBegin');
		trace('stage: x='+e.stageX+': y='+e.stageY);
		trace('local: x='+e.localX+': y='+e.localY);
	}
	private function onTouchEnd(e:TouchEvent):Void{
		trace('onTouchEnd');
		trace('stage: x='+e.stageX+': y='+e.stageY);
		trace('local: x='+e.localX+': y='+e.localY);
	}
	*/

	private function onAddedToStage(e:Event):Void{
		trace('onAddedToStage');
		this.removeEventListener(Event.ADDED_TO_STAGE,onAddedToStage);

		this.addEventListener(MouseEvent.MOUSE_DOWN,onMouseDown);
		//this.stage.addEventListener(MouseEvent.MOUSE_UP,onMouseUp);
		//this.addEventListener(MouseEvent.MOUSE_MOVE,onMouseMove);
		//
		render();
	}

	private function onMouseDown(e:MouseEvent):Void{
		trace('onMouseDown');
		//trace('stage: x='+e.stageX+': y='+e.stageY);
		//trace('local: x='+e.localX+': y='+e.localY);
		//this.initX = e.stageX;
		//
		//this.startDrag();
		//this.shouldDrag = true;

		this.stage.addEventListener(MouseEvent.MOUSE_UP,stage_onMouseUp);
		this.stage.addEventListener(MouseEvent.MOUSE_MOVE,stage_onMouseMove);
		//
		this.dragOffsetX = this.x - e.localX;
		this.dragOffsetY = this.y - e.localY;
		//
		this.initX = e.localX;
	}

	private function stage_onMouseMove(event:MouseEvent):Void{
		//Actuate.tween (this, 0.4

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
		//
		if(this.finalX > this.initX){
			// move right
			if(this.finalX-this.initX > 100){
				Actuate.tween (this, 1, { x: this.sWidth, y:0 }).delay(0);
			}else{
				Actuate.tween (this, 1, { x: 0, y:0 }).delay(0);
			}
			

		}else if(this.finalX < this.initX){
			// move left
			if(this.initX-this.finalX > 100){
				Actuate.tween (this, 1, { x: this.sWidth*(-1), y:0 }).delay(0);
			}else{
				Actuate.tween (this, 1, { x: 0, y:0 }).delay(0);
			}
			//Actuate.tween (this, 1, { x: this.sWidth*(-1) }).delay(0);
		} else {
			// Do Nothing
		}
	}

	/*
	private function onMouseMove(e:MouseEvent):Void{
		trace('onMouseMove');
		this.y = 0;
	}
	private function onMouseUp(e:MouseEvent):Void{
		trace('onMouseUp');
		//this.shouldDrag = false;
		//this.finalX = e.stageX;
		//this.stopDrag();
		
		//trace('stage: x='+e.stageX+': y='+e.stageY);
		//trace('local: x='+e.localX+': y='+e.localY);
		this.finalX = e.stageX;
		this.stopDrag();

		if(this.finalX > this.initX){
			// move right
			if(this.finalX-this.initX > 100){
				Actuate.tween (this, 1, { x: this.sWidth, y:0 }).delay(0);
			}else{
				Actuate.tween (this, 1, { x: 0, y:0 }).delay(0);
			}
			

		}else if(this.finalX < this.initX){
			// move left
			if(this.initX-this.finalX > 100){
				Actuate.tween (this, 1, { x: this.sWidth*(-1), y:0 }).delay(0);
			}else{
				Actuate.tween (this, 1, { x: 0, y:0 }).delay(0);
			}
			//Actuate.tween (this, 1, { x: this.sWidth*(-1) }).delay(0);
		} else {
			// Do Nothing
		}
		
	}
	*/

}