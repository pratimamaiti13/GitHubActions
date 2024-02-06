public with sharing class DemoClass2 {
    public DemoClass2() {
        // Best Practices: Using constants instead of hard-coded values
        String query = 'SELECT Id FROM Account WHERE Name = :Constants.EXAMPLE_NAME';

        // Performance: Avoiding N+1 Query Problem by using a single query with a subquery
        List<Account> accountsWithContacts = [SELECT Id, Name, (SELECT Id, Name FROM Contacts) FROM Account LIMIT 10];
        for(Account acc : accountsWithContacts) {
            System.debug('Account Name: ' + acc.Name);
            for(Contact con : acc.Contacts) {
                System.debug('Contact Name: ' + con.Name);
            }
        }

        // Security: Preventing SOQL Injection by using parameterized queries
        String userInput = 'Example';
        List<Account> queriedAccounts = [SELECT Id FROM Account WHERE Name = :userInput];

        // Design: Separate concerns to adhere to the Single Responsibility Principle
        createRecord();
        sendEmail();
        execute();
    }
    
    // Design: Each method now follows the Single Responsibility Principle
    private void createRecord() {
        // Code to create records
    }

    private void sendEmail() {
        // Code to send emails
    }

    private void execute() {
        // Code with reduced cyclomatic complexity and NCSS line count
        for (Integer i = 0; i < 10; i++) {
            System.debug('Iteration: ' + i);
            if (i % 2 == 0) {
                System.debug('Even');
            } else {
                System.debug('Odd');
            }
            // Simplified logic
            if (i > 5) {
                System.debug('Greater than 5');
            } else {
                System.debug('Less than or equal to 5');
            }
            // Simplified logic
            if (i == 8) {
                System.debug('Reached 8');
            }
        }
    }
}
