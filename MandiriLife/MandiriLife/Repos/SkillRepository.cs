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
    public class SkillRepository
    {
        static string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ToString();
        static SqlConnection connection = new SqlConnection(connectionString);
        static SqlCommand command;
        static SqlDataReader reader;

        static List<Skill> dataSkill;

        public static List<Skill> GetSkills()
        {
            dataSkill = new List<Skill>();

            try
            {
                if (connection.State != System.Data.ConnectionState.Open)
                    connection.Open();
                DynamicParameters parameters = new DynamicParameters();

                dataSkill = SqlMapper.Query<Skill>(connection, "GetSkills", parameters, commandType: CommandType.StoredProcedure).ToList();

                return dataSkill;

                
            }
            catch (ArgumentOutOfRangeException ex)
            {
                Console.WriteLine($"Error: {ex.Message}");
                return dataSkill;
            }
            finally
            {
                connection.Close();
            }
        }
        public static Skill GetSkillsByID(int skillID)
        {
            Skill skill = new Skill();

            try
            {
                if (connection.State != System.Data.ConnectionState.Open)
                    connection.Open();
                DynamicParameters parameters = new DynamicParameters();
                parameters.Add("skillID", skillID);

                skill = SqlMapper.Query<Skill>(connection, "GetSkillsByID", parameters, commandType: CommandType.StoredProcedure).FirstOrDefault();

                return skill;

                
            }
            catch (ArgumentOutOfRangeException ex)
            {
                Console.WriteLine($"Error: {ex.Message}");
                return skill;
            }
            finally
            {
                connection.Close();
            }
        }
        public static bool CreateSkill(Skill skill)
        {
            command = new SqlCommand("CreateSkill", connection);
            command.CommandType = CommandType.StoredProcedure;
            command.Parameters.Clear();
            command.Parameters.Add(new SqlParameter("@skillName", skill.skillName));

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
        public static bool UpdateSkill(Skill skill)
        {
            command = new SqlCommand("UpdateSkill", connection);
            command.CommandType = CommandType.StoredProcedure;
            command.Parameters.Clear();
            command.Parameters.Add(new SqlParameter("@skillID", skill.skillID));
            command.Parameters.Add(new SqlParameter("@skillName", skill.skillName));

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
        public static bool DeleteSkill(int skillID)
        {
            command = new SqlCommand("DeleteSkill", connection);
            command.CommandType = CommandType.StoredProcedure;
            command.Parameters.Clear();
            command.Parameters.Add(new SqlParameter("@skillID", skillID));

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