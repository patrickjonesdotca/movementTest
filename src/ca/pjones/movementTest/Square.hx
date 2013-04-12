package ca.pjones.movementTest;
import nme.display.Sprite;
import nme.events.MouseEvent;
import nme.events.Event;
/**
 * ...
 * @author pjonesdotca
 */
class Square extends Sprite
{
	public var selected = false;
	private var locX : Int;
	private var locY : Int;
	private var mywidth : Int;
	private var myheight : Int;
	
	private var moveTargetX : Int;
	private var moveTargetY : Int;
	private var hasMoveTarget : Bool;
	
	public function new(xarg: Int, yarg: Int, width: Int, height: Int) 
	{
		this.graphics.beginFill(0xFF0000);
		this.graphics.drawRect(xarg, yarg, width, height);
		this.graphics.endFill();
		this.locX = xarg;
		this.locY = yarg;
		this.mywidth = width;
		this.myheight = height;
		addEventListener(MouseEvent.CLICK, onClick);
		addEventListener(Event.ENTER_FRAME, enterFrame);
		super();
	}
	
	public function setMoveTarget(targetX: Float, targetY: Float):Void 
	{
		this.moveTargetX = cast(targetX, Int);
		this.moveTargetY = cast(targetY, Int);
		this.hasMoveTarget = true;
	}
	
	private function enterFrame(e:Event):Void 
	{
		if (this.hasMoveTarget == true) 
		{
			var deltaX = Math.abs(moveTargetX - this.locX);
			var deltaY = Math.abs(moveTargetY - this.locY);
			if (deltaX > 0) 
			{
				this.locX += 1;
			}
			if (deltaY > 0) 
			{
				this.locY += 1;
			}
			if (deltaX == 0 && deltaY == 0) 
			{
				this.hasMoveTarget = false;
			}
		}
	}
	
	private function onClick(e:MouseEvent):Void 
	{
		swapSelectedState();
		this.graphics.drawRect(this.locX, this.locY, this.width, this.height);
		this.graphics.endFill();
	}
	
	private function swapSelectedState():Void 
	{
		if (selected == true)
		{
			this.selected = false;
			this.graphics.beginFill(0xFF0000);	
		}
		else 
		{
			this.selected = true;
			this.graphics.beginFill(0x00FF00);
		}
	}
	
	
}