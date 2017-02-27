package com.saumya.component;

import openfl.display.Graphics;

import com.saumya.component.MobilePanel;
import com.saumya.component.NavBarTop;

class AppScreen extends MobilePanel {

	private var appWidth:Float;
	private var appHeight:Float;
	private var appBgColor:UInt;
	
	public function new(screenWidth:Float,screenHeight:Float,bgColor:UInt=0x440000) {
		trace('AppScreen : Constructor : ');
		super(screenWidth,screenHeight,bgColor);

		this.appWidth = screenWidth;
		this.appHeight = screenHeight;
		this.appBgColor = bgColor;
	}
	
	override public function init():Void{
		trace('AppScreen : init : ');
		super.init();
	}

	override public function render():Void{
		trace('AppScreen : render : ');
		super.render();
		
		var navBarTop:NavBarTop = new NavBarTop(this.appWidth,this.appHeight,0x777777,60);
		this.addChild(navBarTop);
		//super.addChild(navBarTop);

	}

}