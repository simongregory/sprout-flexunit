package
{

import flash.display.Sprite;

import org.flexunit.internals.TraceListener;
import org.flexunit.runner.FlexUnitCore;

public class <%= test_runner_name %> extends Sprite
{
    private var core:FlexUnitCore;

    public function <%= test_runner_name %>()
    {
        core = new FlexUnitCore();
        core.addListener(new TraceListener());
        core.run(AllTests);
    }

}
}
