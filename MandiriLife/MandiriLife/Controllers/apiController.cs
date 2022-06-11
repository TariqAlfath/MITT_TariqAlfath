using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MandiriLife.Models;
using MandiriLife.Repos;

namespace MandiriLife.Controllers
{
    public class apiController : Controller
    {
        // GET: api
        public ActionResult Index()
        {
            return View();
        }
        [HttpGet]
        public bool Login(User user)
        {
            if(UserRepository.Login(user).ToString() == "")
            {
                return false;
            }
            else
            {
                Session["User"] = UserRepository.Login(user);
                var x = (UserProfile)Session["User"];
                return true;
            }
        }
        [HttpPost]
        public bool Register(UserProfile user)
        {
            if(UserProfileRepository.Register(user) == true)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        [HttpPost]
        public bool Update(UserProfile user)
        {
            if(UserProfileRepository.Update(user) == true)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        //CRUD Skill
        [HttpGet]
        public JsonResult GetSkills()
        {
            return Json(SkillRepository.GetSkills(), JsonRequestBehavior.AllowGet);
        }
        [HttpGet]
        public JsonResult GetSkill(int skillID)
        {
            return Json(SkillRepository.GetSkillsByID(skillID), JsonRequestBehavior.AllowGet);
        }
        [HttpPost]
        public JsonResult CreateSkill(Skill skill)
        {
            return Json(SkillRepository.CreateSkill(skill), JsonRequestBehavior.AllowGet);
        }
        [HttpPost]
        public JsonResult UpdateSkill(Skill skill)
        {
            return Json(SkillRepository.UpdateSkill(skill), JsonRequestBehavior.AllowGet);
        }
        [HttpPost]
        public JsonResult DeleteSkill(int skillID)
        {
            return Json(SkillRepository.DeleteSkill(skillID), JsonRequestBehavior.AllowGet);
        }

        //CRUD Skill Level
        [HttpGet]
        public JsonResult GetSkillsLevel()
        {
            return Json(SkillLevelRepository.GetSkillsLevel(), JsonRequestBehavior.AllowGet);
        }
        [HttpGet]
        public JsonResult GetSkillsLevelByID(int skillLevelID)
        {
            return Json(SkillLevelRepository.GetSkillsLevelByID(skillLevelID), JsonRequestBehavior.AllowGet);
        }
        [HttpPost]
        public JsonResult CreateSkillLevel(SkillLevel skillLevel)
        {
            return Json(SkillLevelRepository.CreateSkillLevel(skillLevel), JsonRequestBehavior.AllowGet);
        }
        [HttpPost]
        public JsonResult UpdateSkillLevel(SkillLevel skillLevel)
        {
            return Json(SkillLevelRepository.UpdateSkillLevel(skillLevel), JsonRequestBehavior.AllowGet);
        }
        [HttpPost]
        public JsonResult DeleteSkillLevel(int skillLevelID)
        {
            return Json(SkillLevelRepository.DeleteSkillLevel(skillLevelID), JsonRequestBehavior.AllowGet);
        }

        //CRUD UserSkills
        [HttpGet]
        public JsonResult GetUserkills(int userSkillID)
        {
            return Json(UserSkillsRepository.GetUserkills(userSkillID), JsonRequestBehavior.AllowGet);
        }
        [HttpGet]
        public JsonResult GetAllUserkills()
        {
            return Json(UserSkillsRepository.GetAllUserkills(), JsonRequestBehavior.AllowGet);
        }
        [HttpPost]
        public JsonResult CreateUserSkills(UserSkills userSkills)
        {
            //userSkills.username = ((UserProfile)Session["User"]).username;
            return Json(UserSkillsRepository.CreateUserSkills(userSkills), JsonRequestBehavior.AllowGet);
        }
        [HttpPost]
        public JsonResult UpdateUserSkills(UserSkills UserSkills)
        {
            return Json(UserSkillsRepository.UpdateUserSkills(UserSkills), JsonRequestBehavior.AllowGet);
        }
        [HttpPost]
        public JsonResult DeleteUserSkills(int UserSkillsID)
        {
            return Json(UserSkillsRepository.DeleteUserSkills(UserSkillsID), JsonRequestBehavior.AllowGet);
        }
    }
}