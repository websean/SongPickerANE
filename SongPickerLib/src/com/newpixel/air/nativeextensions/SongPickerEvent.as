package com.newpixel.air.nativeextensions
{
	import flash.events.Event;
	import com.adobe.serialization.json.EzJSON;
	
	public class SongPickerEvent extends Event
	{
		// events
		public static const SONG_CHOSEN:String = "songChosen";
		public static const SONG_FINISHED:String = "songFinished";
		public static const CANCELLED_SONG_PICKER:String = "cancelledSongPicker";
		
		// properties
		private var _jsonResult:String;
		
		public var ID:String;
		public var title:String;
		public var artist:String;
		public var duration:int;
		
		////////////////////////////////////////////////////////////
		// CONSTRUCTOR				
		public function SongPickerEvent(type:String, pickerResult:String="", bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
			
			// parse out data fields
			_jsonResult = pickerResult;
			if (_jsonResult != "")
			{
				var valuePairs:Object = EzJSON.decode(_jsonResult);
				ID = valuePairs.ID;
				title = valuePairs.title;
				artist = valuePairs.artist;
				duration = valuePairs.duration;
			}
		}
		
		public override function clone():Event
		{
			return new SongPickerEvent(type, _jsonResult);
		}
		
	}
}