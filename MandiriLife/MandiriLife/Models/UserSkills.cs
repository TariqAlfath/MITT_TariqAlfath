using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MandiriLife.Models
{
    public class UserSkills
    {
        public int userSkillID{ get; set; }
        public User username{ get; set; }
        public Skill skillID{ get; set; }
        public SkillLevel skillLevelID { get; set; }

        public UserSkills()
        {
        }

        public UserSkills(int userSkillID, User username, Skill skillID, SkillLevel skillLevelID)
        {
            this.userSkillID = userSkillID;
            this.username = username;
            this.skillID = skillID;
            this.skillLevelID = skillLevelID;
        }
    }
}