using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MandiriLife.Models
{
    public class Skill
    {
        public int skillID { get; set; }
        public string skillName{ get; set; }

        public Skill()
        {
        }

        public Skill(int skillID, string skillName)
        {
            this.skillID = skillID;
            this.skillName = skillName;
        }
    }
}