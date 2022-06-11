using Dapper;
using MandiriLife.Models;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace MandiriLife.Repos
{
    public class UserRepository
    {
        static string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ToString();
        static SqlConnection connection = new SqlConnection(connectionString);
        static SqlCommand command;
        static SqlDataReader reader;
        

        public static UserProfile Login(User user)
        {

            UserProfile dataUser =  new UserProfile();
            command = new SqlCommand("SELECT TOP 1 up.* FROM [User] u join UserProfile up on up.username = u.username WHERE u.username = @username AND u.password = @password", connection);
            command.CommandType = System.Data.CommandType.Text;
            command.Parameters.Clear();
            command.Parameters.Add(new SqlParameter("@username", user.username));
            command.Parameters.Add(new SqlParameter("@password", user.password));

            try
            {
                if(connection.State != System.Data.ConnectionState.Open)
                connection.Open();
                reader = command.ExecuteReader();
                while (reader.Read())
                {
                    dataUser = new UserProfile(user = new User(reader["username"].ToString(), ""),reader["name"].ToString(), reader["address"].ToString(), reader["bod"].ToString(), reader["email"].ToString());
                }

                return dataUser;
            }
            catch (ArgumentOutOfRangeException ex)
            {
                Console.WriteLine($"Error: {ex.Message}");
                return dataUser;
            }
            finally
            {
                connection.Close();
            }
        }
    }
}