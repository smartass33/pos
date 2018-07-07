package pos
import pos.PaymentMethod


class ThirdParty {

	String name
	Date creationDate
	
	static hasMany = [operation: Operation]
	
	ThirdParty(def name){
		this.name = name
		this.creationDate = new Date()
	}
	
	String toString(){
		return
		'thirdParty= '+this.name
	}
	
    static constraints = {
    }
}
