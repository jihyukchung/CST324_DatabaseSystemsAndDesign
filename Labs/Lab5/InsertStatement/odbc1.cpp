#include <windows.h>
#include <sql.h>
#include <sqlext.h>
#include <iostream>
using namespace std;

void main()
{
	SQLHANDLE henv;
	SQLHANDLE hdbc;
	SQLHANDLE hstmt;
	const char* query = "SET IDENTITY_INSERT Categories ON; insert into Categories(CategoryID, CategoryName) values(5, 'Piano'); SET IDENTITY_INSERT Categories OFF;";
	char id [100];
	char region[100];
	SDWORD cbQual;


	SQLAllocHandle(SQL_HANDLE_ENV, SQL_NULL_HANDLE, &henv);
	SQLSetEnvAttr(henv, SQL_ATTR_ODBC_VERSION, (SQLPOINTER)SQL_OV_ODBC3, SQL_IS_INTEGER);
	SQLAllocHandle(SQL_HANDLE_DBC, henv, &hdbc);
	SQLConnect(hdbc, (unsigned char *)"Lab5_SQL", SQL_NTS, 
		             (unsigned char *)"jihyukchung", SQL_NTS,
					 (unsigned char *)"jihyukchung", SQL_NTS);
	SQLAllocHandle(SQL_HANDLE_STMT, hdbc, &hstmt);
	SQLExecDirect(hstmt, (unsigned char *)query, SQL_NTS);

	//SQLBindCol(hstmt, 1, SQL_CHAR, id, 100, &cbQual);
	//SQLBindCol(hstmt, 2, SQL_CHAR, region, 100, &cbQual);

	//while(!SQLFetch(hstmt))
	//	cout << id << '\t' << region << endl;

	SQLFreeHandle(SQL_HANDLE_STMT, hstmt);
	SQLDisconnect(hdbc);
	SQLFreeHandle(SQL_HANDLE_DBC, hdbc);
	SQLFreeHandle(SQL_NULL_HANDLE, henv);

}




