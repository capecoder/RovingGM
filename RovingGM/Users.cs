using System;
using System.Collections;
using System.Data;
using RovingGM.DataAccess;

namespace RovingGM
{
	/// <summary>
	/// Summary description for User.
	/// </summary>
	public class Users : IEnumerable
	{
		//IEnumerable - exposes enumeration qualities - 
		// loop through business objects implements foreach movenext

		// holds the raw events data - this drives the class
		// takes each row in ds and makes it a business object
		protected dsUser m_dataset=null;


		// holds a clone of the attribute data
		// used when datarows are converted to biz objects
		// use this instead of original dataset
		protected dsUser m_datasetClone=null;

		// holds a reference to the AttributeList datatable in m_dataset
		// ...this saves from continually having to re-retrieve
		// this datatable from m_dataset.
		// easy way to call
		//private dsUser.UsersDataTable m_datatable=null;
		
		// As attributes are requested via indexer or 
		// through IEnumerable, this class will instantiate/populate
		// an Attribute business object using the raw data in
		// m_dataset.  These classes will be stored in the cache.
		private Hashtable m_cache=null;
		// a hashtable is a dictionary - a collection that associates a key(word) to a value (definition)
		// hashtables are dictionaries that are optimized for fast retrieval

		public Users()
		{

		}


        //public dsUser GetDataSetCopy()  //check ?? needed??
        //{
        //    if (m_dataset==null)
        //    {
        //        return null;
        //    }
        //    else
        //    {
        //        return (dsUser)m_dataset.Copy();
        //    }
        //}

		public void LoadAll()
		{
			daUser da=new daUser();
			m_dataset=da.GetAllUsers();		
			RefreshMemberVariables();

		}

		public void SelectUsers(string Email)
		{
			daUser da=new daUser();
			m_dataset=da.UserByEmail(Email);		
			RefreshMemberVariables();
		}

		
		public int RecordCount 
		{
			get 
			{
				if (m_dataset != null) 
				{
					// ?? return m_dataset.Users.Rows.Count;
                    return 0;
				} 
				else 
				{
					return -1;
				}
			}
		}


		private void RefreshMemberVariables()
		{
			m_cache=new Hashtable();
			//same biz object, different dataset

			// when attributes are loaded from the 
			// data access layer, this method should be called
			// to initialize the member variables in this object.

			// clone a copy of the dataset for use when populating 
			// control messages
			//m_datasetClone=(dsUser)m_dataset.Copy();
			
			// create a new ArrayList for the message cache
			m_cache=new Hashtable();

			//if (m_dataset==null)
			//{
			//	// no attributes
			//	m_datatable=null;
			//}
			//else
			//{
			//	// grab a reference to the attribute list table
   //             //m_datatable=
   //             //    m_dataset.Users; ??
			//}
		}


		public User this[int p_UserNo]
		{
			get
			{
				string id=p_UserNo.ToString(); //dsUser makes this possible

				if (m_cache.ContainsKey(id)==true)
				{
					// return from the cache
					return (User)m_cache[id];
				}
				else
				{
					// populate an attribute and
					// return it...note: this may return null
					return PopulateByUserNo(p_UserNo);
				}
			}
		}
		

		public IEnumerator GetEnumerator()
		{
			return new UserEnumerator(this, m_dataset);
		}


		private User PopulateByUserNo(int p_UserNo)
		{
            User u = new User();
            return u; //??

            //dsUser.UsersDataTable tempListTable=
            //    m_datasetClone.Users;

            //dsUser.UsersRow tempListRow=
            //    tempListTable.FindByUserID(p_UserNo);

            //if (tempListRow == null)
            //{
            //    // no records
            //    return null;
            //}
            //else
            //{
            //    dsUser tempDS=new dsUser();
			
            //    //dsUser.UsersDataTable tempValueTable=
            //    //    m_datasetClone.Users;

            //    //dsUser.UsersRow tempValueRow=
            //    //    tempValueTable.FindByUserID(p_UserNo);

            //    //if (tempValueRow != null)
            //    //{
            //    //    // if there is a value, set it into the dataset
            //    //    tempDS.Users.ImportRow(tempValueRow);  
            //    //} ??

				
            //    User tempUser=new User(tempDS);	

            //    m_cache.Add(p_UserNo.ToString(), tempUser);
				
            //    return tempUser;
			}

		}


		public class UserEnumerator : IEnumerator
		{
			// current movenext reset

			private Users m_Users=null;
			private IEnumerator m_rowEnumerator=null;

			public UserEnumerator(
				Users p_Users, 
				dsUser p_dsUser)
			{
				if (p_Users==null || p_dsUser==null)
				{
					
					throw new ArgumentNullException(
						"Users or dsUser", 
						"Cannot initialize UserEnumerator.  Arguments cannot be null.");
				}
				else
				{
					m_Users=p_Users;
					
                    //m_rowEnumerator=
                    //    p_dsUser.Users.Rows.GetEnumerator();  ??
				}
			}

			public object Current
			{
				get
				{
					if (m_Users==null)
					{
						throw new InvalidOperationException(
							"AttributeEnumerator not initialized.");
					}
					else
					{
						// get the current data row for the row enumerator
						dsUser.UsersRow row=
							(dsUser.UsersRow)m_rowEnumerator.Current;
						
						// get the user id for the current row and use
						// it to retrieve it from the Users class
						// then return the value...this value may be null
						return m_Users[row.UserID];		
					}
				}
			}

			public bool MoveNext()
			{
				if (m_rowEnumerator==null)
				{
					return false;
				}
				else
				{
					return m_rowEnumerator.MoveNext();
				}
			}

			public void Reset()
			{
				throw new NotImplementedException("Reset is not implemented.");
			}
		}


	}


