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
		var acolor1 = Math.floor(Math.random()*(256*256*256));
		var acolor2 = Math.floor(Math.random()*(256*256*256));
		var acolor3 = Math.floor(Math.random()*(256*256*256));
		var acolor4 = Math.floor(Math.random()*(256*256*256));
		var acolor5 = Math.floor(Math.random()*(256*256*256));
		var acolor6 = Math.floor(Math.random()*(256*256*256));
		/*
		var s1:AppScreen = new AppScreen(this.screenWidth,this.screenHeight,0xFF0000);
		var s2:AppScreen = new AppScreen(this.screenWidth,this.screenHeight,0x00FF00);
		var s3:AppScreen = new AppScreen(this.screenWidth,this.screenHeight,0x0000FF);
		var s4:AppScreen = new AppScreen(this.screenWidth,this.screenHeight,0xFF00FF);
		var s5:AppScreen = new AppScreen(this.screenWidth,this.screenHeight,0xFFFF00);
		var s6:AppScreen = new AppScreen(this.screenWidth,this.screenHeight,0x00FFFF);
		*/
		var s1:AppScreen = new AppScreen(this.screenWidth,this.screenHeight,acolor1);
		var s2:AppScreen = new AppScreen(this.screenWidth,this.screenHeight,acolor2);
		var s3:AppScreen = new AppScreen(this.screenWidth,this.screenHeight,acolor3);
		var s4:AppScreen = new AppScreen(this.screenWidth,this.screenHeight,acolor4);
		var s5:AppScreen = new AppScreen(this.screenWidth,this.screenHeight,acolor5);
		var s6:AppScreen = new AppScreen(this.screenWidth,this.screenHeight,acolor6);
		//
		view.addChild(s1);
		view.addChild(s2);
		view.addChild(s3);
		view.addChild(s4);
		view.addChild(s5);
		view.addChild(s6);
		//
		this.allScreens.push(s1);
		this.allScreens.push(s2);
		this.allScreens.push(s3);
		this.allScreens.push(s4);
		this.allScreens.push(s5);
		this.allScreens.push(s6);
		//
		this.numScreens = 6;

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
