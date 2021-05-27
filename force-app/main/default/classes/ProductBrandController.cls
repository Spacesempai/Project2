public with sharing class ProductBrandController {
    @AuraEnabled
    public static List<Category__c> getBrandsList() {
        List<Category__c> productList = new List<Category__c>();
        productList = [SELECT Name FROM Category__c];
        return productList;
    }

    @AuraEnabled
    public static List<Shop_Product__c> getSelectedProducts(String Brand) {
        List<Shop_Product__c> productList = new List<Shop_Product__c>();
        If (Brand == 'Select All') {
            productList = [SELECT Id, Name, Quantity__c, Category__c, 
            Image__c,  Price__c, Description__c,Category__r.Name
            FROM Shop_Product__c];
        }
        else {
            productList = [
                    SELECT Id, Name, Quantity__c, Category__c, 
                    Image__c,  Price__c, Description__c,Category__r.Name
                    FROM Shop_Product__c
                    WHERE Category__c = :Brand
            ];
        }
        return productList;
    }

    @AuraEnabled
    public static List<Shop_Product__c> getCountByBrands() {
        List<Shop_Product__c> CountByBrandsList = [SELECT Category__c,  Category__r.Name
       											  FROM Shop_Product__c];
        return CountByBrandsList;
    }
}