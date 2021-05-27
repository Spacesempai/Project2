public with sharing class ProductController {
	@AuraEnabled
	public static List<Shop_Product__c>  searchProducts(String parametr) {
		List<Shop_Product__c> productsList = new List<Shop_Product__c>();
		List<List<Object>> findingProducts = [FIND :parametr IN ALL FIELDS RETURNING Shop_Product__c(Id, Name,
		Quantity__c, Category__c, Category__r.Name,Image__c,  Price__c, Description__c)];
		productsList = (Shop_Product__c[])findingProducts[0];
		return productsList;
	}

	@AuraEnabled
	public static List<Shop_Product__c> getAllProducts() {
		List<Shop_Product__c> productList = new List<Shop_Product__c>();
		productList = [SELECT Id, Name, Quantity__c, Category__c, 
				Image__c, Price__c,  Description__c,Category__r.Name
				FROM Shop_Product__c];
		return productList;
	}	
	@AuraEnabled
	public static List<Shop_Product__c> getBrandsList() {
		List<Shop_Product__c> productList = new List<Shop_Product__c>();
		productList = [SELECT Category__c,Category__r.Name
				FROM Shop_Product__c];
		return productList;
	}

	@AuraEnabled
	public static List<Shop_Product__c> getSelectedProducts(String Brand) {
		List<Shop_Product__c> productList = new List<Shop_Product__c>();
		If (Brand == 'Select All') {
			productList = [SELECT Id, Name, Quantity__c,Category__c,
					Image__c,Price__c,  Description__c,Category__r.Name
					FROM Shop_Product__c];
		}

		else {
			productList = [SELECT Id, Name, Quantity__c, Category__c,
					Image__c,  Price__c, Description__c,Category__r.Name
					FROM Shop_Product__c
					WHERE Category__c = :Brand];
		}
		return productList;
	}
}