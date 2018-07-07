package pos


class Bank {

	String name
	Date creationDate
	long accountNumber
	
	static belongs = [site: Site]
	

}
