//

package com.saumya.app;

import openfl.display.DisplayObject;
import openfl.display.Sprite;

import com.saumya.component.MobilePanel;
import com.saumya.component.AppScreen;


class AppShell {

	private var screenWidth:Float;
	private var screenHeight:Float;
	
	public function new(width:Float,height:Float) {
		this.screenWidth = width;
		this.screenHeight = height;
	}

	public function init(view:Sprite):DisplayObject{
		trace('TODO: Render the Application');
		var s1:AppScreen = new AppScreen(this.screenWidth,this.screenHeight,0xFF0000);
		var s2:AppScreen = new AppScreen(this.screenWidth,this.screenHeight,0x00FF00);
		var s3:AppScreen = new AppScreen(this.screenWidth,this.screenHeight,0x0000FF);
		var s4:AppScreen = new AppScreen(this.screenWidth,this.screenHeight,0xFF00FF);
		view.addChild(s1);
		view.addChild(s2);
		view.addChild(s3);
		view.addChild(s4);
		return view;
	}
}
