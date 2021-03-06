////////////////////////////////////////////////////////////////////////////////
//
//  Copyright (C) 2013 RealEyes Media LLC.
//
////////////////////////////////////////////////////////////////////////////////
package com.realeyes.whichAisle.views
{
	import com.danielfreeman.madcomponents.UI;
	import com.danielfreeman.madcomponents.UIButton;
	import com.danielfreeman.madcomponents.UIForm;
	import com.danielfreeman.madcomponents.UILabel;
	import com.danielfreeman.madcomponents.UINavigation;
	import com.realeyes.whichAisle.control.navigation.NavigationManager;
	import com.realeyes.whichAisle.control.presenters.MainViewPresenter;
	import com.realeyes.whichAisle.control.signals.InitApplicationSignal;
	import com.realeyes.whichAisle.control.signals.NavigationSignal;
	import com.realeyes.whichAisle.model.ApplicationModel;
	import com.realeyes.whichAisle.model.constants.Screens;
	import com.realeyes.whichAisle.model.vos.requests.NavigationRequest;
	
	import flash.display.Sprite;
	import flash.events.Event;
	
	
	[SWF( width="480", height="800")]
	public class MainView extends Sprite
	{
		//-----------------------------------------------------------
		//  DECLARATIONS
		//-----------------------------------------------------------
		public var presenter:MainViewPresenter;
		
		public const layoutXML:XML = 	<navigation id="nav" title="Title" background="#666666" colour="#FF3300" lazyRender="true" recycle="true">
											{TitleScreen.layoutXML}
											{ItemsListScreen.layoutXML}
											{AddItemScreen.layoutXML}
										</navigation>;
		
		public var uiNavigation:UINavigation;
		
		public var titleScreen:TitleScreen;
		public var itemsListScreen:ItemsListScreen;
		public var addItemScreen:AddItemScreen;
									
		
		//-----------------------------------------------------------
		//  INIT
		//-----------------------------------------------------------
		public function MainView()
		{
			super();
			
			presenter = new MainViewPresenter();
			
			addEventListener( Event.ADDED_TO_STAGE, _onAddedToStage );
		}
		
		private function _init():void
		{
			_initLayout();
			_initListeners();
			
			//Kick off the application start
			new InitApplicationSignal().dispatch();
		}
		
		private function _onAddedToStage( event:Event ):void
		{
			removeEventListener( Event.ADDED_TO_STAGE, _onAddedToStage );
			_init();
		}
		
		private function _initLayout():void
		{
			UI.create( this, layoutXML );
			
			uiNavigation = UINavigation( UI.findViewById( "nav" ) );
			uiNavigation.autoBack = uiNavigation.autoForward = false;
			var navManager:NavigationManager = new NavigationManager( uiNavigation );
			presenter.registerNavigation( navManager );
			
			titleScreen = new TitleScreen( UIForm( uiNavigation.pages[ navManager.getIndexForScreen( Screens.TITLE_SCREEN ) ] ) );
			itemsListScreen = new ItemsListScreen( UIForm( uiNavigation.pages[ navManager.getIndexForScreen( Screens.ITEMS_LIST ) ] ) );
			addItemScreen = new AddItemScreen( UIForm( uiNavigation.pages[ navManager.getIndexForScreen( Screens.ADD_ITEM ) ] ) );
			
			
			titleScreen.initialize();
		}
		
		private function _initListeners():void
		{
			//Presenter listeners
			
			//UI Listeners
		}
		
		
		//-----------------------------------------------------------
		//  CONTROL
		//-----------------------------------------------------------
		
		
		//-----------------------------------------------------------
		//  EVENT LISTENERS
		//-----------------------------------------------------------
		//=== Presenter Listeners ===
		
		//=== UI Listeners ==

		
		//-----------------------------------------------------------
		//  GETTERS/SETTERS
		//-----------------------------------------------------------	
	}
}