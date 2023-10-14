package views;
import haxe.ui.core.ItemRenderer;
import haxe.ui.tooltips.ToolTipManager;

@:build(haxe.ui.macros.ComponentMacros.build("assets/views/tooltips.xml"))
class TooltipsView extends View {
    public function new() {
        super();
        
        var tooltipRenderer = new CustomToolTip();
        
        // current custom tooltips must be assigned in code
        ToolTipManager.instance.registerTooltip(customTooltip1, { renderer: tooltipRenderer, tipData: { image: "haxeui-core/styles/shared/error-large.png", title: "Custom Tool Tip #1", footer: "Footer #1", content: "This is the content for tooltip #1\n\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Ut ornare risus dolor, fringilla dapibus risus venenatis vitae. Donec et neque sem. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Donec vitae varius justo. Morbi in purus tellus. Nam et arcu velit. Suspendisse dictum at odio non porta. Nullam fermentum suscipit nulla, quis feugiat libero." } });
        ToolTipManager.instance.registerTooltip(customTooltip2, { renderer: tooltipRenderer, tipData: { image: "haxeui-core/styles/shared/help-large.png", title: "Custom Tool Tip #2", footer: "Footer #2", content: "This is the content for tooltip #2\n\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Ut ornare risus dolor, fringilla dapibus risus venenatis vitae. Donec et neque sem. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Donec vitae varius justo. Morbi in purus tellus. Nam et arcu velit. Suspendisse dictum at odio non porta. Nullam fermentum suscipit nulla, quis feugiat libero." } });
        ToolTipManager.instance.registerTooltip(customTooltip3, { renderer: tooltipRenderer, tipData: { image: "haxeui-core/styles/shared/info-large.png", title: "Custom Tool Tip #3", footer: "Footer #3", content: "This is the content for tooltip #3\n\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Ut ornare risus dolor, fringilla dapibus risus venenatis vitae. Donec et neque sem. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Donec vitae varius justo. Morbi in purus tellus. Nam et arcu velit. Suspendisse dictum at odio non porta. Nullam fermentum suscipit nulla, quis feugiat libero." } });
        ToolTipManager.instance.registerTooltip(customTooltip4, { renderer: tooltipRenderer, tipData: { image: "haxeui-core/styles/shared/warning-large.png", title: "Custom Tool Tip #4", footer: "Footer #4", content: "This is the content for tooltip #4\n\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Ut ornare risus dolor, fringilla dapibus risus venenatis vitae. Donec et neque sem. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Donec vitae varius justo. Morbi in purus tellus. Nam et arcu velit. Suspendisse dictum at odio non porta. Nullam fermentum suscipit nulla, quis feugiat libero." } });
        ToolTipManager.instance.registerTooltip(customTooltip5, { renderer: tooltipRenderer, tipData: { image: "haxeui-core/styles/shared/error-large.png", title: "Custom Tool Tip #5", footer: "Footer #5", content: "This is the content for tooltip #5\n\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Ut ornare risus dolor, fringilla dapibus risus venenatis vitae. Donec et neque sem. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Donec vitae varius justo. Morbi in purus tellus. Nam et arcu velit. Suspendisse dictum at odio non porta. Nullam fermentum suscipit nulla, quis feugiat libero." } });
        ToolTipManager.instance.registerTooltip(customTooltip6, { renderer: tooltipRenderer, tipData: { image: "haxeui-core/styles/shared/help-large.png", title: "Custom Tool Tip #6", footer: "Footer #6", content: "This is the content for tooltip #6\n\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Ut ornare risus dolor, fringilla dapibus risus venenatis vitae. Donec et neque sem. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Donec vitae varius justo. Morbi in purus tellus. Nam et arcu velit. Suspendisse dictum at odio non porta. Nullam fermentum suscipit nulla, quis feugiat libero." } });
        ToolTipManager.instance.registerTooltip(customTooltip7, { renderer: tooltipRenderer, tipData: { image: "haxeui-core/styles/shared/info-large.png", title: "Custom Tool Tip #7", footer: "Footer #7", content: "This is the content for tooltip #7\n\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Ut ornare risus dolor, fringilla dapibus risus venenatis vitae. Donec et neque sem. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Donec vitae varius justo. Morbi in purus tellus. Nam et arcu velit. Suspendisse dictum at odio non porta. Nullam fermentum suscipit nulla, quis feugiat libero." } });
        ToolTipManager.instance.registerTooltip(customTooltip8, { renderer: tooltipRenderer, tipData: { image: "haxeui-core/styles/shared/warning-large.png", title: "Custom Tool Tip #8", footer: "Footer #8", content: "This is the content for tooltip #8\n\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Ut ornare risus dolor, fringilla dapibus risus venenatis vitae. Donec et neque sem. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Donec vitae varius justo. Morbi in purus tellus. Nam et arcu velit. Suspendisse dictum at odio non porta. Nullam fermentum suscipit nulla, quis feugiat libero." } });
        ToolTipManager.instance.registerTooltip(customTooltip9, { renderer: tooltipRenderer, tipData: { image: "haxeui-core/styles/shared/error-large.png", title: "Custom Tool Tip #9", footer: "Footer #9", content: "This is the content for tooltip #9\n\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Ut ornare risus dolor, fringilla dapibus risus venenatis vitae. Donec et neque sem. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Donec vitae varius justo. Morbi in purus tellus. Nam et arcu velit. Suspendisse dictum at odio non porta. Nullam fermentum suscipit nulla, quis feugiat libero." } });
    }
}

@:xml('
<item-renderer layout="horizontal" width="350">
    <image id="image" />
    <vbox width="100%">
        <label id="title" style="font-size: 20;text-decoration:underline" />
        <label id="content" width="100%" />
        <rule />
        <label id="footer" width="100%" style="font-style: italic" />
    </vbox>
</item-renderer>
')
private class CustomToolTip extends ItemRenderer {
    
}