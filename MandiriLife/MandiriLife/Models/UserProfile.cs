using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MandiriLife.Models
{
    public class UserProfile
    {
        public User username { get; set; }
        public string name { get; set; }
        public string address { get; set; }
        public string bod{ get; set; }
        public string email { get; set; }

        public UserProfile()
        {
        }

        public UserProfile(User username, string name, string address, string bod, string email)
        {
            this.username = username;
            this.name = name;
            this.address = address;
            this.bod = bod;
            this.email = email;
        }

        public override string ToString()
        {
            return username.username+username.password;
        }
    }
}