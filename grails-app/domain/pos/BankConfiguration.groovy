package pos

class BankConfiguration {
	String lineSeparator
	String fileExtension
	Bank bank 
	Date creationDate 
	
	static belongs = [bank: Bank]
	
    static constraints = {
    }
}
