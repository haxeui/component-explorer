package views;

import haxe.ui.Toolkit;
import haxe.ui.util.Color;
import haxe.ui.events.UIEvent;

using StringTools;

@:build(haxe.ui.macros.ComponentMacros.build("assets/views/filters.xml"))
class FiltersView extends View {
    @:bind(blurAmountSlider, UIEvent.CHANGE)
    private function onBlurValueChange(_) {
        var filter = 'filter: blur(${blurAmountSlider.pos}px)';
        blurTarget1.styleString = filter;
        blurTarget2.styleString = filter;
        blurText.text = filter;

        updateCompound();
    }

    @:bind(boxShadowOffsetX, UIEvent.CHANGE)
    @:bind(boxShadowOffsetY, UIEvent.CHANGE)
    @:bind(boxShadowColor, UIEvent.CHANGE)
    @:bind(boxShadowAlpha, UIEvent.CHANGE)
    @:bind(boxShadowBlurRadius, UIEvent.CHANGE)
    @:bind(boxShadowSpreadRadius, UIEvent.CHANGE)
    @:bind(boxShadowInset, UIEvent.CHANGE)
    private function onBoxShadowValueChange(_) {
        var color:Color = cast boxShadowColor.selectedItem; // TODO: investigate why this is needed, selectedItem should be a color already
        var filter = 'filter: box-shadow(${boxShadowOffsetX.pos}px, ${boxShadowOffsetY.pos}px, ${color.toHex()}, ${boxShadowAlpha.pos}, ${boxShadowBlurRadius.pos}px, ${boxShadowSpreadRadius.pos}px, ${boxShadowInset.selected})';
        boxShadowTarget1.styleString = filter;
        boxShadowTarget2.styleString = filter;
        boxShadowText.text = filter;

        updateCompound();
    }

    @:bind(grayscaleAmountSlider, UIEvent.CHANGE)
    private function onGrayscaleValueChange(_) {
        var filter = 'filter: grayscale(${grayscaleAmountSlider.pos})';
        grayscaleTarget1.styleString = filter;
        grayscaleTarget2.styleString = filter;
        grayscaleText.text = filter;

        updateCompound();
    }

    @:bind(tintColor, UIEvent.CHANGE)
    @:bind(tintAmountSlider, UIEvent.CHANGE)
    private function onTintValueChange(_) {
        var color:Color = cast tintColor.selectedItem; // TODO: investigate why this is needed, selectedItem should be a color already
        var filter = 'filter: tint(${color.toHex()}, ${tintAmountSlider.pos})';
        tintTarget1.styleString = filter;
        tintTarget2.styleString = filter;
        tintText.text = filter;

        updateCompound();
    }

    @:bind(compoundApplyBlurCheckbox, UIEvent.CHANGE)
    @:bind(compoundApplyBoxShadowCheckbox, UIEvent.CHANGE)
    @:bind(compoundApplyGrayscaleCheckbox, UIEvent.CHANGE)
    @:bind(compoundApplyTintCheckbox, UIEvent.CHANGE)
    private function onCompoundValueChange(_) {
        updateCompound();
    }

    private function updateCompound() {
        var filterParts = [];
        if (compoundApplyBlurCheckbox.selected) {
            filterParts.push(blurText.text.replace("filter: ", ""));
        }
        if (compoundApplyBoxShadowCheckbox.selected) {
            filterParts.push(boxShadowText.text.replace("filter: ", ""));
        }
        if (compoundApplyGrayscaleCheckbox.selected) {
            filterParts.push(grayscaleText.text.replace("filter: ", ""));
        }
        if (compoundApplyTintCheckbox.selected) {
            filterParts.push(tintText.text.replace("filter: ", ""));
        }

        if (filterParts.length == 0) {
            compoundTarget1.styleString = "filter: none";
            compoundTarget2.styleString = "filter: none";
        } else {
            var filter = "filter: " + filterParts.join(" ");

            compoundTarget1.styleString = filter;
            compoundTarget2.styleString = filter;
            compoundText.text = filter;
        }
    }
}