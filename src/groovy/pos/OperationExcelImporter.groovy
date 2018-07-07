package pos
import org.grails.plugins.excelimport.ExcelImportService
import org.grails.plugins.excelimport.*
import sample.*

class OperationExcelImporter extends AbstractExcelImporter {

  static Map CONFIG_BOOK_CELL_MAP = [
	 sheet:'Sheet2',
	 cellMap: [ 'D3':'title',
		'D4':'author',
		'D6':'numSold',
	  ]
  ]

  static Map CONFIG_BOOK_COLUMN_MAP = [
		  sheet:'Sheet1',
			 startRow: 2,
		  columnMap:  [
				  'B':'title',
				  'C':'author',
				  'D':'numSold',
		  ]
  ]

	//can also configure injection in resources.groovy
	def getExcelImportService() {
		ExcelImportService.getService()
	}

  public OperationExcelImporter(fileName) {
	super(fileName)
  }

  List<Map> getOperations() {
	List operationList = excelImportService.columns(workbook, CONFIG_BOOK_COLUMN_MAP)
  }


  Map getOneMoreOperationParams() {
	Map operationParams = excelImportService.cells(workbook, CONFIG_BOOK_CELL_MAP )
  }

}
