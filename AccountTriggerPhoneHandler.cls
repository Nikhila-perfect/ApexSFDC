public with sharing class AccountTriggerPhoneHandler {
    
    
    public static void  afterUpdate(List<Account> newAccountList,Map<Id,Account> oldAccountMap) {
       
        List<Contact> updatedConList = new List<Contact>();
        for(Account acct:newAccountList)
        {
            Map<Id,String> accountIdPhoneMap = new Map<Id,String>();
            String newPhoneNumber = acct.Phone;
            String oldPhoneNumber = oldAccountMap.get(acct.Id).Phone;
           if(newPhoneNumber != oldPhoneNumber)
            accountIdPhoneMap.put(acc.Id,oldPhoneNumber);

         }
   
         if(!accountIdPhoneMap.isEmpty())
         {
            for(Account acc: [select id,phone,(select id, phone from Contacts) from Account where id in:accountIdPhoneMap.keySet()])
            {
             String newAccPhoneNumber = acc.Phone;
             String oldAccPhoneNumber = accountIdPhoneMap.get(acc.Id).Phone;
             List<Contact> conList = acc.Contacts;
             for(Contact con :conList)
             {
               if(String.isBlank(con.Phone) || con.Phone == oldAccPhoneNumber)
               {
                  con.Phone = newAccPhoneNumber;
                  updatedConList.add(con);
               }
             }
            }
         }

         if(!updatedConList.isEmpty())
         {
           update  updatedConList;
         }
    }
}