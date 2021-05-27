trigger MinimumQuantityTrigger on Shop_Product__c (after insert, after update) {
    List<Shop_Product__c> productUpdate = new List<Shop_Product__c>();

    for(Shop_Product__c product : trigger.new)
    {
        if(product.Quantity__c < 3 ) 
        {           
            productUpdate.add(new Shop_Product__c(Id = product.Id, Quantity__c = product.Quantity__c + 5 ));
        }            
        else if (product.Quantity__c == null)
        {
            productUpdate.add(new Shop_Product__c(Id = product.Id, Quantity__c =  5 ));
        } 
    }
    update productUpdate;
}