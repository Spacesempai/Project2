({
    addToCard: function (component) {
        let componentEvent = component.getEvent('addToCard');
        let item = component.get('v.item');
        let inputNumber = component.find('inputNumber').get('v.value');
        if(inputNumber > item.Quantity__c)
        {
            alert("Unfortunately we don`t have enough items in the storage.")
        }
        else {
        componentEvent.setParams({
            'orderItem': {
                'sobjectType': 'Order_Product_Lines__c',
                'Product__c': item.Id,
                'Model__c': item.Name,
                'Category__c': item.Category__c,
                'Image__c': item.Image__c,
                'Price__c': item.Price__c,
                'Quantity__c': inputNumber
            }
        });
        componentEvent.fire();
        }
    }   
});