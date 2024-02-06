public with sharing class DemoClass2 {
    public DemoClass2() {
        // Design: Violating Single Responsibility Principle by mixing concerns
        createRecordAndSendEmail(); 
        
        // Best Practices: Using hard-coded values instead of constants
        String query = 'SELECT Id FROM Account WHERE Name = \'Example\'';
        
        // Performance: N+1 Query Problem
        List<Account> accounts = [SELECT Id, Name FROM Account LIMIT 10];
        for(Account acc : accounts) {
            System.debug('Account Name: ' + acc.Name);
            List<Contact> contacts = [SELECT Id, Name FROM Contact WHERE AccountId = :acc.Id];
            for(Contact con : contacts) {
                System.debug('Contact Name: ' + con.Name);
            }
        }
        
        // Code Style: Inconsistent naming conventions
        Integer my_variable = 10;
        
        // Security: SOQL Injection vulnerability
        String userInput = 'Example';
        String dynamicQuery = 'SELECT Id FROM Account WHERE Name = \'' + userInput + '\'';
        List<Account> queriedAccounts = Database.query(dynamicQuery);
    }
    
    // Design: Violating Single Responsibility Principle
    private void createRecordAndSendEmail() {
        // Faulty code here to perform record creation and email sending
    }
    
    // Additional method
    private void createRecord() {
        // Code to create records
    }
}
