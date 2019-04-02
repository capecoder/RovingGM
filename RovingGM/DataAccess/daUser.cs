using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using RovingGM.DataAccess;

namespace RovingGM.DataAccess
{
	/// <summary>
	/// Summary description for daUser.
	/// </summary>
	public class daUser
	{
		public daUser()
		{
		}


		public dsUser GetAllUsers() 
		{

			dsUser tempDS = new dsUser();
			SqlConnection connection=new SqlConnection(
				Configuration.GetValue("DSN"));

			connection.Open();

			SqlCommand command=new SqlCommand();
			command.CommandText="Users_GetAll";
			command.CommandType=CommandType.StoredProcedure;
			SqlParameterCollection parameters=command.Parameters;
			command.Connection = connection;

			SqlDataAdapter da=new SqlDataAdapter(command);

			da.Fill(tempDS);

			connection.Close();

			return(tempDS);
		}

		public dsUser UserByEmail (string Email) 
		{
			dsUser tempDS = new dsUser();
			SqlConnection connection=new SqlConnection(
				Configuration.GetValue("DSN"));

			connection.Open();

			SqlCommand command=new SqlCommand();
			command.CommandText="FindUserByEmail";
			command.CommandType=CommandType.StoredProcedure;
			command.Connection = connection;
			SqlParameterCollection parameters=command.Parameters;

			DbUtility.AddParameter(parameters,
				SqlDbType.NVarChar, 50, "@Email", Email);

			SqlDataAdapter da=new SqlDataAdapter(command);

			da.Fill(tempDS);

			connection.Close();

			return(tempDS);
		}

		public dsUser UserByID (int id) 
		{
			dsUser tempDS = new dsUser();
			SqlConnection connection=new SqlConnection(
				Configuration.GetValue("DSN"));

			connection.Open();

			SqlCommand command=new SqlCommand();
			command.CommandText="FindUserByID";
			command.CommandType=CommandType.StoredProcedure;
			command.Connection = connection;
			SqlParameterCollection parameters=command.Parameters;

			DbUtility.AddParameter(parameters,
				SqlDbType.Int, 50, "@id", id);

			SqlDataAdapter da=new SqlDataAdapter(command);

			da.Fill(tempDS);

			connection.Close();

			return(tempDS);
		}
		
		public void Save (dsUser p_ds) 
		{
			//this is executed from authorize.aspx
			DbUtility.ExecStoredProcForSave(
				p_ds.Tables[0],
				User_Insert(),
				User_Update(),
				User_Delete());
		}

		private SqlCommand User_Insert()
		{
			//this is executed from XXX.aspx
			SqlCommand command=new SqlCommand();
			command.CommandText="User_Insert";
			command.CommandType=CommandType.StoredProcedure;
			SqlParameterCollection parameters=command.Parameters;

			DbUtility.AddParameterForDataAdapterCall(parameters, 
				SqlDbType.NVarChar, 250, "@Email", 
				"Email", ParameterDirection.Input);
			DbUtility.AddParameterForDataAdapterCall(parameters, 
				SqlDbType.NVarChar, 150, "@FirstName", 
				"FirstName", ParameterDirection.Input);
			DbUtility.AddParameterForDataAdapterCall(parameters, 
				SqlDbType.NVarChar, 50, "@LastName", 
				"LastName", ParameterDirection.Input);
			DbUtility.AddParameterForDataAdapterCall(parameters, 
				SqlDbType.NVarChar, 50, "@Password", 
				"Password", ParameterDirection.Input);
			DbUtility.AddParameterForDataAdapterCall(parameters, 
				SqlDbType.Int, 4, "@SecurityLevel", 
				"SecurityLevel", ParameterDirection.Input);
			DbUtility.AddParameterForDataAdapterCall(parameters, 
				SqlDbType.NVarChar, 50, "@Store", 
				"Store", ParameterDirection.Input);
			DbUtility.AddParameterForDataAdapterCall(parameters, 
				SqlDbType.NVarChar, 50, "@CreatedBy", 
				"CreatedBy", ParameterDirection.Input);
			return command;
		}


		private SqlCommand User_Update()
		{
			//this is executed from claim.save in authorize.aspx
			SqlCommand command=new SqlCommand();
			command.CommandText="User_Update";
			command.CommandType=CommandType.StoredProcedure;
			SqlParameterCollection parameters=command.Parameters;
			DbUtility.AddParameterForDataAdapterCall(parameters, 
				SqlDbType.Int, 8, "@UserID", 
				"UserID", ParameterDirection.Input);
			DbUtility.AddParameterForDataAdapterCall(parameters, 
				SqlDbType.NVarChar, 250, "@Email", 
				"Email", ParameterDirection.Input);
			DbUtility.AddParameterForDataAdapterCall(parameters, 
				SqlDbType.NVarChar, 150, "@FirstName", 
				"FirstName", ParameterDirection.Input);
			DbUtility.AddParameterForDataAdapterCall(parameters, 
				SqlDbType.NVarChar, 50, "@LastName", 
				"LastName", ParameterDirection.Input);
			DbUtility.AddParameterForDataAdapterCall(parameters, 
				SqlDbType.NVarChar, 50, "@Password", 
				"Password", ParameterDirection.Input);
			DbUtility.AddParameterForDataAdapterCall(parameters, 
				SqlDbType.Int, 4, "@SecurityLevel", 
				"SecurityLevel", ParameterDirection.Input);
			DbUtility.AddParameterForDataAdapterCall(parameters, 
				SqlDbType.NVarChar, 50, "@Store", 
				"Store", ParameterDirection.Input);
			return command;
		}

		private SqlCommand User_Delete() 
		{
			SqlCommand command=new SqlCommand();
			command.CommandText="User_Delete";
			command.CommandType=CommandType.StoredProcedure;
			SqlParameterCollection parameters=command.Parameters;
			
			DbUtility.AddParameterForDataAdapterCall(parameters, 
				SqlDbType.Int, 8, "@UserID", 
				"UserID", ParameterDirection.Input);
			return command;
		}
	}
}
