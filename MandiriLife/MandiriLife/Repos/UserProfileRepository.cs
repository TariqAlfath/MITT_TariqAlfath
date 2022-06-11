using MandiriLife.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace MandiriLife.Repos
{
    public class UserProfileRepository
    {
        static string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ToString();
        static SqlConnection connection = new SqlConnection(connectionString);
        static SqlCommand command;
        static SqlDataReader reader;

        static List<UserProfile> dataUser;

        public static bool UsernameExist(string username)
        {
            command = new SqlCommand("SELECT COUNT(*) FROM [USER] WHERE username = @username", connection);
            command.CommandType = CommandType.Text;
            command.Parameters.Clear();
            command.Parameters.Add(new SqlParameter("@username", username));

            try
            {
                connection.Open();
                int ret = (int)command.ExecuteScalar();
                if (ret == 0)
                {
                    return true;
                }
                else
                {
                    return false ;
                }
            }
            catch (ArgumentOutOfRangeException ex)
            {
                Console.WriteLine($"Error: {ex.Message}");
                return false;
            }
            finally
            {
                connection.Close();
            }
        }
        public static bool Register(UserProfile user)
        {
            if (!UsernameExist(user.username.username))
                return false;


            command = new SqlCommand("Register", connection);
            command.CommandType = CommandType.StoredProcedure;
            command.Parameters.Clear();
            command.Parameters.Add(new SqlParameter("@username", user.username.username));
            command.Parameters.Add(new SqlParameter("@name", user.name));
            command.Parameters.Add(new SqlParameter("@address", user.address));
            command.Parameters.Add(new SqlParameter("@bod", user.bod));
            command.Parameters.Add(new SqlParameter("@email", user.email));

            try
            {
                connection.Open();
                int ret = (int)command.ExecuteNonQuery();
                if (ret == 0)
                {
                    return false;
                }
                else
                {
                    return true;
                }
            }
            catch (ArgumentOutOfRangeException ex)
            {
                Console.WriteLine($"Error: {ex.Message}");
                return false;
            }
            finally
            {
                connection.Close();
            }

        }
        public static bool Update(UserProfile user)
        {
            command = new SqlCommand("UPDATE", connection);
            command.CommandType = CommandType.StoredProcedure;
            command.Parameters.Clear();
            command.Parameters.Add(new SqlParameter("@username", user.username.username));
            command.Parameters.Add(new SqlParameter("@name", user.name));
            command.Parameters.Add(new SqlParameter("@address", user.address));
            command.Parameters.Add(new SqlParameter("@bod", user.bod));
            command.Parameters.Add(new SqlParameter("@email", user.email));

            try
            {
                connection.Open();
                int ret = (int)command.ExecuteNonQuery();
                if (ret == 0)
                {
                    return false;
                }
                else
                {
                    return true;
                }
            }
            catch (ArgumentOutOfRangeException ex)
            {
                Console.WriteLine($"Error: {ex.Message}");
                return false;
            }
            finally
            {
                connection.Close();
            }

        }
    }
}