package{
    import org.flixel.*;

	import flash.utils.setTimeout;
	import flash.utils.clearInterval;

    public class EndState extends FlxState{
        public var times:Number;
        public var caught:Boolean

		public var restartTimer:uint;

        public function EndState(sex:Number, caught:Boolean){
            times = sex;
            this.caught = caught;
        }

        override public function create():void{
            var t:FlxText;
            FlxG.mouse.hide();
            var textWidth:Number = FlxG.width;
            if(times == 1){
                t = new FlxText(0,FlxG.height/2-50, textWidth,"You might have done sex\n" + times + " time...?");
                t.setFormat("Minecraftia-Regular",16,0xffffffff,"center");
                add(t);
            } else {
                t = new FlxText(0,FlxG.height/2-50, textWidth,"You might have done sex\n" + times + " times...?");
                t.setFormat("Minecraftia-Regular",16,0xffffffff,"center");
                add(t);
            }
            if (this.caught) {
                t.text += "\nEep! Mom saw!";
            } else {
                t.text += "\nAnd you didn't get caught!";
            }
            t = new FlxText(0,FlxG.height-40,FlxG.width,"Press any key to play again");
            t.setFormat("Minecraftia-Regular",16,0xffffffff,"center");
            add(t);

			// Set restart timer
			restartTimer = setTimeout(restartGame, 30000);

		}

        override public function update():void{
            super.update();

            if(FlxG.keys.any()){
                FlxG.switchState(new MenuState());
            }
        }

		public function restartGame ():void {
			FlxG.switchState(new MenuState());
		}
		
    }
}
