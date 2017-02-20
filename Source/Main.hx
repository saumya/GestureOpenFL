package;


import openfl.display.Sprite;
import openfl.events.Event;

import com.saumya.app.AppShell;


class Main extends Sprite {
	
	private var appShell:AppShell;
	
	public function new () {
		super ();
		this.addEventListener(Event.ADDED_TO_STAGE,onAddedToStage);
	}

	private function onAddedToStage(e:Event):Void{
		trace('onAddedToStage: width='+this.stage.stageWidth+': height='+this.stage.stageHeight);
		
		this.removeEventListener(Event.ADDED_TO_STAGE,onAddedToStage);

		/*
		this.gameView = new GameMobileShell(this.stage.stageWidth,this.stage.stageHeight);
		this.addChild(this.gameView);
		this.gameView.init();
		*/

		this.appShell = new AppShell(this.stage.stageWidth,this.stage.stageHeight);
		this.addChild(this.appShell.init());
	}
	
	
}