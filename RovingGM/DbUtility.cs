using System;
using System.Data;
using System.Data.Common;
using System.Data.SqlClient;


namespace RovingGM
{
	/// <summary>
	/// Utility functions for database queries.
	/// </summary>
	public class DbUtility
	{
		/// <summary>
		/// Adds a parameter to a SqlCommand object for a stored procedure call.
		/// </summary>
		/// <param name="p_params"></param>
		/// <param name="p_dataType"></param>
		/// <param name="p_size"></param>
		/// <param name="p_name"></param>
		/// <param name="p_value"></param>
		public static void AddParameter(
			SqlParameterCollection p_params, SqlDbType p_dataType, 
			int p_size, string p_name, object p_value)
		{
			// get a new parameter
			SqlParameter tempParam=new SqlParameter(
				p_name, p_dataType, p_size);
			
			// set the parameter value
			tempParam.Value=p_value;
			
			// add it to the parameter collection
			p_params.Add(tempParam);

		}

		/// <summary>
		/// Adds a parameter to a SqlCommand for a stored procedure call that 
		/// is used to populate a dataset through a SqlDataAdapter.
		/// </summary>
		/// <param name="p_params"></param>
		/// <param name="p_dataType"></param>
		/// <param name="p_size"></param>
		/// <param name="p_name"></param>
		/// <param name="p_sourceColumn"></param>
		/// <param name="p_direction"></param>
		public static void AddParameterForDataAdapterCall(
			SqlParameterCollection p_params, SqlDbType p_dataType, 
			int p_size, string p_name, string p_sourceColumn, 
			ParameterDirection p_direction)
		{
		
			// get a new parameter

			SqlParameter tempParam=null;
			
			if (p_dataType==SqlDbType.Text)
			{
				tempParam=new SqlParameter(p_name, SqlDbType.Text);
				tempParam.SourceColumn=p_sourceColumn;
			}
			else
			{
				tempParam=new SqlParameter(
					p_name, p_dataType, p_size, p_sourceColumn);
			}

			if (p_direction!=ParameterDirection.Input)
			{
				tempParam.Direction=p_direction;
			}

			// add it to the parameter collection
			p_params.Add(tempParam);

		}

		/// <summary>
		/// Adds a parameter to a SqlCommand for a stored procedure call that 
		/// is used to populate a dataset through a SqlDataAdapter.
		/// </summary>
		/// <param name="p_params"></param>
		/// <param name="p_dataType"></param>
		/// <param name="p_size"></param>
		/// <param name="p_direction"></param>
		/// <param name="p_name"></param>
		/// <param name="p_value"></param>
		public static void AddParameter(
			SqlParameterCollection p_params, SqlDbType p_dataType, 
			int p_size, ParameterDirection p_direction,
			string p_name, object p_value)
		{
			// get a new parameter
			SqlParameter tempParam=new SqlParameter(
				p_name, p_dataType, p_size);
			
			tempParam.Direction=p_direction;

			// set the parameter value
			tempParam.Value=p_value;
			
			// add it to the parameter collection
			p_params.Add(tempParam);

		}	


		public static void ExecSql(string sql) 
		{
			SqlConnection conn = NewDBConnection();

			conn.Open();

			SqlCommand cmd = new SqlCommand(sql,conn);

			cmd.ExecuteNonQuery();

			conn.Close();
		}


		/// <summary>
		/// Executes a stored procedure for select
		/// </summary>
		/// <param name="p_datatable">Data table</param>
		/// <param name="p_selectCmd">Select command</param>
		public static void ExecStoredProcForSelect(
			DataTable p_datatable, SqlCommand p_selectCmd)
		{
			SqlConnection conn = NewDBConnection();

			//Add Connection to Commmands
			p_selectCmd.Connection = conn;

			//Set up Data Adapter
			SqlDataAdapter da = new SqlDataAdapter();
			da.SelectCommand = p_selectCmd;

			//Open DB
			conn.Open();

			//Do Select
			try
			{
				da.Fill(p_datatable);
			}
			catch(SqlException ex)
			{
				HandleSqlException(ex);
			}
			

			//Clean up
			conn.Close();
			da.Dispose();
			conn.Dispose();
		}

		/// <summary>
		/// Executes a stored procedure for select
		/// </summary>
		/// <param name="p_datatable">Data set</param>
		/// <param name="p_selectCmd">Select command</param>
		/// <param name="p_tableMappings">Table mappings</param>
		public static void ExecStoredProcForSelect(
			DataSet p_dataSet, SqlCommand p_selectCmd, 
			DataTableMappingCollection p_tableMappings)
		{
			SqlConnection conn = NewDBConnection();

			//Add Connection to Commmands
			p_selectCmd.Connection = conn;

			//Set up Data Adapter
			SqlDataAdapter da = new SqlDataAdapter();
			da.SelectCommand = p_selectCmd;
			foreach (DataTableMapping m in p_tableMappings)
			{
				da.TableMappings.Add(m.SourceTable, m.DataSetTable);
			}
			

			//Open DB
			conn.Open();

			//Do Select
			try
			{
				da.Fill(p_dataSet);
			}
			catch(SqlException ex)
			{
				HandleSqlException(ex);
			}
			
			//Clean up
			conn.Close();
			da.Dispose();
			conn.Dispose();
		}

		/// <summary>
		/// Execute a stored procedure for save
		/// </summary>
		/// <param name="p_datatable">Data table</param>
		/// <param name="p_insertCmd">Insert command</param>
		/// <param name="p_updateCmd">Update command</param>
		/// <param name="p_deleteCmd">Delete command</param>
		public static void ExecStoredProcForSave(
			DataTable p_datatable, SqlCommand p_insertCmd,
			SqlCommand p_updateCmd, SqlCommand p_deleteCmd)
		{
			SqlConnection conn = NewDBConnection();
			SqlDataAdapter da = new SqlDataAdapter();
			
			//Add Connection to Commmands
			if (p_insertCmd != null)
			{
				p_insertCmd.Connection = conn;
				da.InsertCommand = p_insertCmd;
			}

			if (p_updateCmd != null)
			{
				p_updateCmd.Connection = conn;
				da.UpdateCommand = p_updateCmd;
			}

			if (p_deleteCmd != null)
			{
				p_deleteCmd.Connection = conn;
				da.DeleteCommand = p_deleteCmd;
			}

			//Open DB
			conn.Open();

			//Execute Updates
			try
			{
				da.Update(p_datatable);
			}
			catch(SqlException ex)
			{
				HandleSqlException(ex);
			}

			//Clean up
			conn.Close();
			conn.Dispose();
			da.Dispose();
		}

		/// <summary>
		/// Execute a stored procedure for save with transaction 
		/// support
		/// </summary>
		/// <param name="p_datatable">Data table</param>
		/// <param name="p_insertCmd">Insert command</param>
		/// <param name="p_updateCmd">Update command</param>
		/// <param name="p_deleteCmd">Delete command</param>
		/// <param name="p_connection">Transaction object</param>
		public static void ExecStoredProcForSave(
			DataTable p_datatable, SqlCommand p_insertCmd,
			SqlCommand p_updateCmd, SqlCommand p_deleteCmd,
			SqlTransaction p_transaction)
		{
			//Add Connection to Commmands
			p_insertCmd.Connection = p_transaction.Connection;
			p_updateCmd.Connection = p_transaction.Connection;
			p_deleteCmd.Connection = p_transaction.Connection;

			p_insertCmd.Transaction = p_transaction;
			p_updateCmd.Transaction = p_transaction;
			p_deleteCmd.Transaction = p_transaction;

			//Set up Data Adapter
			SqlDataAdapter da = new SqlDataAdapter();
			da.InsertCommand = p_insertCmd;
			da.UpdateCommand = p_updateCmd;
			da.DeleteCommand = p_deleteCmd;

			//Execute Updates
			try
			{
				da.Update(p_datatable);
			}
			catch(SqlException ex)
			{
				HandleSqlException(ex);
			}

			//Clean up
			da.Dispose();
		}

		/// <summary>
		/// Creates a new database connection
		/// </summary>
		/// <returns>Database connection object</returns>
		public static SqlConnection NewDBConnection()
		{
			return new SqlConnection(
				Configuration.GetValue(
				Configuration.DB_CONN_STR));

			
		}

		/// <summary>
		/// Executes a stored procedure for select
		/// </summary>
		/// <param name="p_datatable">Data set</param>
		/// <param name="p_selectCmd">Select command</param>
		/// <param name="p_tableMappings">Table mappings</param>
		public static void ExecSqlForSelect(
			DataTable p_dataTable, string p_sql)
		{
			SqlConnection conn = NewDBConnection();

			SqlCommand command=new SqlCommand();

			command.CommandType=CommandType.Text;
			command.CommandText=p_sql;

			//Add Connection to Commmands
			command.Connection = conn;

			//Set up Data Adapter
			SqlDataAdapter da = new SqlDataAdapter();
			da.SelectCommand = command;
			
			//Open DB
			conn.Open();

			//Do Select
			try
			{
				da.Fill(p_dataTable);
			}
			catch(SqlException ex)
			{
				HandleSqlException(ex);
			}
			
			//Clean up
			conn.Close();
			da.Dispose();
			conn.Dispose();
		}


		public static void HandleSqlException(SqlException p_exception)
		{
			throw new Exception(
				"Sql Exception: " + 
				p_exception.Message, p_exception);

			/*
			switch (p_exception.Number)
			{
				case 20001: //Duplicate PK
					throw new ConstraintException();
				case 20020: //Row Not Found
					throw new RowNotInTableException();
				default:
					throw new TimesheetException("Sql Exception: " + 
						p_exception.Number, p_exception);
			}
			*/
		}

		public static Object HandleDBNulls(string DtaType, Object Value)
		{
			switch (DtaType.ToUpper())
			{
				case "INT":
					if (Value is DBNull) return 0;
					else goto default;
				case "STRING":
					if (Value is DBNull) return "";
					else goto default;
				case "DATETIME":
					if (Value is DBNull) return DateTime.MinValue;
					else goto default;
				case "BOOL":
					if (Value is DBNull) return false;
					else goto default;
				case "BYTE":
					if (Value is DBNull) return 0;
					else goto default;
				case "SHORT":
					if (Value is DBNull) return 0;
					else goto default;
				default:
					return Value;
			}
		}
	}
}
