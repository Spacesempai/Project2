trigger ProductQuantityTrigger on Order_Product_Lines__c (after insert, after update) {
    if(trigger.isAfter)
    {
        Map<Id,Shop_Product__c> mapofproducts = new Map<Id,Shop_Product__c> ( [SELECT Id, Quantity__c FROM Shop_Product__c] );
        if(trigger.isInsert )
        {
            for(Order_Product_Lines__c oItem : trigger.new)
            {
                if(oItem.Product__c != null)
                {
                    Shop_Product__c product = mapofproducts.get(oItem.Product__c);
                    if(product.Quantity__c - oItem.Quantity__c >=0 )
                    {
                        product.Quantity__c -= oItem.Quantity__c;
                    }                   
                }
            }
            update mapofproducts.values();
        }
    }
}