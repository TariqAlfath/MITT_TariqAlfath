using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MandiriLife.Models
{
    public class User
    {
        public string username { get; set; }
        public string password { get; set; }

        public User()
        {
        }

        public User(string username, string password)
        {
            this.username = username;
            this.password = password;
        }

        public override string ToString()
        {
            return username + password;
        }
    }
}