public with sharing class AccountProcessorHandler {

    public static void handleBeforeInsert(List<Account> accList){
        for (Account acc : accList) {
            String temp=acc.Name+'('+acc.BillingState+')';
            acc.Name= temp;
         }
    }

    public static void handleAfterInsert(List<Account> accList){
        List<Contact> contList=new List<Contact>();
        for (Account acc : accList) {
            Contact tempCont=new Contact();
            tempCont.FirstName= 'Contact of ';
            // tempCont.LastName=acc.Name;
            tempCont.AccountId=acc.Id;
            contList.add(tempCont);
         }
         if(Contact.sObjectType.getDescribe().isCreateable()){
            insert(contList);
         }
    }
}