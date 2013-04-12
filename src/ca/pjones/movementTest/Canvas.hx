package ca.pjones.movementTest;
import nme.display.Sprite;
import nme.events.MouseEvent;
/**
 * ...
 * @author pjonesdotca
 */
class Canvas extends Sprite
{

	public function new(xArg: Int, yArg: Int) 
	{
		super();
		this.graphics.beginFill(0);
		this.graphics.drawRect(0, 0, xArg, yArg);
		addEventListener(MouseEvent.CLICK, setTarget);
	}
	
	private function setTarget(e:MouseEvent):Void 
	{
		
	}
	
}