({
    removeFromOrder: function (component) {
        let itemIndex = component.get('v.index');
        let componentEvent = component.getEvent('deleteFromOrder');
        componentEvent.setParams({'index': itemIndex});
        componentEvent.fire();
    },

    fireUpdateItemQuantityEvent: function (component, event) {
        let componentEvent = component.getEvent('updateItemQuantity');
        componentEvent.fire();
    }
});