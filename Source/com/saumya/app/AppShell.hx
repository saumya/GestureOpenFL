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

	public function init():DisplayObject{
		trace('TODO: Render the Application');
		var s:MobilePanel = new MobilePanel(this.screenWidth,this.screenHeight);
		return s;
	}
}
