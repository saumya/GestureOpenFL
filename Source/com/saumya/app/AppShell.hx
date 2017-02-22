//

package com.saumya.app;

import openfl.display.DisplayObject;
import openfl.display.Sprite;

import com.saumya.component.MobilePanel;


class AppShell {

	private var screenWidth:Float;
	private var screenHeight:Float;
	
	public function new(width:Float,height:Float) {
		this.screenWidth = width;
		this.screenHeight = height;
	}

	public function init(view:Sprite):DisplayObject{
		trace('TODO: Render the Application');
		var s1:MobilePanel = new MobilePanel(this.screenWidth,this.screenHeight,0xFF0000);
		var s2:MobilePanel = new MobilePanel(this.screenWidth,this.screenHeight,0x00FF00);
		view.addChild(s1);
		view.addChild(s2);
		return view;
	}
}
