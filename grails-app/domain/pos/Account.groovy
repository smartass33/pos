package pos
import pos.PaymentMethod


class Account {

	String name
	long number
	Date creationDate
	
	static hasMany = [operation: Operation]
	
    static constraints = {
    }
}
