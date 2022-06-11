using Dapper;
using MandiriLife.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace MandiriLife.Repos
{
    public class SkillLevelRepository
    {
        static string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ToString();
        static SqlConnection connection = new SqlConnection(connectionString);
        static SqlCommand command;
        static SqlDataReader reader;

        static List<SkillLevel> dataSkillLevel;

        public static List<SkillLevel> GetSkillsLevel()
        {
            dataSkillLevel = new List<SkillLevel>();

            try
            {
                if (connection.State != System.Data.ConnectionState.Open)
                    connection.Open();
                DynamicParameters parameters = new DynamicParameters();

                dataSkillLevel = SqlMapper.Query<SkillLevel>(connection, "GetSkillsLevel", parameters, commandType: CommandType.StoredProcedure).ToList();

                return dataSkillLevel;


            }
            catch (ArgumentOutOfRangeException ex)
            {
                Console.WriteLine($"Error: {ex.Message}");
                return dataSkillLevel;
            }
            finally
            {
                connection.Close();
            }
        }
        public static SkillLevel GetSkillsLevelByID(int skillLevelID)
        {
            SkillLevel skillLevel = new SkillLevel();

            try
            {
                if (connection.State != System.Data.ConnectionState.Open)
                    connection.Open();
                DynamicParameters parameters = new DynamicParameters();
                parameters.Add("skillLevelID", skillLevelID);

                skillLevel = SqlMapper.Query<SkillLevel>(connection, "GetSkillsLevelByID", parameters, commandType: CommandType.StoredProcedure).FirstOrDefault();

                return skillLevel;


            }
            catch (ArgumentOutOfRangeException ex)
            {
                Console.WriteLine($"Error: {ex.Message}");
                return skillLevel;
            }
            finally
            {
                connection.Close();
            }
        }
        public static bool CreateSkillLevel(SkillLevel skill)
        {
            command = new SqlCommand("CreateSkillLevel", connection);
            command.CommandType = CommandType.StoredProcedure;
            command.Parameters.Clear();
            command.Parameters.Add(new SqlParameter("@skillLevelName", skill.skillLevelName));

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
        public static bool UpdateSkillLevel(SkillLevel skill)
        {
            command = new SqlCommand("UpdateSkillLevel", connection);
            command.CommandType = CommandType.StoredProcedure;
            command.Parameters.Clear();
            command.Parameters.Add(new SqlParameter("@skillLevelID", skill.skillLevelID));
            command.Parameters.Add(new SqlParameter("@skillLevelName", skill.skillLevelName));

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
        public static bool DeleteSkillLevel(int skillLevelID)
        {
            command = new SqlCommand("DeleteSkillLevel", connection);
            command.CommandType = CommandType.StoredProcedure;
            command.Parameters.Clear();
            command.Parameters.Add(new SqlParameter("@skillLevelID", skillLevelID));

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