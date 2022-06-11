using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MandiriLife.Models
{
    public class SkillLevel
    {
        public int skillLevelID { get; set; }
        public string skillLevelName { get; set; }

        public SkillLevel()
        {
        }

        public SkillLevel(int skillLevelID, string skillLevelName)
        {
            this.skillLevelID = skillLevelID;
            this.skillLevelName = skillLevelName;
        }
    }
}