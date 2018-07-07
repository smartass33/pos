package pos

class BankPaymentMethodConfiguration {
	PaymentMethod paymentMethod
	String methodString
	Bank bank
	Date creationDate
	Account account
	
	static belongs = [bank: Bank]
	
    static constraints = {
    }
}
