Feature: Manage Asks

	Scenario: Create new ask
		Given the input description "Who created this project?" and input details "I want know it."
		When the ask form is loaded
		Then the ask should be saved
		
	Scenario: 