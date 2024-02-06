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
    // Design: Introducing high cyclomatic complexity
// Design: Introducing high NCSS line count method
    private void execute() {
        // Method with a high number of lines
        for (Integer i = 0; i < 10; i++) {
            System.debug('Iteration: ' + i);
            if (i % 2 == 0) {
                System.debug('Even');
            } else {
                System.debug('Odd');
            }
            // Simulate some additional logic
            if (i > 5) {
                System.debug('Greater than 5');
            } else {
                System.debug('Less than or equal to 5');
            }
            // Simulate more logic
            if (i == 8) {
                System.debug('Reached 8');
            }
            // And so on...
        }
    }
}
