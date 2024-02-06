public with sharing class DemoClass2 {
    
    // Faulty Design: Excessive class size
    // Having too many methods or being overly complex can lead to maintainability issues.
    // Here, I'll just add some extra methods to make the class bigger.
    public DemoClass2() {
        // Constructor
    }

    public void method1() {
        // Method 1
    }

    public void method2() {
        // Method 2
    }

    public void method3() {
        // Method 3
    }

    // Faulty Best Practice: Unused variables
    // Declaring variables that are not used can clutter the code and confuse other developers.
    // Here, I'll declare an unused variable.
    public void unusedVariableExample() {
        String unusedVariable; // Unused variable
    }

    // Faulty Performance: Expensive loop
    // Using a nested loop with a high iteration count can lead to performance issues.
    // Here, I'll create a nested loop with a high iteration count.
    public void nestedLoopExample() {
        for (Integer i = 0; i < 1000; i++) {
            for (Integer j = 0; j < 1000; j++) {
                // Some operation
            }
        }
    }

    // Faulty Code Style: Inconsistent indentation
    // Inconsistent indentation makes the code harder to read and understand.
    // Here, I'll use inconsistent indentation.
    public void inconsistentIndentation() {
    System.debug('This line has inconsistent indentation');
        System.debug('This line has consistent indentation');
    }

    // Faulty Security: SOQL Injection vulnerability
    // Using dynamic SOQL without proper sanitization can lead to SOQL injection vulnerabilities.
    // Here, I'll demonstrate a simple example of dynamic SOQL without proper sanitization.
    public void dynamicSOQL(String input) {
        String query = 'SELECT Id FROM Account WHERE Name = \'' + input + '\'';
        List<Account> accounts = Database.query(query);
    }
}
