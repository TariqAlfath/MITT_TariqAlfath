using MandiriLife.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace MandiriLife.Repos
{
    public class UserSkillsRepository
    {
        static string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ToString();
        static SqlConnection connection = new SqlConnection(connectionString);
        static SqlCommand command;
        static SqlDataReader reader;

        static List<UserSkills> userSkills;

        public static bool CreateUserSkills(UserSkills user)
        {
            command = new SqlCommand("CreateUserSkills", connection);
            command.CommandType = CommandType.StoredProcedure;
            command.Parameters.Clear();
            command.Parameters.Add(new SqlParameter("@username", user.username.username));
            command.Parameters.Add(new SqlParameter("@skillID", user.skillID.skillID));
            command.Parameters.Add(new SqlParameter("@skillLevelID", user.skillLevelID.skillLevelID));

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
        public static bool UpdateUserSkills(UserSkills user)
        {
            command = new SqlCommand("UpdateUserSkills", connection);
            command.CommandType = CommandType.StoredProcedure;
            command.Parameters.Clear();
            command.Parameters.Add(new SqlParameter("@userSkillID", user.userSkillID));
            command.Parameters.Add(new SqlParameter("@username", user.username.username));
            command.Parameters.Add(new SqlParameter("@skillID", user.skillID.skillID));
            command.Parameters.Add(new SqlParameter("@skillLevelID", user.skillLevelID.skillLevelID));

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
        public static bool DeleteUserSkills(int userSkillID)
        {
            command = new SqlCommand("DeleteUserSkills", connection);
            command.CommandType = CommandType.StoredProcedure;
            command.Parameters.Clear();
            command.Parameters.Add(new SqlParameter("@userSkillID", userSkillID));

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

        public static UserSkills GetUserkills(int userSkillID)
        {

            UserSkills dataUser = new UserSkills();
            command = new SqlCommand("select top 1 us.userSkillId,sk.*,sl.*,u.* from UserSkills us left join [User] u on u.username = us.username left join Skill sk on us.skillID = sk.skillID left join SkillLevel sl on us.skillLevelID = sl.skillLevelID where us.userSkillId = @userSkillId;", connection);
            command.CommandType = System.Data.CommandType.Text;
            command.Parameters.Clear();
            command.Parameters.Add(new SqlParameter("@userSkillId", userSkillID));

            try
            {
                if (connection.State != System.Data.ConnectionState.Open)
                    connection.Open();
                reader = command.ExecuteReader();
                while (reader.Read())
                {
                    dataUser = new UserSkills(int.Parse(reader["userSkillID"].ToString()),new User(reader["username"].ToString(), reader["password"].ToString()),new Skill(int.Parse(reader["skillID"].ToString()), reader["skillName"].ToString()),new SkillLevel(int.Parse(reader["skillLevelID"].ToString()), reader["skillLevelName"].ToString()));
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
        public static UserSkills GetAllUserkills()
        {

            UserSkills dataUser = new UserSkills();
            command = new SqlCommand("select us.userSkillId,sk.*,sl.*,u.* from UserSkills us left join [User] u on u.username = us.username left join Skill sk on us.skillID = sk.skillID left join SkillLevel sl on us.skillLevelID = sl.skillLevelID;", connection);
            command.CommandType = System.Data.CommandType.Text;
            command.Parameters.Clear();

            try
            {
                if (connection.State != System.Data.ConnectionState.Open)
                    connection.Open();
                reader = command.ExecuteReader();
                while (reader.Read())
                {
                    dataUser = new UserSkills(int.Parse(reader["userSkillID"].ToString()),new User(reader["username"].ToString(), reader["password"].ToString()),new Skill(int.Parse(reader["skillID"].ToString()), reader["skillName"].ToString()),new SkillLevel(int.Parse(reader["skillLevelID"].ToString()), reader["skillLevelName"].ToString()));
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