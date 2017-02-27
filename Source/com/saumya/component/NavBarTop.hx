
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
		trace('NavBarTop : Constructor : ');
		this.sWidth = screenWidth;
		this.sHeight = screenHeight;
		this.barColor = bgColor;
		this.barHeight = bgHeight;

		init();
	}
	public function init():Void{
		trace('NavBarTop : init : ');
		render();
	}
	public function render():Void{
		trace('NavBarTop : render : ');
		this.drawGraphics();
	}
	private function drawGraphics():Void{
		trace('NavBarTop : drawGraphics : ');
		var topBar:Graphics = this.graphics;
		// whole bar
		topBar.clear();
		topBar.beginFill(this.barColor,1.0);
		topBar.drawRect(0,0,this.sWidth,this.barHeight);
		topBar.endFill();
		// LeftBarItem / RightBarItem
		addLeftButton();
		addRightButton();
	}
	// API
	public function addLeftButton():Void{
		var topBar:Graphics = this.graphics;
		//topBar.clear();
		topBar.beginFill(0x999999,1.0);
		topBar.drawRect(0,0,80,this.barHeight);
		topBar.endFill();
	}
	public function addRightButton():Void{
		var topBar:Graphics = this.graphics;
		//topBar.clear();
		topBar.beginFill(0x999999,1.0);
		topBar.drawRect((this.sWidth-80),0,80,this.barHeight);
		topBar.endFill();
	}
}