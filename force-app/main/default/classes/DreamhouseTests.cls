@IsTest
public class DreamhouseTests {
  static testMethod void testController() {
    DreamHouseSampleDataController.deleteAll();
    System.assertEquals(0, [SELECT COUNT() FROM favorite__c]);
    System.assertEquals(0, [SELECT COUNT() FROM favorite__c]);
    System.assertEquals(0, [SELECT COUNT() FROM property__c]);
    System.assertEquals(0, [SELECT COUNT() FROM broker__c]);
    System.assertEquals(0, [SELECT COUNT() FROM LeadAssociation__c]);
    System.assertEquals(0, [SELECT COUNT() FROM Lead WHERE company = 'Dreamhouse']);
  }

  static testMethod void testGetPropertiesApexController() {
    Property__c p1 = new Property__c(Name = 'Prop 1', Beds__c = 2, Baths__c = 2, Price__c = 1000);
    Property__c p2 = new Property__c(Name = 'Prop 2', Beds__c = 2, Baths__c = 2, Price__c = 2000);
    insert p1;
    insert p2;

    PageReference pref = Page.Similar_Properties;
    pref.getParameters().put('id', p1.id);
    Test.setCurrentPage(pref);

    ApexPages.StandardController con = new ApexPages.StandardController(p1);
    GetPropertiesApexController ext = new GetPropertiesApexController(con);
    System.assertEquals(1, ext.getProperties().size());
  }

  static testMethod void testGetSimilarProperties() {
    Id recordId = 'a0341000002670mAAA';
    String searchCriteria = 'Price';
    Decimal beds = 3;
    Decimal price = 500000;
    Decimal priceRange = 100000;
    MyPropertyController.getSimilarProperties(recordId, searchCriteria, beds, price, priceRange);

    recordId = 'a0341000002670mAAA';
    searchCriteria = 'Bedrooms';
    beds = 4;
    price = 600000;
    priceRange = 50000;
    MyPropertyController.getSimilarProperties(recordId, searchCriteria, beds, price, priceRange);
  }

  static testMethod void testDreamhouseProspects() {
    Lead l = new Lead(LastName = 'the Bear', Company = 'Dreamhouse');
    insert l;
    DreamhouseProspects dhp = new DreamhouseProspects();
    System.assertEquals(1, dhp.getLeads().size());
    dhp.sortList();
    dhp.sortOrder = 'LastName';
    System.assertEquals(1, dhp.getLeads().size());
    //List<Lead> leads = dhp.getLeads();
  }

  static testMethod void testPickListController() {
    String objObject = 'Property__c';
    String fld = 'Status__c';
    PickListController.getPickListValuesIntoList(objObject, fld);
  }
}
