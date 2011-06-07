package <%= package_name %>

{

import org.flexunit.Assert;

public class <%= test_class_name %>

{
    private var <%= instance_name %>:<%= class_name %>;

    [Before]
    public function setUp():void
    {
        <%= instance_name %> = new <%= class_name %>();
    }

    [After]
    public function tearDown():void
    {
        <%= instance_name %> = null;
    }

    [Test]
    public function shouldBeInstantiated():void
    {
        Assert.assertTrue("<%= instance_name %> is <%= class_name %>", <%= instance_name %> is <%= class_name %>);
    }
}

}
