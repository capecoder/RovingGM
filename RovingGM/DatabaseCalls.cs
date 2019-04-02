using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for DatabaseCalls
/// </summary>
namespace RovingGM
{
    public class DatabaseCalls
    {
        string connectionString = ConfigurationManager.ConnectionStrings["rovingGMConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["rovingGMConnectionString"].ConnectionString);//EmpCon;TEST
        SessionWrapper sw = new SessionWrapper();

        private void fnConOpen()
        {
            con.ConnectionString = ConfigurationManager.ConnectionStrings["rovingGMConnectionString"].ConnectionString;
            con.Open();
        }

        public void fnConClose()
        {
            if (con.State != ConnectionState.Closed)
            {
                con.Close();
            }
        }

        public DataTable FindUserByEmailPassword(string email, string password)
        {
            User user = new User();
            try
            {
                fnConOpen();
                SqlCommand objCommand = new SqlCommand();
                objCommand.Connection = con;
                objCommand.CommandType = System.Data.CommandType.StoredProcedure;
                objCommand.CommandText = "dbo.FindUserByEmailPassword";
                objCommand.Parameters.AddWithValue("@Email", email);
                objCommand.Parameters.AddWithValue("@Password", password);
                SqlDataReader reader = objCommand.ExecuteReader();
                DataTable dt = new DataTable();
                dt.Load(reader);
                fnConClose();
                return dt;
            }
            catch (Exception)
            {
                throw;
            }

        }

        public DataTable GetUserByEmail(string email)
        {
            User user = new User();
            try
            {
                fnConOpen();
                SqlCommand objCommand = new SqlCommand();
                objCommand.Connection = con;
                objCommand.CommandType = System.Data.CommandType.StoredProcedure;
                objCommand.CommandText = "dbo.FindUserByEmail"; //?? todo here
                objCommand.Parameters.AddWithValue("@Email", email);
                SqlDataReader reader = objCommand.ExecuteReader();
                DataTable dt = new DataTable();
                dt.Load(reader);
                fnConClose();
                return dt;
            }
            catch (Exception)
            {
                throw;
            }

        }

        public DataTable GetManagerByEmail(string email)
        {
            User user = new User();
            try
            {
                fnConOpen();
                SqlCommand objCommand = new SqlCommand();
                objCommand.Connection = con;
                objCommand.CommandType = System.Data.CommandType.StoredProcedure;
                objCommand.CommandText = "dbo.FindManagerByEmail"; //?? todo here
                objCommand.Parameters.AddWithValue("@Email", email);
                SqlDataReader reader = objCommand.ExecuteReader();
                DataTable dt = new DataTable();
                dt.Load(reader);
                fnConClose();
                return dt;
            }
            catch (Exception)
            {
                throw;
            }

        }

        public DataTable GetUserByID(int ID)
        {
            User user = new User();
            try
            {
                fnConOpen();
                SqlCommand objCommand = new SqlCommand();
                objCommand.Connection = con;
                objCommand.CommandType = System.Data.CommandType.StoredProcedure;
                objCommand.CommandText = "dbo.FindUserByID"; //?? todo here
                objCommand.Parameters.AddWithValue("@ID", ID);
                SqlDataReader reader = objCommand.ExecuteReader();
                DataTable dt = new DataTable();
                dt.Load(reader);
                fnConClose();
                return dt;
            }
            catch (Exception)
            {
                throw;
            }

        }


        public int InsertVisit(clsContactReport contactReport)
        {
            try
            {
                SqlCommand objCommand = new SqlCommand();
                objCommand.Connection = con;
                objCommand.CommandType = CommandType.StoredProcedure;
                objCommand.CommandText = "dbo.spInsertVisit";
                objCommand.Parameters.AddWithValue("@UnitsSold_Today", contactReport.UnitsSold_Today);
                objCommand.Parameters.AddWithValue("@UnitsSoldGP_Today", contactReport.UnitsSoldGP_Today.ToString());
                objCommand.Parameters.AddWithValue("@UnitsDelivered_MTD", contactReport.UnitsDelivered_MTD);
                objCommand.Parameters.AddWithValue("@UnitsSoldTotalGP_MTD", contactReport.UnitsSoldTotalGP_MTD.ToString());
                objCommand.Parameters.AddWithValue("@ReadyForSaleStatus", contactReport.ReadyForSaleStatus);
                objCommand.Parameters.AddWithValue("@ModelMix", contactReport.ModelMix);
                objCommand.Parameters.AddWithValue("@PricingVsAge", contactReport.PricingVsAge);
                objCommand.Parameters.AddWithValue("@boCloses_Today", contactReport.boCloses_Today);
                objCommand.Parameters.AddWithValue("@boGrossProfit_Today", contactReport.boGrossProfit_Today.ToString());
                objCommand.Parameters.AddWithValue("@boCloses_MTD", contactReport.boCloses_MTD);
                objCommand.Parameters.AddWithValue("@boGrossProfit_MTD", contactReport.boGrossProfit_MTD.ToString());
                objCommand.Parameters.AddWithValue("@partsSales_MTD", contactReport.partsSales_MTD.ToString());
                objCommand.Parameters.AddWithValue("@ServiceSales_MTD", contactReport.ServiceSales_MTD.ToString());
                objCommand.Parameters.AddWithValue("@VisitDate", contactReport.VisitDate);
                objCommand.Parameters.AddWithValue("@ArrivalTime", contactReport.ArrivalTime);
                objCommand.Parameters.AddWithValue("@DepartureTime", contactReport.DepartureTime);
                objCommand.Parameters.AddWithValue("@Displays", contactReport.Displays);
                objCommand.Parameters.AddWithValue("@Cleanliness_Organization", contactReport.Cleanliness_Organization);
                objCommand.Parameters.AddWithValue("@StaffingReview", contactReport.StaffingReview);
                objCommand.Parameters.AddWithValue("@OverallConditions", contactReport.OverallConditions);
                objCommand.Parameters.AddWithValue("@Improve", contactReport.Improve);
                objCommand.Parameters.AddWithValue("@WebsiteSales", contactReport.WebsiteSales);
                objCommand.Parameters.AddWithValue("@WebsiteBusOff", contactReport.WebsiteBusOff);
                objCommand.Parameters.AddWithValue("@WebsiteService", contactReport.WebsiteService);
                objCommand.Parameters.AddWithValue("@WebsiteParts", contactReport.WebsiteParts);
                objCommand.Parameters.AddWithValue("@store", contactReport.Store);
                objCommand.Parameters.AddWithValue("@Manager", contactReport.GeneralManager);
                SqlParameter output = new SqlParameter("@Visitid", System.Data.SqlDbType.Int);
                output.Direction = System.Data.ParameterDirection.Output;
                objCommand.Parameters.Add(output);
                fnConOpen();
                objCommand.ExecuteScalar();
                int VisitId = Convert.ToInt32(output.Value.ToString());
                fnConClose();
                return VisitId;
            }
            catch (Exception)
            {
                throw;
            }
        }

        public int UpdateVisit(clsContactReport contactReport)
        {
            try
            {
                int result = 0;
                SqlCommand objCommand = new SqlCommand();
                objCommand.Connection = con;
                objCommand.CommandType = CommandType.StoredProcedure;
                objCommand.CommandText = "dbo.spUpdateVisit";
                objCommand.Parameters.AddWithValue("@id", contactReport.VisitId);
                objCommand.Parameters.AddWithValue("@UnitsSold_Today", contactReport.UnitsSold_Today);
                objCommand.Parameters.AddWithValue("@UnitsSoldGP_Today", contactReport.UnitsSoldGP_Today.ToString());
                objCommand.Parameters.AddWithValue("@UnitsDelivered_MTD", contactReport.UnitsDelivered_MTD);
                objCommand.Parameters.AddWithValue("@UnitsSoldTotalGP_MTD", contactReport.UnitsSoldTotalGP_MTD.ToString());
                objCommand.Parameters.AddWithValue("@ReadyForSaleStatus", contactReport.ReadyForSaleStatus);
                objCommand.Parameters.AddWithValue("@ModelMix", contactReport.ModelMix);
                objCommand.Parameters.AddWithValue("@PricingVsAge", contactReport.PricingVsAge);
                objCommand.Parameters.AddWithValue("@boCloses_Today", contactReport.boCloses_Today);
                objCommand.Parameters.AddWithValue("@boGrossProfit_Today", contactReport.boGrossProfit_Today.ToString());
                objCommand.Parameters.AddWithValue("@boCloses_MTD", contactReport.boCloses_MTD);
                objCommand.Parameters.AddWithValue("@boGrossProfit_MTD", contactReport.boGrossProfit_MTD.ToString());
                objCommand.Parameters.AddWithValue("@partsSales_MTD", contactReport.partsSales_MTD.ToString());
                objCommand.Parameters.AddWithValue("@ServiceSales_MTD", contactReport.ServiceSales_MTD.ToString());
                objCommand.Parameters.AddWithValue("@DepartureTime", contactReport.DepartureTime);
                objCommand.Parameters.AddWithValue("@Displays", contactReport.Displays);
                objCommand.Parameters.AddWithValue("@Cleanliness_Organization", contactReport.Cleanliness_Organization);
                objCommand.Parameters.AddWithValue("@StaffingReview", contactReport.StaffingReview);
                objCommand.Parameters.AddWithValue("@OverallConditions", contactReport.StaffingReview);
                objCommand.Parameters.AddWithValue("@Improve", contactReport.Improve);
                objCommand.Parameters.AddWithValue("@WebsiteSales", contactReport.WebsiteSales);
                objCommand.Parameters.AddWithValue("@WebsiteBusOff", contactReport.WebsiteBusOff);
                objCommand.Parameters.AddWithValue("@WebsiteService", contactReport.WebsiteService);
                objCommand.Parameters.AddWithValue("@WebsiteParts", contactReport.WebsiteParts);


                fnConOpen();
                result = Convert.ToInt16(objCommand.ExecuteScalar());
                fnConClose();
                return result;
            }
            catch (Exception)
            {
                throw;
            }
        }

        public DataTable GetManagers()
        {
            try
            {
                fnConOpen();
                SqlCommand objCommand = new SqlCommand();
                objCommand.Connection = con;
                objCommand.CommandType = System.Data.CommandType.StoredProcedure;
                objCommand.CommandText = "dbo.spSelectManagers";
                SqlDataReader reader = objCommand.ExecuteReader();
                DataTable dt = new DataTable();
                dt.Load(reader);
                fnConClose();
                return dt;
            }
            catch (Exception)
            {
                throw;
            }
        }

        public DataTable GetStores()
        {
            try
            {
                fnConOpen();
                SqlCommand objCommand = new SqlCommand();
                objCommand.Connection = con;
                objCommand.CommandType = System.Data.CommandType.StoredProcedure;
                objCommand.CommandText = "dbo.spSelectStores";
                SqlDataReader reader = objCommand.ExecuteReader();
                DataTable dt = new DataTable();
                dt.Load(reader);
                fnConClose();
                return dt;
            }
            catch (Exception)
            {
                throw;
            }
        }

        public DataTable GetCustomerIssues()
        {
            try
            {
                fnConOpen();
                SqlCommand objCommand = new SqlCommand();
                objCommand.Connection = con;
                objCommand.CommandType = System.Data.CommandType.StoredProcedure;
                if (sw.SecurityLevel == 500)
                    objCommand.CommandText = "dbo.spSelectCustomerIssues";
                else
                {
                    objCommand.CommandText = "dbo.spSelectCustomerIssuesByVisitId";
                    objCommand.Parameters.AddWithValue("@VisitID", sw.VisitID);
                }
                SqlDataReader reader = objCommand.ExecuteReader();
                DataTable dt = new DataTable();
                dt.Load(reader);
                fnConClose();
                return dt;
            }
            catch (Exception)
            {
                throw;
            }
        }

        public DataTable GetEmployeesTrained()
        {
            try
            {
                fnConOpen();
                SqlCommand objCommand = new SqlCommand();
                objCommand.Connection = con;
                objCommand.CommandType = System.Data.CommandType.StoredProcedure;
                if (sw.SecurityLevel == 500)
                    objCommand.CommandText = "dbo.spSelectEmployeesTrained";
                else
                {
                    objCommand.CommandText = "dbo.spSelectEmployeesTrainedByStoreManager";
                    objCommand.Parameters.AddWithValue("@StoreID", sw.StoreID);
                    objCommand.Parameters.AddWithValue("@ManagerID", sw.ManagerID);
                }
                SqlDataReader reader = objCommand.ExecuteReader();
                DataTable dt = new DataTable();
                dt.Load(reader);
                fnConClose();
                return dt;
            }
            catch (Exception)
            {
                throw;
            }
        }

        public DataTable GetLeadsContacted()
        {
            try
            {
                fnConOpen();
                SqlCommand objCommand = new SqlCommand();
                objCommand.Connection = con;
                objCommand.CommandType = System.Data.CommandType.StoredProcedure;
                if (sw.SecurityLevel == 500)
                    objCommand.CommandText = "dbo.spSelectLeadsContacted";
                else
                {
                    objCommand.CommandText = "dbo.spSelectLeadsContactedByStoreManager";
                    objCommand.Parameters.AddWithValue("@StoreID", sw.StoreID);
                    objCommand.Parameters.AddWithValue("@ManagerID", sw.ManagerID);
                }
                SqlDataReader reader = objCommand.ExecuteReader();
                DataTable dt = new DataTable();
                dt.Load(reader);
                fnConClose();
                return dt;
            }
            catch (Exception)
            {
                throw;
            }
        }

        public int UpdateGoals(int id, decimal Goal, int Department, int Store, decimal Closes, string Month)
        {
            SqlCommand objCommand = new SqlCommand();
            objCommand.Connection = con;
            objCommand.CommandType = CommandType.StoredProcedure;
            objCommand.CommandText = "dbo.spUpdateGoals";
            objCommand.Parameters.AddWithValue("@Goal", Goal);
            objCommand.Parameters.AddWithValue("@Department", Department);
            objCommand.Parameters.AddWithValue("@Store", Store);
            objCommand.Parameters.AddWithValue("@Closes", Closes);
            objCommand.Parameters.AddWithValue("@Month", Month);
            objCommand.Parameters.AddWithValue("@id=", id);
            fnConOpen();
            fnConOpen();
            int result = Convert.ToInt16(objCommand.ExecuteScalar());
            fnConClose();
            return result;
        }

        public int DeleteGoals(int id)
        {
            SqlCommand objCommand = new SqlCommand();
            objCommand.Connection = con;
            objCommand.CommandType = CommandType.StoredProcedure;
            objCommand.CommandText = "dbo.spDeleteGoals";
            objCommand.Parameters.AddWithValue("@id", id);
            fnConOpen();
            int result = Convert.ToInt16(objCommand.ExecuteScalar());
            fnConClose();
            return result;
        }

        public int InsertGoal(decimal Goal, int Department, int Store, decimal Closes, string Month)
        {
            SqlCommand objCommand = new SqlCommand();
            objCommand.Connection = con;
            objCommand.CommandType = CommandType.StoredProcedure;
            objCommand.CommandText = "dbo.spInsertGoals";
            objCommand.Parameters.AddWithValue("@Goal", Goal);
            objCommand.Parameters.AddWithValue("@Department", Department);
            objCommand.Parameters.AddWithValue("@Store", Store);
            objCommand.Parameters.AddWithValue("@Closes", Closes);
            objCommand.Parameters.AddWithValue("@Month", Month);
            fnConOpen();
            int result = Convert.ToInt16(objCommand.ExecuteScalar());
            fnConClose();
            return result;

        }

        public DataTable GetGoals()
        {
            SqlCommand objCommand = new SqlCommand();
            objCommand.Connection = con;
            objCommand.CommandType = CommandType.StoredProcedure;
            objCommand.CommandText = "dbo.spSelectGoals";
            fnConOpen();
            SqlDataReader reader = objCommand.ExecuteReader();
            DataTable dt = new DataTable();
            dt.Load(reader);
            fnConClose();
            return dt;
        }

        public DataTable GetDepartments()
        {
            string sql = "exec spSelectDepartments";
            fnConOpen();
            SqlDataAdapter da = new SqlDataAdapter(sql, con);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
        }

        public int InsertCustomerIssues(int VisitsId, string customerName, string issue, string resolution)
        {
            SqlCommand objCommand = new SqlCommand();
            objCommand.Connection = con;
            objCommand.CommandType = CommandType.StoredProcedure;
            objCommand.CommandText = "dbo.spInsertCustomerIssues";
            objCommand.Parameters.AddWithValue("@VisitsId", VisitsId);
            objCommand.Parameters.AddWithValue("@CustomerName", customerName);
            objCommand.Parameters.AddWithValue("@Issue", issue);
            objCommand.Parameters.AddWithValue("@Resolution", resolution);
            fnConOpen();
            int result = Convert.ToInt16(objCommand.ExecuteScalar());
            fnConClose();
            return result;
        }

        public int UpdateCustomerIssues(int id, int VisitsId, string customerName, string issue, string resolution)
        {
            SqlCommand objCommand = new SqlCommand();
            objCommand.Connection = con;
            objCommand.CommandType = CommandType.StoredProcedure;
            objCommand.CommandText = "dbo.spUpdateCustomerIssues";
            objCommand.Parameters.AddWithValue("@id", id);
            objCommand.Parameters.AddWithValue("@VisitsId", VisitsId);
            objCommand.Parameters.AddWithValue("@CustomerName", customerName);
            objCommand.Parameters.AddWithValue("@Issue", issue);
            objCommand.Parameters.AddWithValue("@Resolution", resolution);
            fnConOpen();
            int result = Convert.ToInt16(objCommand.ExecuteScalar());
            fnConClose();
            return result;
        }

        public int DeleteCustomerIssues(int id)
        {
            SqlCommand objCommand = new SqlCommand();
            objCommand.Connection = con;
            objCommand.CommandType = CommandType.StoredProcedure;
            objCommand.CommandText = "dbo.spDeleteCustomerIssues";
            objCommand.Parameters.AddWithValue("@id", id);
            fnConOpen();
            int result = Convert.ToInt16(objCommand.ExecuteScalar());
            fnConClose();
            return result;
        }

        public int InsertLeadsContacted(int VisitsId, string customerName, string customerEmail, string result)
        {
            SqlCommand objCommand = new SqlCommand();
            objCommand.Connection = con;
            objCommand.CommandType = CommandType.StoredProcedure;
            objCommand.CommandText = "dbo.spInsertLeadsContacted";
            objCommand.Parameters.AddWithValue("@VisitsId", VisitsId);
            objCommand.Parameters.AddWithValue("@CustomerName", customerName);
            objCommand.Parameters.AddWithValue("@CustomerEmail", customerEmail);
            objCommand.Parameters.AddWithValue("@Result", result);
            fnConOpen();
            int leadID = Convert.ToInt16(objCommand.ExecuteScalar());
            fnConClose();
            return leadID;
        }

        public int UpdateLeadsContacted(int id, int VisitsId, string customerName, string customerEmail, string result)
        {
            SqlCommand objCommand = new SqlCommand();
            objCommand.Connection = con;
            objCommand.CommandType = CommandType.StoredProcedure;
            objCommand.CommandText = "dbo.spUpdateLeadsContacted";
            objCommand.Parameters.AddWithValue("@id", id);
            objCommand.Parameters.AddWithValue("@VisitsId", VisitsId);
            objCommand.Parameters.AddWithValue("@CustomerName", customerName);
            objCommand.Parameters.AddWithValue("@CustomerEmail", customerEmail);
            objCommand.Parameters.AddWithValue("@Result", result);
            fnConOpen();
            int outcome = Convert.ToInt16(objCommand.ExecuteScalar());
            fnConClose();
            return outcome;
        }

        public int DeleteLeadsContacted(int id)
        {
            SqlCommand objCommand = new SqlCommand();
            objCommand.Connection = con;
            objCommand.CommandType = CommandType.StoredProcedure;
            objCommand.CommandText = "dbo.spDeleteLeadsContacted";
            objCommand.Parameters.AddWithValue("@id", id);
            fnConOpen();
            int result = Convert.ToInt16(objCommand.ExecuteScalar());
            fnConClose();
            return result;
        }

        public int InsertEmployeesTrained(int VisitsId, string employeeName, string topicsCovered, string resolution)
        {
            SqlCommand objCommand = new SqlCommand();
            objCommand.Connection = con;
            objCommand.CommandText = "exec spInsertEmployeesTrained " + VisitsId + ", '" + employeeName + "','" + topicsCovered + "','" + resolution + "'";
            //objCommand.CommandType = CommandType.StoredProcedure;
            //objCommand.CommandText = "dbo.spInsertEmployeesTrained";
            //objCommand.Parameters.AddWithValue("@VisitsId", VisitsId);
            //objCommand.Parameters.AddWithValue("@EmployeeName", employeeName);
            //objCommand.Parameters.AddWithValue("@TopicsCovered", topicsCovered);
            //objCommand.Parameters.AddWithValue("@Resolution", resolution);
            fnConOpen();
            int result = Convert.ToInt16(objCommand.ExecuteScalar());
            fnConClose();
            return result;
        }

        public int DeleteEmployeesTrained(int id)
        {
            SqlCommand objCommand = new SqlCommand();
            objCommand.Connection = con;
            objCommand.CommandType = CommandType.StoredProcedure;
            objCommand.CommandText = "dbo.spDeleteEmployeesTrained";
            objCommand.Parameters.AddWithValue("@id", id);
            fnConOpen();
            int result = Convert.ToInt16(objCommand.ExecuteScalar());
            fnConClose();
            return result;
        }

        public int UpdateEmployeesTrained(int id, int VisitsId, string employeeName, string topicsCovered, string resolution)
        {
            SqlCommand objCommand = new SqlCommand();
            objCommand.Connection = con;
            objCommand.CommandType = CommandType.StoredProcedure;
            objCommand.CommandText = "dbo.spUpdateEmployeesTrained";
            objCommand.Parameters.AddWithValue("@id", id);
            objCommand.Parameters.AddWithValue("@VisitsId", VisitsId);
            objCommand.Parameters.AddWithValue("@EmployeeName", employeeName);
            objCommand.Parameters.AddWithValue("@TopicsCovered", topicsCovered);
            objCommand.Parameters.AddWithValue("@Resolution", resolution);
            fnConOpen();
            int result = Convert.ToInt16(objCommand.ExecuteScalar());
            fnConClose();
            return result;

        }

        public DataTable Fetch(string department)
        {
            string cnstr = ConfigurationManager.ConnectionStrings["RovingGMConnectionString"].ConnectionString;
            string sql = string.Empty;

            switch (department)
            {
                case ("Business"):
                    sql = "exec spBusOfficeVisits";
                    break;
                case ("Issues"):
                    sql = "exec spSelectIssuesVisits";
                    break;
                case ("Parts"):
                    sql = "exec spSelectPartsVisits";
                    break;
                case ("Sales"):
                    sql = "exec spSelectSalesVisits";
                    break;
                case ("Service"):
                    sql = "exec spSelectServiceVisits";
                    break;
                default:
                    sql = "exec spVisits";
                    break;
            }
            SqlDataAdapter da = new SqlDataAdapter(sql, cnstr);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
        }

        public DataTable GetVisit(int visitId)
        {
            try
            {
                fnConOpen();
                SqlCommand objCommand = new SqlCommand();
                objCommand.Connection = con;
                objCommand.CommandType = System.Data.CommandType.StoredProcedure;
                objCommand.CommandText = "dbo.spSelectSingleVisit";
                objCommand.Parameters.AddWithValue("@id", visitId);
                SqlDataReader reader = objCommand.ExecuteReader();
                DataTable dt = new DataTable();
                dt.Load(reader);
                fnConClose();
                return dt;
            }
            catch (Exception)
            {
                throw;
            }

        }

        public DataTable GetAllVisits()
        {
            try
            {
                fnConOpen();
                SqlCommand objCommand = new SqlCommand();
                objCommand.Connection = con;
                objCommand.CommandType = System.Data.CommandType.StoredProcedure;
                objCommand.CommandText = "dbo.spSelectVisits";
                SqlDataReader reader = objCommand.ExecuteReader();
                DataTable dt = new DataTable();
                dt.Load(reader);
                fnConClose();
                return dt;
            }
            catch (Exception)
            {
                throw;
            }

        }

        public DataTable GetVisitsByStoreManager(int storeId, int managerId)
        {
            try
            {
                fnConOpen();
                SqlCommand objCommand = new SqlCommand();
                objCommand.Connection = con;
                objCommand.CommandType = System.Data.CommandType.StoredProcedure;
                objCommand.CommandText = "dbo.spSelectVisitsByStoreManager";
                objCommand.Parameters.AddWithValue("@storeid", storeId);
                objCommand.Parameters.AddWithValue("@managerid", managerId);
                SqlDataReader reader = objCommand.ExecuteReader();
                DataTable dt = new DataTable();
                dt.Load(reader);
                fnConClose();
                return dt;
            }
            catch (Exception)
            {
                throw;
            }

        }

        public DataTable GetVisitDates()
        {
            try
            {
                fnConOpen();
                SqlCommand objCommand = new SqlCommand();
                objCommand.Connection = con;
                objCommand.CommandType = System.Data.CommandType.StoredProcedure;
                objCommand.CommandText = "dbo.spSelectVisitDates";
                SqlDataReader reader = objCommand.ExecuteReader();
                DataTable dt = new DataTable();
                dt.Load(reader);
                fnConClose();
                return dt;
            }
            catch (Exception)
            {
                throw;
            }
        }


        public DataTable GetEditableContactReport(int storeId, int managerId, DateTime visitDate)
        {
            try
            {
                fnConOpen();
                SqlCommand objCommand = new SqlCommand();
                objCommand.Connection = con;
                objCommand.CommandType = System.Data.CommandType.StoredProcedure;
                objCommand.CommandText = "dbo.spSelectVisitByStoreManagerDate";
                objCommand.Parameters.AddWithValue("@storeid", storeId);
                objCommand.Parameters.AddWithValue("@managerid", managerId);
                objCommand.Parameters.AddWithValue("@visitdate", visitDate);
                SqlDataReader reader = objCommand.ExecuteReader();
                DataTable dt = new DataTable();
                dt.Load(reader);
                fnConClose();
                return dt;
            }
            catch (Exception)
            {
                throw;
            }
        }

    }

}
