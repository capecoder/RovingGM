using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;


namespace RovingGM.DataAccess
{
	/// <summary>
	/// Summary description for daUser.
	/// </summary>
	public class daUsers
	{
		public daUsers()
		{

		}


		public dsUsers GetAllUsers() 
		{

			dsUsers tempDS = new dsUsers();
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
	}
}
