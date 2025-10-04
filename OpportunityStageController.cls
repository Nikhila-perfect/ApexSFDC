public with sharing class OpportunityStageController {
    
    @AuraEnabled(cacheable=true)
    public static List<Opportunity> getOpportunityRecords(String stageName,String sortBy, String sortDirection){
        
        String query = 'Select id, Name,StageName,Amount,Closedate From Opportunity';

        if(String.isNotBlank(stageName) && stageName != 'All'){
            query += ' Where StageName = :stageName';

        }

        if(String.isNotBlank(sortBy))
        {
          query += 'Order By Amount DESC';
        }
        else{
            query += 'Order By ' + sortBy + ' '+ sortDirection;
        }

        System.debug('Query: ' + query);
        return Database.query(query);
}
}