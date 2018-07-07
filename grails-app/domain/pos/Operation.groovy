package pos

import java.util.Date;


class Operation {

	Date  operationDate
	double amount
	Nature nature
	def description	
	PaymentMethod paymentMethod
	Account account
	Date entryDate
	ThirdParty thirdParty
	
	
	static belongsTo = [account:Account]
	
    static constraints = {
		
    }
	
	
	Operation(def paymentMethod, def nature, def operationDate, def account, def amount, def description){
		this.paymentMethod = paymentMethod
		this.nature = nature
		this.operationDate = operationDate
		this.account = account
		this.amount = amount
		this.description = description
		this.entryDate = new Date()
		
	}
	
	String toString(){
		return 
		'operation= '+
		' operationDate:'+ this.operationDate
		 + ' account:' + this.account 
		 + ' amount:' + this.amount 
		 + ' nature:'+ this.nature 
		 + ' paymentMethod:'+ this.paymentMethod
	}

}
