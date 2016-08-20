package routers

import (
	"mgweb/controllers"
	"github.com/astaxie/beego"
)

func init() {
    beego.Router("/", &controllers.MainController{})
    beego.Router("/login", &controllers.LoginController{})
    beego.Router("/logout", &controllers.LogoutController{})
    beego.Router("/insert", &controllers.InsertController{})
    beego.Router("/index", &controllers.IndexController{})
    beego.Router("/update", &controllers.UpdateController{})
    beego.Router("/remove", &controllers.RemoveController{})
    beego.Router("/drop", &controllers.DropController{})
}
