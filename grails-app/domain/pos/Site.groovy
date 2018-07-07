package pos

import java.util.Date;

class Site {
	String name
	double balance
	Date balanceDate
	Bank bank
	
    static constraints = {
		bank (blank: true,nullable:true)
    }
	
	String toString(){
		return this.name
	}
}
