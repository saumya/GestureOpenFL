package com.saumya.component;

import openfl.display.Graphics;

import com.saumya.component.MobilePanel;

class AppScreen extends MobilePanel {

	private var appWidth:Float;
	private var appHeight:Float;
	private var appBgColor:UInt;
	
	public function new(screenWidth:Float,screenHeight:Float,bgColor:UInt=0x440000) {
		super(screenWidth,screenHeight,bgColor);

		this.appWidth = screenWidth;
		this.appHeight = screenHeight;
		this.appBgColor = bgColor;
	}
	
	override public function init():Void{
		super.init();
	}

	override public function render():Void{
		super.render();

		var topBar:Graphics = this.graphics;
		//topBar.clear();
		topBar.beginFill(0x000000,1.0);
		topBar.drawRect(0,0,this.appWidth,50);
		topBar.endFill();
	}

}