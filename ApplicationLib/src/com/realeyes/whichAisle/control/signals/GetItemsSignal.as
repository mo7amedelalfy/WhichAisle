////////////////////////////////////////////////////////////////////////////////
//
//  Copyright (C) 2013 RealEyes Media LLC.
//
////////////////////////////////////////////////////////////////////////////////
package com.realeyes.whichAisle.control.signals
{
	import com.realeyes.whichAisle.control.commands.GetItemsCommand;
	
	import org.osflash.signals.Signal;
	
	public class GetItemsSignal extends Signal
	{
		//-----------------------------------------------------------
		//  INIT
		//-----------------------------------------------------------
		public function GetItemsSignal(...parameters)
		{
			super(parameters);
			
			//Ugly but efficient. Allows for refactoring later if a real command/signal map is used
			addOnce( new GetItemsCommand().execute );
		}
	}
}