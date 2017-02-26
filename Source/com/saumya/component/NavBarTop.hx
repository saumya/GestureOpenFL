
package com.saumya.component;

import openfl.display.Sprite;
import openfl.display.Graphics;

class NavBarTop extends Sprite {
	
	private var sWidth:Float;
	private var sHeight:Float;
	private var barColor:UInt;
	private var barHeight:Float;

	public function new(screenWidth:Float,screenHeight:Float,bgColor:UInt=0x440000,bgHeight:Float=50) {
		super();
		this.sWidth = screenWidth;
		this.sHeight = screenHeight;
		this.barColor = bgColor;
		this.barHeight = bgHeight;

		init();
	}
	public function init():Void{
		render();
	}
	public function render():Void{
		this.drawGraphics();
	}
	private function drawGraphics():Void{
		var topBar:Graphics = this.graphics;
		topBar.clear();
		topBar.beginFill(0x000000,1.0);
		topBar.drawRect(0,0,this.barColor,this.barHeight);
		topBar.endFill();
	}
}