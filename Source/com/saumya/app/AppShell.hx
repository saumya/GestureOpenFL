//

package com.saumya.app;

import openfl.display.DisplayObject;
import openfl.display.Sprite;
import openfl.events.Event;

import com.saumya.component.MobilePanel;
import com.saumya.component.AppScreen;


class AppShell {

	private var screenWidth:Float;
	private var screenHeight:Float;
	//
	private var numScreens:UInt;
	private var numScreenCounter:UInt;
	private var allScreens:Array<AppScreen>;
	
	public function new(width:Float,height:Float) {
		this.screenWidth = width;
		this.screenHeight = height;
		this.numScreens = 0;
		this.numScreenCounter = 1;
		this.allScreens = new Array<AppScreen>();

	}

	public function init(view:Sprite):DisplayObject{
		trace('init');
		// Make some buttons

		//render
		this.render(view);
		return view;
	}

	public function render(view:Sprite):DisplayObject{
		//
		view.addEventListener(MobilePanel.IS_ACTIVE,onPanelActive);
		//
		var s1:AppScreen = new AppScreen(this.screenWidth,this.screenHeight,0xFF0000);
		var s2:AppScreen = new AppScreen(this.screenWidth,this.screenHeight,0x00FF00);
		var s3:AppScreen = new AppScreen(this.screenWidth,this.screenHeight,0x0000FF);
		var s4:AppScreen = new AppScreen(this.screenWidth,this.screenHeight,0xFF00FF);
		view.addChild(s1);
		view.addChild(s2);
		view.addChild(s3);
		view.addChild(s4);
		//
		this.allScreens.push(s1);
		this.allScreens.push(s2);
		this.allScreens.push(s3);
		this.allScreens.push(s4);
		//
		this.numScreens = 4;

		return view;
	}

	private function onPanelActive(e:Event):Void{
		trace('onPanelActive : numScreenCounter:'+this.numScreenCounter);
		this.numScreenCounter ++;
		trace('onPanelActive : numScreenCounter:'+this.numScreenCounter);
		if (this.numScreenCounter>this.numScreens) {
			//rewind
			for (i in 0 ... this.numScreens) {
				var aScreen:AppScreen = this.allScreens[i];
				aScreen.bringToVisibleStage();
				this.numScreenCounter = 1;
			}
		}
	}
}
