package pos

	
public enum Nature {

	DEBIT('D'),
	CREDIT('C')
	
	final String value
	Nature(String value){ this.value = value }
	@Override
	String toString(){ value }
	String getKey() { name() }
	

	
}
	

